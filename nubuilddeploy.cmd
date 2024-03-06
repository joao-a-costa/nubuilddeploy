@echo off

:: TODO: Get file version from file and replace search variable. Increment one on replace

set "search=#YOUR_OLD_PROJECT_VERSION#"
set "replace=#YOUR_NEW_PROJECT_VERSION#"
set "project_base=#YOUR_PROJECT#"
set "project_base_csproj=%project_base%.Lib.csproj"
set "nuget_key=#YOUR_NUGET_KEY#"
set "file_temp=tempfile.txt"
set "file=AssemblyInfo.cs"
set "file_path=%file%"
set "branch=main"

cd Properties

:: Create a temporary file
set "temp_file=%temp%\%file_temp%"

:: Use PowerShell to find and replace the version number
powershell -Command "(gc %file%) -replace '%search%', '%replace%' | Out-File %temp_file%"

:: Replace the original file with the modified one
xcopy /y "%temp_file%" "%file_path%"

:: Delete the temporary file
del "%temp_file%"

cd ..

set "file=%project_base%.Lib.nuspec"
set "file_path=%file%"

:: Create a temporary file
set "temp_file=%temp%\%file_temp%"

:: Use PowerShell to find and replace the version number in XML
powershell -Command "(gc '%file%') -replace '%search%', '%replace%' | Out-File %temp_file%"

:: Replace the original file with the modified one
xcopy /y "%temp_file%" "%file_path%"

:: Delete the temporary file
del "%temp_file%"

msbuild "%project_base_csproj%" /p:Configuration=Release /p:Platform=x86
msbuild "%project_base_csproj%" /p:Configuration=Release /p:Platform=AnyCPU
git checkout %branch%
git pull
git commit -a -m "v%replace%" && git push
nuget pack %project_base%.Lib.nuspec -Properties Configuration=Release;Platform=*
dotnet nuget push %project_base%.%replace%.nupkg --api-key %nuget_key% --source https://api.nuget.org/v3/index.json --skip-duplicate
git tag -a v%replace% -m "v%replace%"
del /S *.nupkg