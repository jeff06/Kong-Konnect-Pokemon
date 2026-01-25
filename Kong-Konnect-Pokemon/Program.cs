using Kong_Konnect_Pokemon;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

// app.UseHttpsRedirection();


app.MapGet("/api/v2/pokemon/Pikachu", () => Results.Ok(new SimpleClass("Pikachu from Local")));
app.MapGet("/api/v2/pokemon/Charizard", () => Results.Ok(new SimpleClass("Charizard from Local")));
app.MapGet("/api/v2/pokemon/Eevee", () => Results.Ok(new SimpleClass("Eevee from Local")));
app.MapGet("/status/healthy", () => Results.Ok(new SimpleClass("Healthy")));
app.MapGet("/status/unhealthy", () => Results.InternalServerError(new SimpleClass("Unhealthy")));

app.Run();