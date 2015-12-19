unit uFrmCfg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sGroupBox, sEdit, sButton,
  Vcl.Buttons, sSpeedButton, sCheckBox, acPathDialog;

type
  TFrmConfig = class(TForm)
    sGroupBox1: TsGroupBox;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sSpeedButton1: TsSpeedButton;
    sButton1: TsButton;
    sButton2: TsButton;
    sEdit1: TsEdit;
    sButton3: TsButton;
    Label1: TLabel;
    sPathDialog1: TsPathDialog;
    procedure sButton3Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;

implementation

{$R *.dfm}

uses PwLib.System.Win, PwBotinho.Lib.StoreCfg, uFrmMain;

procedure TFrmConfig.FormCreate(Sender: TObject);
begin
  if FrmMain.CFG <> nil then
  begin
    with FrmMain.CFG do
    begin
      Load;
      if ClientPath = '' then
        self.sEdit1.Text := TWinSystem.getPerfectWorldDir
      else
        self.sEdit1.Text := ClientPath;
      self.sCheckBox1.Checked := StartWithWindows;
      self.sCheckBox2.Checked := AutoCheckUpdate;
      self.sCheckBox3.Checked := MinimizeToTray;
      self.sCheckBox4.Checked := StayOnTop;
      self.sCheckBox5.Checked := RenameWindowWithCharName;
    end;
  end;
end;

procedure TFrmConfig.sButton1Click(Sender: TObject);
begin
  if FrmMain.CFG <> nil then
  begin
    with FrmMain.CFG do
    begin
      StartWithWindows := self.sCheckBox1.Checked;
      AutoCheckUpdate := self.sCheckBox2.Checked;
      MinimizeToTray := self.sCheckBox3.Checked;
      StayOnTop := self.sCheckBox4.Checked;
      RenameWindowWithCharName := self.sCheckBox5.Checked;
      ClientPath := self.sEdit1.Text;
      Save;
    end;
  end;
  close;
end;

procedure TFrmConfig.sButton2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmConfig.sButton3Click(Sender: TObject);
begin
  if self.sPathDialog1.Execute then
    self.sEdit1.Text := self.sPathDialog1.Path;
end;

procedure TFrmConfig.sSpeedButton1Click(Sender: TObject);
begin
  if FrmMain.CFG <> nil then
  begin
    with FrmMain.CFG do
    begin
      Load;
      if ClientPath = '' then
        self.sEdit1.Text := TWinSystem.getPerfectWorldDir
      else
        self.sEdit1.Text := ClientPath;
    end;
  end;
end;

end.
