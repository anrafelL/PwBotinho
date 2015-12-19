unit PwBotinho.Lib.AutoPOT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Gauges,
  Vcl.ExtCtrls;

type
  TUpdateEventList = procedure(Sender: TObject; Count: NativeUint) of Object;

type
  PAutoPotKey = ^TAutoPotKey;

  TAutoPotKey = class(TComponent)
  private
    FParent: TComponent;
    FPlayer: Pointer;
    FWindowsHandle: THandle;
    // UI
    FPanel: TPanel;
    FEditCond: TEdit;
    FLabelCond: TLabel;
    FIsActive: Boolean;
    FComboBoxHPMP: TCombobox;
    FComboboxCond: TCombobox;
    FLabelPorcent: TLabel;
    FLabelTecla: TLabel;
    FComboboxTecla: TCombobox;
    FActiveButton: TButton;
    FCheckTime: TTimer;
    FHPMpBar: TGauge;
    FCloseButton: TButton;
    FOnDestroy: TNotifyEvent;
    FActive: Boolean;
    procedure setHPorMP(Op: Integer);
  protected
    procedure ChecarCodicao(Sender: TObject);
    procedure CriarVisual;
    procedure BtnCloseOnClick(Sender: TObject);
    procedure BtnActiveOnClick(Sender: TObject);
    procedure ComboBoxHPMPOnChange(Sender: TObject);
    procedure setBarValue(MaxValue, Progress: Integer);
  public
    property Actived: Boolean read FActive write FActive;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    constructor Create(AOwner: TComponent; const Handle: THandle;
      PlayerP: Pointer);
    destructor Destroy; Override;
  end;

implementation

{ TAutoPotKey }

uses PwLib.Player.Base, PwBotinho.System.Share;

procedure TAutoPotKey.BtnActiveOnClick(Sender: TObject);
begin
  if self.FIsActive then
  begin
    self.FActiveButton.Caption := 'Ativar';
    self.FCheckTime.Enabled := False;
    self.FComboBoxHPMP.Enabled := True;
    self.FComboboxCond.Enabled := True;
    self.FComboboxTecla.Enabled := True;
    self.FEditCond.Enabled := True;
    self.FIsActive := False;
  end
  else
  begin
    self.FActiveButton.Caption := 'Desativar';
    self.FCheckTime.Enabled := True;
    self.FComboBoxHPMP.Enabled := False;
    self.FComboboxCond.Enabled := False;
    self.FComboboxTecla.Enabled := False;
    self.FEditCond.Enabled := False;
    self.FIsActive := True;
  end;
end;

procedure TAutoPotKey.BtnCloseOnClick(Sender: TObject);
begin
  self.Destroy;
end;

procedure TAutoPotKey.ChecarCodicao(Sender: TObject);
var
  Percent: Integer;
begin
  if self.FActive then
  begin
    Percent := ((self.FHPMpBar.Progress * 100) div (self.FHPMpBar.MaxValue));
    self.setHPorMP(self.FComboBoxHPMP.ItemIndex);
    case self.FComboboxCond.ItemIndex of
      0:
        begin
          if (Percent > StrToInt(self.FEditCond.Text)) then
            TShareProc.EnviarTecla(self.FWindowsHandle,
              self.FComboboxTecla.ItemIndex);
        end;
      1:
        begin
          if (Percent < StrToInt(self.FEditCond.Text)) then
            TShareProc.EnviarTecla(self.FWindowsHandle,
              self.FComboboxTecla.ItemIndex);
        end;
      2:
        begin
          if (Percent >= StrToInt(self.FEditCond.Text)) then
            TShareProc.EnviarTecla(self.FWindowsHandle,
              self.FComboboxTecla.ItemIndex);
        end;
      3:
        begin
          if (Percent <= StrToInt(self.FEditCond.Text)) then
            TShareProc.EnviarTecla(self.FWindowsHandle,
              self.FComboboxTecla.ItemIndex);
        end;
      4:
        begin
          if (Percent = StrToInt(self.FEditCond.Text)) then
            TShareProc.EnviarTecla(self.FWindowsHandle,
              self.FComboboxTecla.ItemIndex);
        end;
    end;
  end;
end;

procedure TAutoPotKey.ComboBoxHPMPOnChange(Sender: TObject);
begin
  self.setHPorMP(self.FComboBoxHPMP.ItemIndex);
end;

constructor TAutoPotKey.Create(AOwner: TComponent; const Handle: THandle;
  PlayerP: Pointer);
begin
  // Player HP MP TPlayer
  if Handle = 0 then
    raise Exception.Create('Handle is 0 or Invalid.')
  else
  begin
    if (PlayerP <> nil) then
    begin
      self.FPlayer := PlayerP;
      self.FWindowsHandle := Handle;
      self.FIsActive := False;
      self.FParent := AOwner;
      self.CriarVisual;
      self.FCheckTime := TTimer.Create(self);
      self.FCheckTime.Enabled := False;
      self.FCheckTime.Interval := 500;
      self.FCheckTime.OnTimer := self.ChecarCodicao;
      self.FHPMpBar.BackColor := clBlack;
      self.FHPMpBar.ForeColor := clRed;
      self.setHPorMP(0);
      inherited Create(AOwner);
    end;
  end;
end;

// Metódo responsável por criar a Interface do usuário.
procedure TAutoPotKey.CriarVisual;
begin
  // Cria o panel;
  FPanel := TPanel.Create(self);
  with FPanel do
  begin
    Align := alTop;
    Width := 209;
    Height := 119;
    // Top := ((10 + self.FPanel.Height) * self.FContador);
    Left := 30;
    Caption := '';
    AlignWithMargins := True;
    ShowCaption := False;
    Parent := TForm(self.FParent);
    Visible := True;
  end;

  // Criação do HP_MP Select
  FComboBoxHPMP := TCombobox.Create(self);
  with FComboBoxHPMP do
  begin
    Parent := self.FPanel;
    Left := 8;
    Width := 48;
    Top := 4;
    Height := 26;
    Items.Add('HP');
    Items.Add('MP');
    Items.Add('CHI');
    ItemIndex := 0;
    Style := csDropDownList;
    Visible := True;
    FComboBoxHPMP.OnChange := ComboBoxHPMPOnChange;
  end;

  // Criação do gauge
  self.FHPMpBar := TGauge.Create(self);
  with FHPMpBar do
  begin
    Width := 142;
    Left := 63;
    Top := 4;
    Height := 26;
    Parent := self.FPanel;
  end;
  // Criação do Label Condição
  FLabelCond := TLabel.Create(self);
  with FLabelCond do
  begin
    Left := 8;
    Top := 36;
    Width := 63;
    Height := 18;
    Caption := 'Condição: ';
    Parent := self.FPanel;
    Visible := True;
  end;
  // Combobox condições
  self.FComboboxCond := TCombobox.Create(self);
  with FComboboxCond do
  begin
    Parent := self.FPanel;
    Top := 33;
    Width := 49;
    Left := 77;
    Height := 26;
    Items.Add('>');
    Items.Add('<');
    Items.Add('>=');
    Items.Add('<=');
    Items.Add('=');
    ItemIndex := 0;
    Style := csDropDownList;
  end;
  // Criação do controle Label %
  self.FLabelPorcent := TLabel.Create(self);
  with FLabelPorcent do
  begin
    Parent := self.FPanel;
    Top := 36;
    Width := 20;
    Left := 132;
    Height := 18;
    Caption := '%: ';
    Visible := True;
  end;

  // Edit valor
  self.FEditCond := TEdit.Create(self);
  with FEditCond do
  begin
    Parent := self.FPanel;
    Top := 33;
    Width := 53;
    Left := 152;
    Height := 26;
    Text := '50';
    Alignment := taRightJustify;
    Visible := True;
  end;

  // Label
  self.FLabelTecla := TLabel.Create(self);
  with FLabelTecla do
  begin
    Parent := self.FPanel;
    Top := 65;
    Width := 40;
    Left := 31;
    Height := 18;
    Caption := 'Tecla: ';
    Visible := True;
  end;

  // Combo Teclas
  self.FComboboxTecla := TCombobox.Create(self);
  with FComboboxTecla do
  begin
    Parent := self.FPanel;
    Top := 60;
    Width := 128;
    Left := 77;
    Height := 26;
    Items.Add('F1');
    Items.Add('F2');
    Items.Add('F3');
    Items.Add('F4');
    Items.Add('F5');
    Items.Add('F6');
    Items.Add('F7');
    Items.Add('F8');
    Items.Add('Num 1');
    Items.Add('Num 2');
    Items.Add('Num 3');
    Items.Add('Num 4');
    Items.Add('Num 5');
    Items.Add('Num 6');
    Items.Add('Num 7');
    Items.Add('Num 8');
    Items.Add('Num 9');
    ItemIndex := 0;
    Style := csDropDownList;
  end;

  self.FActiveButton := TButton.Create(self);
  with FActiveButton do
  begin
    Parent := self.FPanel;
    Caption := 'Ativar';
    Left := 77;
    Top := 88;
    Width := 128;
    Height := 25;
    OnClick := BtnActiveOnClick;
    Visible := True;
  end;

  FCloseButton := TButton.Create(self);
  with FCloseButton do
  begin
    Parent := self.FPanel;
    Caption := '-';
    Left := 8;
    Width := 25;
    Height := 25;
    Top := (self.FPanel.Height - Height) - 4;
    Visible := True;
    OnClick := BtnCloseOnClick;
  end;
end;

destructor TAutoPotKey.Destroy;
begin
  if @FOnDestroy <> nil then
    FOnDestroy(self);
  self.FCheckTime.Enabled := False;
  inherited Destroy;
end;

procedure TAutoPotKey.setBarValue(MaxValue, Progress: Integer);
begin
  self.FHPMpBar.Progress := Progress;
  self.FHPMpBar.MaxValue := MaxValue;
end;

procedure TAutoPotKey.setHPorMP(Op: Integer);
begin
  case Op of
    // Informação visual do HP
    0:
      begin
        self.FHPMpBar.BackColor := clBlack;
        self.FHPMpBar.ForeColor := clRed;
        self.FHPMpBar.MaxValue := TPlayerBase(self.FPlayer).HPMax;
        self.FHPMpBar.Progress := TPlayerBase(self.FPlayer).HP;
      end;
    // Informação visual do MP
    1:
      begin
        self.FHPMpBar.ForeColor := clBlue;
        self.FHPMpBar.MaxValue := TPlayerBase(self.FPlayer).MpMax;
        self.FHPMpBar.Progress := TPlayerBase(self.FPlayer).MP;
      end;
    // Informação visual do CHI
    2:
      begin
        self.FHPMpBar.ForeColor := clYellow;
        self.FHPMpBar.MaxValue := TPlayerBase(self.FPlayer).ChiMax;
        self.FHPMpBar.Progress := TPlayerBase(self.FPlayer).Chi;
      end;
  end;
end;

end.
