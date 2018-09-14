FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY ./src/azure-pipelines-test/*.csproj ./src/azure-pipelines-test/
COPY ./test/azure-test/*.csproj ./test/azure-test/
RUN dotnet restore

# copy everything else and build app
COPY ./src/azure-pipelines-test/. ./src/azure-pipelines-test/
COPY ./test/azure-test/. ./test/azure-test/
WORKDIR /app/src/azure-pipelines-test
RUN dotnet publish -c Release -o out


FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/src/azure-pipelines-test/out ./
ENTRYPOINT ["dotnet", "azure-pipelines-test.dll"]