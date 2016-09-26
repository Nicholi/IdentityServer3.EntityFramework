Param(
	[string]$buildNumber = "0",
	[string]$preRelease = "beta1",
	[string]$version = "2.6.0.1",
	[string]$nugetPath = "nuget.exe"
)

$exists = Test-Path $nugetPath

if ($exists -eq $false) {
    $source = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
    Invoke-WebRequest $source -OutFile nuget.exe
    $nugetPath = "nuget.exe"
}

. $nugetPath update -self

gci .\source -Recurse "packages.config" |% {
	"Restoring " + $_.FullName
	. $nugetPath install $_.FullName -o .\source\packages
}

$psake_version="4.4.2"
. $nugetPath install psake -OutputDirectory .\packages -Version "$psake_version" -Source "nuget.org" -Verbosity quiet

Import-Module .\packages\psake.$psake_version\tools\psake.psm1

if(Test-Path Env:\APPVEYOR_BUILD_NUMBER){
	$buildNumber = [int]$Env:APPVEYOR_BUILD_NUMBER
	Write-Host "Using APPVEYOR_BUILD_NUMBER"

	$task = "appVeyor"
}

"Build number $buildNumber"

Invoke-Psake .\default.ps1 $task -framework "4.0x64" -properties @{ buildNumber=$buildNumber; preRelease=$preRelease; nuget_path=$nugetPath; version=$version }

Remove-Module psake
