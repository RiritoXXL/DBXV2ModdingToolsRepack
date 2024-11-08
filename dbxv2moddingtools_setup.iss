; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "DBXV2 Modding Tools"
#define MyAppVersion "1.0"
#define MyAppPublisher "RepackFromRiritoXXL"
#define MyMusicFilename "DBXV2_PlanetNamek.mp3"
[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{921C7FDC-B490-4632-A405-4AC1CD75A4F6}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=C:\Users\aqax\Documents\BSD3Clause.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=dbxv2_setupmoddingtools
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
[Code]
function BASS_Init(device: Integer; freq, flags: DWORD; win: hwnd; CLSID: Integer): Boolean;
external 'BASS_Init@files:bass.dll stdcall';
 
function BASS_StreamCreateFile(mem: BOOL; f: PAnsiChar; offset1: DWORD; offset2: DWORD; length1: DWORD; length2: DWORD; flags: DWORD): DWORD;
external 'BASS_StreamCreateFile@files:bass.dll stdcall';
 
function BASS_Start(): Boolean;
external 'BASS_Start@files:bass.dll stdcall';
 
function BASS_ChannelPlay(handle: DWORD; restart: BOOL): Boolean;
external 'BASS_ChannelPlay@files:bass.dll stdcall';

function BASS_Stop(): Boolean;
external 'BASS_Stop@files:bass.dll stdcall';
 
function BASS_Free(): Boolean;
external 'BASS_Free@files:bass.dll stdcall';
const
  BASS_SAMPLE_LOOP = 4;
var
  mp3Handle: HWND;
  mp3Name: string;
procedure InitializeWizard();
begin
    ExtractTemporaryFile('{#MyMusicFilename}');
    mp3Name := ExpandConstant('{tmp}\{#MyMusicFilename}');
    BASS_Init(-1, 48000, 0, 0, 0);
    mp3Handle := BASS_StreamCreateFile(FALSE, PAnsiChar(mp3Name), 0, 0, 0, 0, BASS_SAMPLE_LOOP);
    BASS_Start();
    BASS_ChannelPlay(mp3Handle, False);
end;
procedure DeinitializeSetup();
begin
  BASS_Free();
  BASS_Stop();
end;

[Files]
Source: "DBXV2_PlanetNamek.mp3"; DestDir: "{tmp}"; Flags: dontcopy ignoreversion
Source: "C:\Include_InnoSetup\bass.dll"; DestDir: {tmp}; Flags: dontcopy ignoreversion
Source: "C:\DBXV2ModdingTools\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

