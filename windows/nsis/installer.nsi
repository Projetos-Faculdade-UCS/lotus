!include "MUI2.nsh"

# Installer settings
Name "Lotus"
OutFile "Lotus-Setup.exe"
InstallDir "$PROGRAMFILES64\Lotus"
RequestExecutionLevel admin

# Version info
VIProductVersion "1.0.0.0"
VIAddVersionKey "ProductName" "Lotus"
VIAddVersionKey "FileDescription" "Lotus Installer"
VIAddVersionKey "LegalCopyright" "© 2024"
VIAddVersionKey "FileVersion" "1.0.0.0"

# Interface settings
!define MUI_ABORTWARNING

# Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

# Languages
!insertmacro MUI_LANGUAGE "English"

# Installation section
Section "MainSection" SEC01
    SetOutPath "$INSTDIR"
    
    # Add files from build directory
    File /r "..\..\build\windows\x64\runner\Release\*.*"
    
    # Create uninstaller
    WriteUninstaller "$INSTDIR\Uninstall.exe"
    
    # Create start menu shortcut
    CreateDirectory "$SMPROGRAMS\Lotus"
    CreateShortcut "$SMPROGRAMS\Lotus\Lotus.lnk" "$INSTDIR\lotus.exe"
    
    # Registry information for add/remove programs
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Lotus" \
                     "DisplayName" "Lotus"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Lotus" \
                     "UninstallString" "$\"$INSTDIR\Uninstall.exe$\""
SectionEnd

# Uninstaller section
Section "Uninstall"
    # Remove installed files
    RMDir /r "$INSTDIR"
    
    # Remove start menu items
    RMDir /r "$SMPROGRAMS\Lotus"
    
    # Remove registry keys
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Lotus"
SectionEnd
