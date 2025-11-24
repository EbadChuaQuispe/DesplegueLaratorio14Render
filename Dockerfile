# Imagen para build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiar todo el proyecto
COPY . .

# Restaurar dependencias usando la ruta correcta
RUN dotnet restore ./Lab14/Lab14/Lab14.csproj

# Publicar
RUN dotnet publish ./Lab14/Lab14/Lab14.csproj -c Release -o /app/publish

# Imagen de runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

COPY --from=build /app/publish .

# Puerto por defecto en Render
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "Lab14.dll"]
