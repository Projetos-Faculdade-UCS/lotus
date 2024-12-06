# PowerShell script to build the WiX installer

# Configuration
$productVersion = "1.0.0.0"
$configuration = "Release"
$platform = "x64"
$buildDir = "..\..\build\windows\$platform\runner\$configuration"
$outputDir = "installer"

# Check and install WiX UI extension if needed
Write-Host "Checking WiX UI extension..."
$wixExtension = & wix extension list | Select-String "WixToolset.UI.wixext"
if (!$wixExtension) {
    Write-Host "Installing WiX UI extension..."
    & wix extension add -g WixToolset.UI.wixext
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: Failed to install WiX UI extension"
        exit 1
    }
}

# Create output directory if it doesn't exist
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Force -Path $outputDir
}

# Generate file list
Write-Host "Generating file list..."
& wix dir $buildDir -prefix INSTALLFOLDER -out files.wxs
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to generate file list"
    exit 1
}

# Build the installer
Write-Host "Building installer..."
& wix build `
    -arch x64 `
    -d BinaryDir="$buildDir" `
    -d ProductVersion="$productVersion" `
    -ext WixToolset.UI.wixext `
    main.wxs files.wxs `
    -o "$outputDir\Lotus-$productVersion-$platform.msi"

if ($LASTEXITCODE -eq 0) {
    Write-Host "Installer built successfully!"
} else {
    Write-Host "Error: WiX build failed"
    exit 1
}