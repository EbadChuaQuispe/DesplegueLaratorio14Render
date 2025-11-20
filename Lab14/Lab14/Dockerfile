# 1. ETAPA DE CONSTRUCCIÓN (BUILD)
# Usa la imagen base de .NET 9.0 SDK para compilar
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copia el archivo de proyecto (y su subcarpeta) y restaura dependencias
COPY ./Lab14/Lab14.csproj ./Lab14/
    RUN dotnet restore ./Lab14/Lab14.csproj

# Copia el resto del código fuente del repositorio
COPY . .

# Cambia el directorio de trabajo a la carpeta del proyecto para publicar
    WORKDIR "/src/Lab14" 

# Publica la aplicación en modo Release
RUN dotnet publish "Lab14.csproj" -c Release -o /app/publish

# 2. ETAPA DE EJECUCIÓN (RUNTIME)
# Usa la imagen base de .NET 9.0 ASP.NET (más pequeña y segura para ejecución)
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS final
WORKDIR /app

# Copia los archivos publicados de la etapa 'build'
COPY --from=build /app/publish .

# Define el punto de entrada (Start Command) para ejecutar la DLL
    ENTRYPOINT ["dotnet", "Lab14.dll"]