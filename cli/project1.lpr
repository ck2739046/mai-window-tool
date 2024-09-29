program project1;

{$mode objfpc}{$H+}

uses
  SysUtils, Windows, IniFiles;

var
  WindowHandle1: HWND;
  WindowTitle: string;
  X1, Y1, Width1, Height1: Integer;
  IniFile: TIniFile;
  ConfigFilePath: string;
  StartTime: Cardinal;
  Timeout: Cardinal;
  Edit1, Edit2, Edit3, Edit4, Edit5: string;
begin
  // get current dir + Config.ini
  ConfigFilePath := ExtractFilePath(ParamStr(0)) + 'Config.ini';
  // create TIniFile object
  IniFile := TIniFile.Create(ConfigFilePath);
  try
    // read from config
    Edit1 := IniFile.ReadString('Config', '1', ''); // title
    Edit2 := IniFile.ReadString('Config', '2', ''); // width
    Edit3 := IniFile.ReadString('Config', '3', ''); // height
    Edit4 := IniFile.ReadString('Config', '4', ''); // left
    Edit5 := IniFile.ReadString('Config', '5', ''); // top
  finally
    // free IniFile
    IniFile.Free;
  end;

  // check parameters
  if (Edit1 = '') or (not TryStrToInt(Edit2, Width1)) or
     (not TryStrToInt(Edit3, Height1)) or (not TryStrToInt(Edit4, X1)) or
     (not TryStrToInt(Edit5, Y1)) then
  begin
    Writeln('Invalid values. Please check Config.ini.');
    Exit;
  end;

  // run start.bat
  ShellExecute(0, 'open', 'start.bat', nil, nil, SW_SHOW);
  // get window title
  WindowTitle := Edit1;
  // set timeout 20s
  StartTime := GetTickCount;
  Timeout := 20000;

  // search window loop
  while (GetTickCount - StartTime < Timeout) do
  begin
    // search window title
    WindowHandle1 := FindWindow(nil, PChar(WindowTitle));

    // if window found
    if WindowHandle1 <> 0 then
    begin
      // get new postion
      Width1 := StrToInt(Edit2);
      Height1 := StrToInt(Edit3);
      // get new size
      X1 := StrToInt(Edit4);
      Y1 := StrToInt(Edit5);
      // move window
      Sleep(4000);
      SetWindowPos(WindowHandle1, 0, X1, Y1, Width1, Height1, SWP_NOZORDER);
      sleep(500);
      Exit;
    end;
    Sleep(100);
  end;

  // timeout
  Writeln('game window not found, quit in 3 seconds...');
  Sleep(3000);
  Exit;

end.
