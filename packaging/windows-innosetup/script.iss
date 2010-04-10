; Setup script for use with Inno Setup.

[Setup]
AppName=Open Asset Import Library - SDK
AppVerName=Open Asset Import Library - SDK (v1.1)
DefaultDirName={pf}\Assimp
DefaultGroupName=Assimp
UninstallDisplayIcon={app}\bin\x86\assimp.exe
OutputDir=out
AppCopyright=Assimp Development Team
SetupIconFile=..\..\tools\shared\assimp_tools_icon.ico
WizardImageFile=compiler:WizModernImage-IS.BMP
WizardSmallImageFile=compiler:WizModernSmallImage-IS.BMP
LicenseFile=License.rtf
OutputBaseFileName=assimp-sdk-1.1rc-setup
VersionInfoVersion=1.1.0.0
VersionInfoTextVersion=1.1rc
VersionInfoCompany=Assimp Development Team
ArchitecturesInstallIn64BitMode=x64

[Types]
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation, no test models or language bindings"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "main"; Description: "Main Files"; Types: full compact custom; Flags: fixed
Name: "tools"; Description: "Asset Viewer & Command Line Tools"; Types: full compact
Name: "help"; Description: "Help Files"; Types: full compact
Name: "samples"; Description: "Samples"; Types: full
;Name: "wsource"; Description: "Source Code"; Types: full
Name: "test"; Description: "Test Models"; Types: full
Name: "pyassimp"; Description: "Python Bindings"; Types: full
Name: "dassimp"; Description: "D Bindings"; Types: full
;Name: "vc8"; Description: "VC8 project files"; Types: full
;Name: "vc9"; Description: "VC9 project files"; Types: full

[Run]
Filename: "{app}\stub\vcredist_x86.exe"; StatusMsg: "Installing VS2005 SP1 redistributable package (32 Bit)"; Check: not IsWin64
Filename: "{app}\stub\vcredist_x64.exe"; StatusMsg: "Installing VS2005 SP1 redistributable package (64 Bit)"; Check: IsWin64

[Files]

Source: "readme_installer.txt"; DestDir: "{app}"; Flags: isreadme

; Installer stub
Source: "vcredist_x86.exe"; DestDir: "{app}\stub\"; Check: not IsWin64
Source: "vcredist_x64.exe"; DestDir: "{app}\stub\"; Check: IsWin64

; Common stuff
Source: "..\..\CREDITS"; DestDir: "{app}"
Source: "..\..\LICENSE"; DestDir: "{app}"
Source: "..\..\README"; DestDir: "{app}"
Source: "WEB"; DestDir: "{app}"

Source: "..\..\scripts\*"; DestDir: "{app}\scripts"; Flags: recursesubdirs

; x86 binaries
Source: "..\..\bin\assimp_release-dll_Win32\Assimp32.dll"; DestDir: "{app}\bin\x86"
Source: "..\..\bin\assimpview_release-dll_Win32\assimp_view.exe"; DestDir: "{app}\bin\x86"; Components: tools
Source: "..\..\bin\assimpcmd_release-dll_Win32\assimp.exe"; DestDir: "{app}\bin\x86"; Components: tools

; x64 binaries
Source: "..\..\bin\assimp_release-dll_x64\Assimp64.dll"; DestDir: "{app}\bin\x64"
Source: "..\..\bin\assimpview_release-dll_x64\assimp_view.exe"; DestDir: "{app}\bin\x64"; Components: tools
Source: "..\..\bin\assimpcmd_release-dll_x64\assimp.exe"; DestDir: "{app}\bin\x64"; Components: tools

; Documentation
Source: "..\..\doc\AssimpDoc_Html\AssimpDoc.chm"; DestDir: "{app}\doc"; Components: help
Source: "..\..\doc\AssimpCmdDoc_Html\AssimpCmdDoc.chm"; DestDir: "{app}\doc"; Components: help
Source: "..\..\doc\datastructure.xml"; DestDir: "{app}\doc"; Components: help

; Import libraries
Source: "..\..\lib\assimp_release-dll_Win32\assimp.lib"; DestDir: "{app}\lib\x86"
Source: "..\..\lib\assimp_release-dll_x64\assimp.lib"; DestDir: "{app}\lib\x64"

; Samples
Source: "..\..\samples\*"; DestDir: "{app}\samples"; Flags: recursesubdirs; Components: samples

; Include files
Source: "..\..\include\*"; DestDir: "{app}\include"; Flags: recursesubdirs

; dAssimp
Source: "..\..\port\dAssimp\*"; DestDir: "{app}\port\D"; Flags: recursesubdirs; Components: dassimp

; PyAssimp
Source: "..\..\port\PyAssimp\*"; DestDir: "{app}\port\Python"; Excludes: "*.pyc,*.dll"; Flags: recursesubdirs; Components: pyassimp

; Test repository
Source: "..\..\test\models\*"; DestDir: "{app}\test\models"; Flags: recursesubdirs; Components: test
Source: "..\..\test\regression\*"; DestDir: "{app}\test\regression"; Flags: recursesubdirs; Components: test

; Source Code & Workspaces
;Source: "..\..\code\*"; Excludes: "*.o"; DestDir: "{app}\code"; Flags: recursesubdirs; Components: wsource
;Source: "..\..\workspaces\vc8\*.sln"; DestDir: "{app}\workspaces\vc8"; Components: wsource and vc8
;Source: "..\..\workspaces\vc8\*.vcproj"; DestDir: "{app}\workspaces\vc8"; Components: wsource and vc8
;Source: "..\..\workspaces\vc9\*.sln"; DestDir: "{app}\workspaces\vc9"; Components: wsource and vc9
;Source: "..\..\workspaces\vc9\*.vcproj"; DestDir: "{app}\workspaces\vc9"; Components: wsource and vc9

; Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\Assimp Manual"; Filename: "{app}\doc\AssimpDoc.chm" ; Components: help
Name: "{group}\Assimp Command Line Manual"; Filename: "{app}\doc\AssimpCmdDoc.chm"; Components: help
Name: "{group}\AssimpView"; Filename: "{app}\bin\x64\assimp_view.exe"; Components: tools; Check: IsWin64
Name: "{group}\AssimpView"; Filename: "{app}\bin\x86\assimp_view.exe"; Components: tools; Check: not IsWin64