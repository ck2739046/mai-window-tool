unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, IniFiles, Windows, Variants;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  IsSleeping: Boolean;
  IniFile: TIniFile;
  ConfigFilePath: string;
  X, Y, W, H: Integer;
  WindowHandle1: HWND;
  WindowTitle1: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
// save config 1
begin
  // check sleep
  if IsSleeping then
    Exit;
  IsSleeping := True;
  // check parameters
  if (Edit1.Text = '') or (not TryStrToInt(Edit2.Text, W)) or
     (not TryStrToInt(Edit3.Text, H)) or (not TryStrToInt(Edit4.Text, X)) or
     (not TryStrToInt(Edit5.Text, Y)) then
  begin
    StatusBar1.Panels[1].Text := 'Invalid parameters';
    Application.ProcessMessages;
    Sleep(500);
    StatusBar1.Panels[1].Text := '';
    Application.ProcessMessages;
    IsSleeping := False;
    Exit;
  end;

  // get path: current dir + Config1.ini
  ConfigFilePath := ExtractFilePath(Application.ExeName) + 'Config1.ini';
  // create TIniFile object
  IniFile := TIniFile.Create(ConfigFilePath);

  try
    // write into config
    IniFile.WriteString('Config', '1', Edit1.Text); // title
    IniFile.WriteString('Config', '2', Edit2.Text); // width
    IniFile.WriteString('Config', '3', Edit3.Text); // height
    IniFile.WriteString('Config', '4', Edit4.Text); // left
    IniFile.WriteString('Config', '5', Edit5.Text); // top
    // print success
    StatusBar1.Panels[1].Text := 'Save success';
    Application.ProcessMessages;
    Sleep(500);
    StatusBar1.Panels[1].Text := '';
    Application.ProcessMessages;
  finally
    // free IniFile
    IniFile.Free;
  end;

  IsSleeping := False;

end;

procedure TForm1.Button2Click(Sender: TObject);
// save config 2
begin
  // check sleep
  if IsSleeping then
    Exit;
  IsSleeping := True;
  // check parameters
  if (Edit1.Text = '') or (not TryStrToInt(Edit2.Text, W)) or
     (not TryStrToInt(Edit3.Text, H)) or (not TryStrToInt(Edit4.Text, X)) or
     (not TryStrToInt(Edit5.Text, Y)) then
  begin
    StatusBar1.Panels[1].Text := 'Invalid parameters';
    Application.ProcessMessages;
    Sleep(500);
    StatusBar1.Panels[1].Text := '';
    Application.ProcessMessages;
    IsSleeping := False;
    Exit;
  end;

  // get path: current dir + Config2.ini
  ConfigFilePath := ExtractFilePath(Application.ExeName) + 'Config2.ini';
  // create TIniFile object
  IniFile := TIniFile.Create(ConfigFilePath);

  try
    // write into config
    IniFile.WriteString('Config', '1', Edit1.Text); // title
    IniFile.WriteString('Config', '2', Edit2.Text); // width
    IniFile.WriteString('Config', '3', Edit3.Text); // height
    IniFile.WriteString('Config', '4', Edit4.Text); // left
    IniFile.WriteString('Config', '5', Edit5.Text); // top
    // print success
    StatusBar1.Panels[1].Text := 'Save success';
    Application.ProcessMessages;
    Sleep(500);
    StatusBar1.Panels[1].Text := '';
    Application.ProcessMessages;
  finally
    // free IniFile
    IniFile.Free;
  end;

  IsSleeping := False;

end;

procedure TForm1.Button3Click(Sender: TObject);
// read config 1
begin
  // check sleep
  if IsSleeping then
    Exit;
  IsSleeping := True;
  // get path: current dir + Config1.ini
  ConfigFilePath := ExtractFilePath(Application.ExeName) + 'Config1.ini';
  // create TIniFile object
  IniFile := TIniFile.Create(ConfigFilePath);

  try
    // read from config
    Edit1.Text := IniFile.ReadString('Config', '1', ''); // title
    Edit2.Text := IniFile.ReadString('Config', '2', ''); // width
    Edit3.Text := IniFile.ReadString('Config', '3', ''); // height
    Edit4.Text := IniFile.ReadString('Config', '4', ''); // left
    Edit5.Text := IniFile.ReadString('Config', '5', ''); // top
  finally
    // free IniFile
    IniFile.Free;
  end;

  IsSleeping := False;

end;

procedure TForm1.Button4Click(Sender: TObject);
// read config 2
begin
  // check sleep
  if IsSleeping then
    Exit;
  IsSleeping := True;
  // get path: current dir + Config2.ini
  ConfigFilePath := ExtractFilePath(Application.ExeName) + 'Config2.ini';
  // create TIniFile object
  IniFile := TIniFile.Create(ConfigFilePath);

  try
    // read from config
    Edit1.Text := IniFile.ReadString('Config', '1', ''); // title
    Edit2.Text := IniFile.ReadString('Config', '2', ''); // width
    Edit3.Text := IniFile.ReadString('Config', '3', ''); // height
    Edit4.Text := IniFile.ReadString('Config', '4', ''); // left
    Edit5.Text := IniFile.ReadString('Config', '5', ''); // top
  finally
    // free IniFile
    IniFile.Free;
  end;

  IsSleeping := False;

end;

procedure TForm1.Button5Click(Sender: TObject);
// move window
begin
  // check sleep
  if IsSleeping then
    Exit;
  IsSleeping := True;
  // check parameters
  if (Edit1.Text = '') or (not TryStrToInt(Edit2.Text, W)) or
     (not TryStrToInt(Edit3.Text, H)) or (not TryStrToInt(Edit4.Text, X)) or
     (not TryStrToInt(Edit5.Text, Y)) then
  begin
    StatusBar1.Panels[1].Text := 'Invalid parameters';
    Application.ProcessMessages;
    Sleep(500);
    StatusBar1.Panels[1].Text := '';
    Application.ProcessMessages;
    IsSleeping := False;
    Exit;
  end;
  // get window title
  WindowTitle1 := Edit1.Text;
  WindowHandle1 := FindWindow(nil, PChar(WindowTitle1));
  // get new postion
  W := StrToInt(Edit2.Text);
  H := StrToInt(Edit3.Text);
  // get new size
  X := StrToInt(Edit4.Text);
  Y := StrToInt(Edit5.Text);
  // move window
  SetWindowPos(WindowHandle1, 0, X, Y, W, H, SWP_NOZORDER);

  IsSleeping := False;

end;

procedure TForm1.Button6Click(Sender: TObject);
// start game
var
  StartTime: Cardinal;
  Timeout: Cardinal;
  RemainingTime: Cardinal;
  Result: Cardinal;
  isTimeout: Boolean;
  Rect: TRect;
begin
  // check sleep
  if IsSleeping then
    Exit;
  IsSleeping := True;
  // check parameters
  if (Edit1.Text = '') or (not TryStrToInt(Edit2.Text, W)) or
     (not TryStrToInt(Edit3.Text, H)) or (not TryStrToInt(Edit4.Text, X)) or
     (not TryStrToInt(Edit5.Text, Y)) then
  begin
    StatusBar1.Panels[1].Text := 'Invalid parameters';
    Application.ProcessMessages;
    Sleep(500);
    StatusBar1.Panels[1].Text := '';
    Application.ProcessMessages;
    IsSleeping := False;
    Exit;
  end;

  // run start.bat
  Result := ShellExecute(0, 'open', 'start.bat', nil, nil, SW_SHOW);
  if Result <= 32 then
  begin
    StatusBar1.Panels[1].Text := Format('ShellExecuteError%d', [Result]);
    Application.ProcessMessages;
    Sleep(2000);
    StatusBar1.Panels[1].Text := '';
    Application.ProcessMessages;
    IsSleeping := False;
    Exit;
  end;

  // get window title
  WindowTitle1 := Edit1.Text;
  // set timeout 40s
  StartTime := GetTickCount;
  Timeout := 40000;
  isTimeout := True;

  // search window loop
  while (GetTickCount - StartTime < Timeout) do
  begin
    // calculate remaining time
    RemainingTime := 40 - (GetTickCount - StartTime) div 1000;
    // print remaining time
    StatusBar1.Panels[1].Text := Format('Searching...%d', [RemainingTime]);
    // update UI
    Application.ProcessMessages;
    // search window title
    WindowHandle1 := FindWindow(nil, PChar(WindowTitle1));
    // if window found
    if WindowHandle1 <> 0 then
    begin
      isTimeout := False;
      Break;
    end;
    // sleep
    Sleep(300);
  end;

  // if timeout
  if isTimeout then
  begin
    StatusBar1.Panels[1].Text := 'Window not found';
    Application.ProcessMessages;
    Sleep(2000);
    StatusBar1.Panels[1].Text := '';
    Application.ProcessMessages;
    IsSleeping := False;
    Exit;
  end;

  // get new postion
  W := StrToInt(Edit2.Text);
  H := StrToInt(Edit3.Text);
  // get new size
  X := StrToInt(Edit4.Text);
  Y := StrToInt(Edit5.Text);
  // set timeout 20s
  StartTime := GetTickCount;
  Timeout := 20000;
  isTimeout := True;

  // adjust window loop
  while (GetTickCount - StartTime < Timeout) do
  begin
    // calculate remaining time
    RemainingTime := 20 - (GetTickCount - StartTime) div 1000;
    // print remaining time
    StatusBar1.Panels[1].Text := Format('Adjusting...%d', [RemainingTime]);
    // update UI
    Application.ProcessMessages;
    // check window position and size
    GetWindowRect(WindowHandle1, Rect);
    if (Rect.Left <> X) or (Rect.Top <> Y) or (Rect.Right - Rect.Left <> W) or (Rect.Bottom - Rect.Top <> H) then
       // try adjust window
       SetWindowPos(WindowHandle1, 0, X, Y, W, H, SWP_NOZORDER)
    else
    begin
      // adjust success
      IsSleeping := False;
      isTimeout := False;
      Close;
      Exit;
    end;
    // sleep
    Sleep(1000);
  end;

  // if timeout
  if isTimeout then
  begin
    StatusBar1.Panels[1].Text := 'Window not popup';
    Application.ProcessMessages;
    Sleep(2000);
    StatusBar1.Panels[1].Text := '';
    Application.ProcessMessages;
    IsSleeping := False;
    Exit;
  end;

end;

end.

