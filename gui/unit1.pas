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
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit3Change(Sender: TObject);
begin

end;

procedure TForm1.Edit4Change(Sender: TObject);
begin

end;

procedure TForm1.Edit5Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
// save config 1
var
   IniFile1: TIniFile;
   ConfigFilePath1: string;
begin
  // get current dir + Config1.ini
  ConfigFilePath1 := ExtractFilePath(Application.ExeName) + 'Config1.ini';
  // create TIniFile object
  IniFile1 := TIniFile.Create(ConfigFilePath1);

  try
    // write into config
    IniFile1.WriteString('Config', '1', Edit1.Text); // title
    IniFile1.WriteString('Config', '2', Edit2.Text); // width
    IniFile1.WriteString('Config', '3', Edit3.Text); // height
    IniFile1.WriteString('Config', '4', Edit4.Text); // left
    IniFile1.WriteString('Config', '5', Edit5.Text); // top
    ShowMessage('Config1.ini Save Success');
  finally
    // free IniFile
    IniFile1.Free;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
// save config 2
var
   IniFile2: TIniFile;
   ConfigFilePath2: string;
begin
  // get current dir + Config2.ini
  ConfigFilePath2 := ExtractFilePath(Application.ExeName) + 'Config2.ini';
  // create TIniFile object
  IniFile2 := TIniFile.Create(ConfigFilePath2);

  try
    // write into config
    IniFile2.WriteString('Config', '1', Edit1.Text); // title
    IniFile2.WriteString('Config', '2', Edit2.Text); // width
    IniFile2.WriteString('Config', '3', Edit3.Text); // height
    IniFile2.WriteString('Config', '4', Edit4.Text); // left
    IniFile2.WriteString('Config', '5', Edit5.Text); // top
    ShowMessage('Config2.ini Save Success');
  finally
    // free IniFile
    IniFile2.Free;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
// read config 1
var
  IniFile: TIniFile;
  ConfigFilePath: string;
begin
  // get current dir + Config1.ini
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

end;

procedure TForm1.Button4Click(Sender: TObject);
// read config 2
var
  IniFile: TIniFile;
  ConfigFilePath: string;
begin
  // get current dir + Config2.ini
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

end;

procedure TForm1.Button5Click(Sender: TObject);
// move window
var
  WindowHandle1: HWND;
  WindowTitle1: string;
  X1, Y1, Width1, Height1: Integer;
begin
  // check parameters
  if not TryStrToInt(Edit2.Text, Width1) then
  begin
    ShowMessage('invalid Width');
    Exit;
  end;
  if not TryStrToInt(Edit3.Text, Height1) then
  begin
    ShowMessage('invalid Height');
    Exit;
  end;
  if not TryStrToInt(Edit4.Text, X1) then
  begin
    ShowMessage('invalid Left');
    Exit;
  end;
  if not TryStrToInt(Edit5.Text, Y1) then
  begin
    ShowMessage('invalid Top');
    Exit;
  end;
  // get window title
  WindowTitle1 := Edit1.Text;
  WindowHandle1 := FindWindow(nil, PChar(WindowTitle1));
  // get new postion
  Width1 := StrToInt(Edit2.Text);
  Height1 := StrToInt(Edit3.Text);
  // get new size
  X1 := StrToInt(Edit4.Text);
  Y1 := StrToInt(Edit5.Text);
  // move window
  SetWindowPos(WindowHandle1, 0, X1, Y1, Width1, Height1, SWP_NOZORDER);
end;

procedure TForm1.Button6Click(Sender: TObject);
// start game
var
  WindowHandle2: HWND;
  WindowTitle2: string;
  StartTime: Cardinal;
  Timeout: Cardinal;
  X2, Y2, Width2, Height2: Integer;
begin
  // check parameters
  if not TryStrToInt(Edit2.Text, Width2) then
  begin
    ShowMessage('invalid Width');
    Exit;
  end;
  if not TryStrToInt(Edit3.Text, Height2) then
  begin
    ShowMessage('invalid Height');
    Exit;
  end;
  if not TryStrToInt(Edit4.Text, X2) then
  begin
    ShowMessage('invalid Left');
    Exit;
  end;
  if not TryStrToInt(Edit5.Text, Y2) then
  begin
    ShowMessage('invalid Top');
    Exit;
  end;
  // run start.bat
  ShellExecute(0, 'open', 'start.bat', nil, nil, SW_SHOW);
  // get window title
  WindowTitle2 := Edit1.Text;
  // set timeout 20s
  StartTime := GetTickCount;
  Timeout := 20000;

  // search window loop
  while (GetTickCount - StartTime < Timeout) do
  begin
    // search window title
    WindowHandle2 := FindWindow(nil, PChar(WindowTitle2));

    // if window found
    if WindowHandle2 <> 0 then
    begin
      // get new postion
      Width2 := StrToInt(Edit2.Text);
      Height2 := StrToInt(Edit3.Text);
      // get new size
      X2 := StrToInt(Edit4.Text);
      Y2 := StrToInt(Edit5.Text);
      // move window
      Sleep(4000);
      SetWindowPos(WindowHandle2, 0, X2, Y2, Width2, Height2, SWP_NOZORDER);
      sleep(500);
      Close;
      Exit;
    end;
    Sleep(100);
  end;

  // timeout
  ShowMessage('game window not found, quit in 3 seconds...');
  Sleep(3000);
  Application.Terminate;
end;

end.

