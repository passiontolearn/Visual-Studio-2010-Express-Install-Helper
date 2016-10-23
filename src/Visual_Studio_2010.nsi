;Visual Studio 2010 Express Install Helper
; v0.1
;
; The objective of this installer is to simplify the installation
; for new students who don't know how to extract Microsoft's ISO file.
;
; This installer simply extracts and runs the setup of this publicly available ISO:
; http://download.microsoft.com/download/1/E/5/1E5F1C0A-0D5B-426A-A603-1798B951DDAE/VS2010Express1.iso
;
; NOTE: Visual Studio 2010 Express is owned and copyrighted by © Microsoft. All Rights Reserved.
;        I just wrote this small wrapper to make it easier for first time students to get started.
;
;Written by Adam Ben Ezer

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "Install MS Visual Studio 2010"
  OutFile "Visual_Studio_2010_Installer.exe"

  ;Default installation folder
  InstallDir "$TEMP\Visual_Studio_2010_Installer"
  
  ;Request application privileges for Windows Vista
  ;RequestExecutionLevel user

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  ;!insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  ;!insertmacro MUI_PAGE_COMPONENTS
  ;!insertmacro MUI_PAGE_DIRECTORY
  ;!insertmacro MUI_PAGE_INSTFILES
  
  ;!insertmacro MUI_UNPAGE_CONFIRM
  ;!insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecDummy ${LANG_ENGLISH} "Microsoft Visual Studio 2010 Express."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END
  
  
;--------------------------------
;Installer Sections

Section "Microsoft Visual Studio 2010 Express" SecDummy

  SetOutPath "$INSTDIR"
  
  ;ADD YOUR OWN FILES HERE...
  File /r *
  
  ; Thanks to https://nsis-dev.github.io/NSIS-Forums/html/t-238704.html
  ExecShell "open" "$INSTDIR\setup.hta"
    
  ;ExecWait '"$INSTDIR\setup.hta"'   ; doesn't work!
  ;ExecShell '""$INSTDIR\setup.hta"' ; doesn't work!
  
  
  ;Store installation folder
  ;WriteRegStr HKCU "Software\Visual Studio 2010 Express Install Helper" "" $INSTDIR
  
  ;Create uninstaller
  ;WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

;--------------------------------
;Uninstaller Section

;Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  ;Delete "$INSTDIR\Uninstall.exe"

  ;RMDir "$INSTDIR"

  ;DeleteRegKey /ifempty HKCU "Software\Visual Studio 2010 Express Install Helper"

;SectionEnd
