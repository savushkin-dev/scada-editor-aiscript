# Эталонный прогон BN1 для отчёта руководителю (docs/baseline/)
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

$OutDir = Join-Path $Root "docs\baseline\out-bn1"
$MetaDir = Join-Path $Root "docs\baseline\meta"
$BaselineDir = Join-Path $Root "docs\baseline"

New-Item -ItemType Directory -Force -Path $BaselineDir | Out-Null
if (Test-Path $OutDir) { Remove-Item -Recurse -Force $OutDir }
if (Test-Path $MetaDir) { Remove-Item -Recurse -Force $MetaDir }
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
New-Item -ItemType Directory -Force -Path $MetaDir | Out-Null

Write-Host "=== mvnw test ==="
& .\mvnw.cmd test -q
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "=== mvnw package ==="
& .\mvnw.cmd -DskipTests package -q
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$Jar = Join-Path $Root "target\scada-generator-0.1.0-SNAPSHOT.jar"
$Lua = "data\BN1_Rastvorenie\BN1_Rastvorenie\docs"
$Scripts = "data\BN1_Rastvorenie_scripts\scripts.txt"
$Mapping = "data\BN1_Rastvorenie_scripts\type-mapping.yaml"

Write-Host "=== generate -s ==="
& java -jar $Jar generate -l $Lua -o $OutDir -s $Scripts --type-mapping $Mapping
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "=== update -s ==="
& java -jar $Jar update -l $Lua -e $OutDir -m $MetaDir -s $Scripts --type-mapping $Mapping
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Copy-Item (Join-Path $MetaDir "update-report.log") (Join-Path $BaselineDir "update-report.log") -Force

# Краткая сводка для PM
$reportPath = Join-Path $BaselineDir "update-report.log"
$unitsXml = Join-Path $OutDir "Units.xml"
$unitsScript = Join-Path $OutDir "Units.script"

$unitCount = 0
if (Test-Path $unitsXml) {
    $xml = Get-Content $unitsXml -Raw
    $unitCount = ([regex]::Matches($xml, "<unit>")).Count
}

$handlerCount = 0
if (Test-Path $unitsScript) {
    $handlerCount = ([regex]::Matches((Get-Content $unitsScript -Raw), "function extern")).Count
}

$matchedNo = 0
$unknown = 0
if (Test-Path $reportPath) {
    $lines = Get-Content $reportPath
    foreach ($line in $lines) {
        if ($line -match "^matched_no_handlers=(\d+)") { $matchedNo = [int]$Matches[1] }
        if ($line -match "^unknown_type=(\d+)") { $unknown = [int]$Matches[1] }
    }
}

$summaryPath = Join-Path $BaselineDir "BASELINE_SUMMARY.md"
@"
# Baseline BN1 summary

Date: $(Get-Date -Format "yyyy-MM-dd HH:mm")
Script: scripts/run-baseline.ps1

## Metrics

| Metric | Value |
|--------|-------|
| Units in Units.xml | $unitCount |
| function extern in Units.script (after generate) | $handlerCount |
| matched_no_handlers (update) | $matchedNo |
| unknown_type (update) | $unknown |

## Files

- docs/baseline/out-bn1/Units.xml
- docs/baseline/out-bn1/Units.script
- docs/baseline/update-report.log
- docs/baseline/tag-prefixes-stats.csv

"@ | Out-File -FilePath $summaryPath -Encoding utf8

$prefixes = @{}
if (Test-Path $unitsXml) {
    [regex]::Matches((Get-Content $unitsXml -Raw), 'id="([^"]+)"') | ForEach-Object {
        $id = $_.Groups[1].Value
        if ($id -match '^([A-Za-z]+\d*)') {
            $p = $Matches[1]
            if (-not $prefixes.ContainsKey($p)) { $prefixes[$p] = 0 }
            $prefixes[$p]++
        }
    }
}
$prefixLines = New-Object System.Collections.Generic.List[string]
$prefixLines.Add("prefix;count")
$prefixes.GetEnumerator() | Sort-Object Value -Descending | ForEach-Object {
    $prefixLines.Add("$($_.Key);$($_.Value)")
}
$prefixLines | Out-File (Join-Path $BaselineDir "tag-prefixes-stats.csv") -Encoding utf8

Write-Host ""
Write-Host "Done. See docs/baseline/BASELINE_SUMMARY.md"
