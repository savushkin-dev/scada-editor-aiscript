# Live demo for PM presentation (out-demo/)
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

$OutDir = Join-Path $Root "out-demo"
$MetaDir = Join-Path $Root "out-demo-meta"
$Jar = Join-Path $Root "target\scada-generator-0.1.0-SNAPSHOT.jar"
$Lua = "data\BN1_Rastvorenie\BN1_Rastvorenie\docs"
$Scripts = "data\BN1_Rastvorenie_scripts\scripts.txt"
$Mapping = "data\BN1_Rastvorenie_scripts\type-mapping.yaml"

if (-not (Test-Path $Jar)) {
    Write-Host "Building jar..."
    & .\mvnw.cmd -DskipTests package -q
}

if (Test-Path $OutDir) { Remove-Item -Recurse -Force $OutDir }
if (Test-Path $MetaDir) { Remove-Item -Recurse -Force $MetaDir }

Write-Host "=== generate -s ==="
& java -jar $Jar generate -l $Lua -o $OutDir -s $Scripts --type-mapping $Mapping

Write-Host "=== update -s ==="
& java -jar $Jar update -l $Lua -e $OutDir -m $MetaDir -s $Scripts --type-mapping $Mapping

Write-Host ""
Write-Host "Demo output:"
Write-Host "  $OutDir\Units.xml"
Write-Host "  $OutDir\Units.script"
Write-Host "  $MetaDir\update-report.log"
