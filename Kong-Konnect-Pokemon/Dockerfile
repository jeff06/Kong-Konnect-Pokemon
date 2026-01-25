# Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# Copy the project file and restore dependencies
# The context is the directory containing the Dockerfile (Kong-Konnect-Pokemon/)
COPY ["Kong-Konnect-Pokemon.csproj", "./"]
RUN dotnet restore "Kong-Konnect-Pokemon.csproj"

# Copy the rest of the code and build the application
COPY . .
RUN dotnet build "Kong-Konnect-Pokemon.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Publish the application
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "Kong-Konnect-Pokemon.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Use the ASP.NET runtime image for the final stage
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

# Generate a self-signed certificate for development/demonstration
# In a production environment, you should use a proper certificate
USER root
RUN apt-get update && apt-get install -y openssl && \
    openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365 -nodes -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost" && \
    openssl pkcs12 -export -out aspnetapp.pfx -inkey key.pem -in cert.pem -password pass:password && \
    chown $APP_UID:$APP_UID aspnetapp.pfx

COPY --from=publish /app/publish .
USER $APP_UID
ENTRYPOINT ["dotnet", "Kong-Konnect-Pokemon.dll"]