program cli;

{$mode objfpc}{$H+}

uses
  SysUtils, Windows, IniFiles;

var
  WindowHandle1: HWND;
  WindowTitle: string;
  X, Y, W, H: Integer;
  IniFile: TIniFile;
  ConfigFilePath: string;
  StartTime: Cardinal;
  Timeout: Cardinal;
  Edit1, Edit2, Edit3, Edit4, Edit5: string;
  RemainingTime: Cardinal;
  Result: Cardinal;

{$R *.res}

begin

  // -------------------------------------------------
  // 1. load config.ini

  Writeln('Load Config.ini...');
  // get path: current dir + Config.ini
  ConfigFilePath := ExtractFilePath(ParamStr(0)) + 'Config.ini';
  // create TIniFile object
  IniFile := TIniFile.Create(ConfigFilePath);
  // read parameters from config
  Edit1 := IniFile.ReadString('Config', '1', ''); // title
  Edit2 := IniFile.ReadString('Config', '2', ''); // width
  Edit3 := IniFile.ReadString('Config', '3', ''); // height
  Edit4 := IniFile.ReadString('Config', '4', ''); // left
  Edit5 := IniFile.ReadString('Config', '5', ''); // top
  // free IniFile
  IniFile.Free;
  // check parameters read
  if (Edit1 = '') or (not TryStrToInt(Edit2, W)) or
     (not TryStrToInt(Edit3, H)) or (not TryStrToInt(Edit4, X)) or
     (not TryStrToInt(Edit5, Y)) then
  begin
    // print error message
    Writeln('--Fail to load Config.ini, quit in 5 seconds...');
    Sleep(5000);
    ExitProcess(1);
  end;

  // -------------------------------------------------
  // 2. start game

  Writeln('Run start.bat...');
  // run start.bat
  Result := ShellExecute(0, 'open', 'start.bat', nil, nil, SW_SHOW);
  if Result <= 32 then
  begin
    Writeln('--ShellExecuteError: ', Result);
    Writeln('--Fail to run start.bat, quit in 5 seconds...');
    Sleep(5000);
    ExitProcess(1);
  end;

  // -------------------------------------------------
  // 3. reset window

  // get window title
  WindowTitle := Edit1;
  // set timeout 40s
  StartTime := GetTickCount;
  Timeout := 40000;

  // search window loop
  while (GetTickCount - StartTime < Timeout) do
  begin

    // calculate remaining time
    RemainingTime := 40 - (GetTickCount - StartTime) div 1000;
    // print remaining time
    if RemainingTime < 10 then
      Write('Search game window...', RemainingTime, ' ', #13)
    else
      Write('Search game window...', RemainingTime, #13);
    // search window title
    WindowHandle1 := FindWindow(nil, PChar(WindowTitle));

    // if window found
    if WindowHandle1 <> 0 then
    begin
      Writeln('');
      Writeln('Game window found');
      // get new postion
      W := StrToInt(Edit2);
      H := StrToInt(Edit3);
      // get new size
      X := StrToInt(Edit4);
      Y := StrToInt(Edit5);
      // wait window show up
      Sleep(10000);
      // reset window
      SetWindowPos(WindowHandle1, 0, X, Y, W, H, SWP_NOZORDER);
      Exit;
    end;
    Sleep(200);
  end;

  // if timeout
  Writeln('--Game window not found, quit in 5 seconds...');
  Sleep(5000);
  ExitProcess(1);

end.