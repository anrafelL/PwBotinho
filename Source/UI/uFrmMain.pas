unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Winapi.TlHelp32,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  System.Generics.Collections, Vcl.Menus, sGroupBox, sListView, Vcl.Buttons,
  sSpeedButton,
  sStatusBar, sComboBox, sButton, sEdit, sScrollBox, sSkinManager, sCalculator,
  PwBotinho.Lib.StoreCfg, Vcl.ExtCtrls, Vcl.AppEvnts;

type
  TFrmMain = class(TForm)
    Lv: TsListView;
    sGroupBox1: TsGroupBox;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    sSpeedButton5: TsSpeedButton;
    sGroupBox2: TsGroupBox;
    sStatusBar1: TsStatusBar;
    sScrollBox1: TsScrollBox;
    EdAtv1: TsEdit;
    BtnAtv1: TsButton;
    EdAtv2: TsEdit;
    BtnAtv2: TsButton;
    EdAtv3: TsEdit;
    BtnAtv3: TsButton;
    EdAtv4: TsEdit;
    BtnAtv4: TsButton;
    EdAtv5: TsEdit;
    BtnAtv5: TsButton;
    BtnAtv6: TsButton;
    EdAtv6: TsEdit;
    EdAtv7: TsEdit;
    BtnAtv7: TsButton;
    BtnAtv8: TsButton;
    EdAtv8: TsEdit;
    sSkinManager1: TsSkinManager;
    PmLv: TPopupMenu;
    P1: TMenuItem;
    I1: TMenuItem;
    A1: TMenuItem;
    N2: TMenuItem;
    J1: TMenuItem;
    M1: TMenuItem;
    M2: TMenuItem;
    M3: TMenuItem;
    F1: TMenuItem;
    T1: TMenuItem;
    N61: TMenuItem;
    N81: TMenuItem;
    N3: TMenuItem;
    E1: TMenuItem;
    D1: TMenuItem;
    N4: TMenuItem;
    TrayIcon: TTrayIcon;
    R1: TMenuItem;
    L1: TMenuItem;
    N1: TMenuItem;
    R2: TMenuItem;
    CBoxAtv1: TComboBox;
    CBoxAtv2: TComboBox;
    CBoxAtv4: TComboBox;
    CBoxAtv3: TComboBox;
    CBoxAtv6: TComboBox;
    CBoxAtv5: TComboBox;
    CBoxAtv8: TComboBox;
    CBoxAtv7: TComboBox;
    ApplicationEvents1: TApplicationEvents;
    TrayPopup: TPopupMenu;
    e2: TMenuItem;
    N5: TMenuItem;
    S1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure P2Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
    procedure M3Click(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure LvItemChecked(Sender: TObject; Item: TListItem);
    procedure LvClick(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure BtnAtv1Click(Sender: TObject);
    procedure BtnAtv2Click(Sender: TObject);
    procedure BtnAtv3Click(Sender: TObject);
    procedure BtnAtv4Click(Sender: TObject);
    procedure BtnAtv5Click(Sender: TObject);
    procedure BtnAtv6Click(Sender: TObject);
    procedure BtnAtv7Click(Sender: TObject);
    procedure BtnAtv8Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure e2Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
  private
    { Private declarations }
    procedure FindData(Sender: TObject);
    procedure UpdateControl(BotKey: Pointer);
    procedure setStatus(Id, KeyId, Interval: NativeUint; Active: Boolean);
  public
    { Public declarations }
    CFG: TStoreCFG;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses PwBotinho.Lib.BotBase, PwLib.System.Win, PwBotinho.Lib.IntegerTree,
  uFrmSharedUI, PwBotinho.System.Share, uFrmCfg, uFrmAutoPOT, PwLib.System.Packet;

procedure TFrmMain.UpdateControl(BotKey: Pointer);
var
  B: TBotBase;
  I: Integer;
begin
  if BotKey = nil then
  begin
    for I := 1 to 8 do
    begin
      TsButton(FindComponent('BtnAtv' + IntToStr(I))).Enabled := False;
      TComboBox(FindComponent('CBoxAtv' + IntToStr(I))).ItemIndex := 0;
      TComboBox(FindComponent('CBoxAtv' + IntToStr(I))).Enabled := False;
      TsEdit(FindComponent('EdAtv' + IntToStr(I))).Enabled := False;
      TsEdit(FindComponent('EdAtv' + IntToStr(I))).Text := '1000';
    end;
  end
  else
  // botKey != null
  begin
    B := TBotBase(BotKey);
    for I := 1 to 8 do
    begin
      TComboBox(FindComponent('CBoxAtv' + IntToStr(I))).ItemIndex :=
        B.Key[I - 1].KeyId;
      TsEdit(FindComponent('EdAtv' + IntToStr(I))).Text :=
        IntToStr(B.Key[I - 1].Interval);
      TsEdit(FindComponent('EdAtv' + IntToStr(I))).Enabled :=
        not B.Key[I - 1].Active;
      TComboBox(FindComponent('CBoxAtv' + IntToStr(I))).Enabled :=
        not B.Key[I - 1].Active;
      TsButton(FindComponent('BtnAtv' + IntToStr(I))).Enabled := True;
      Application.ProcessMessages;
      if B.Key[I - 1].Active then
        TsButton(FindComponent('BtnAtv' + IntToStr(I))).Caption := 'Desativar'
      else
        TsButton(FindComponent('BtnAtv' + IntToStr(I))).Caption := 'Ativar';
    end;
  end;
end;

var
  Bot: TList<TBotBase>;
  Contador: Integer;
  Tree: TIntegerTree;

procedure TFrmMain.ApplicationEvents1Minimize(Sender: TObject);
begin
    self.TrayIcon.Visible := true;
    self.Hide;
end;

procedure TFrmMain.BtnAtv1Click(Sender: TObject);
begin
  if BtnAtv1.Caption = 'Ativar' then
    self.setStatus(0, self.CBoxAtv1.ItemIndex, StrToInt(EdAtv1.Text), True)
  else
    self.setStatus(0, self.CBoxAtv1.ItemIndex, StrToInt(EdAtv1.Text), False);
end;

procedure TFrmMain.BtnAtv2Click(Sender: TObject);
begin
  if BtnAtv2.Caption = 'Ativar' then
    self.setStatus(1, self.CBoxAtv2.ItemIndex, StrToInt(EdAtv2.Text), True)
  else
    self.setStatus(1, self.CBoxAtv2.ItemIndex, StrToInt(EdAtv2.Text), False);
end;

procedure TFrmMain.BtnAtv3Click(Sender: TObject);
begin
  if BtnAtv3.Caption = 'Ativar' then
    self.setStatus(2, self.CBoxAtv3.ItemIndex, StrToInt(EdAtv3.Text), True)
  else
    self.setStatus(2, self.CBoxAtv3.ItemIndex, StrToInt(EdAtv3.Text), False);
end;

procedure TFrmMain.BtnAtv4Click(Sender: TObject);
begin
  if BtnAtv4.Caption = 'Ativar' then
    self.setStatus(3, self.CBoxAtv4.ItemIndex, StrToInt(EdAtv4.Text), True)
  else
    self.setStatus(3, self.CBoxAtv4.ItemIndex, StrToInt(EdAtv4.Text), False);
end;

procedure TFrmMain.BtnAtv5Click(Sender: TObject);
begin
  if BtnAtv5.Caption = 'Ativar' then
    self.setStatus(4, self.CBoxAtv5.ItemIndex, StrToInt(EdAtv5.Text), True)
  else
    self.setStatus(4, self.CBoxAtv5.ItemIndex, StrToInt(EdAtv5.Text), False);
end;

procedure TFrmMain.BtnAtv6Click(Sender: TObject);
begin
  if BtnAtv1.Caption = 'Ativar' then
    self.setStatus(5, self.CBoxAtv6.ItemIndex, StrToInt(EdAtv6.Text), True)
  else
    self.setStatus(5, self.CBoxAtv6.ItemIndex, StrToInt(EdAtv6.Text), False);
end;

procedure TFrmMain.BtnAtv7Click(Sender: TObject);
begin
  if BtnAtv1.Caption = 'Ativar' then
    self.setStatus(6, self.CBoxAtv7.ItemIndex, StrToInt(EdAtv7.Text), True)
  else
    self.setStatus(6, self.CBoxAtv7.ItemIndex, StrToInt(EdAtv7.Text), False);
end;

procedure TFrmMain.BtnAtv8Click(Sender: TObject);
begin
  if BtnAtv1.Caption = 'Ativar' then
    self.setStatus(7, self.CBoxAtv8.ItemIndex, StrToInt(EdAtv8.Text), True)
  else
    self.setStatus(7, self.CBoxAtv8.ItemIndex, StrToInt(EdAtv8.Text), False);
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  if (lv.Selected <> nil) then
    //TPacket.useItem(0, 38476, StrToInt(Lv.Selected.SubItems[1]), 0);
    Tpacket.pickUpItem(3044, 3044, StrToInt(Lv.Selected.SubItems[1]));
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
  TShareProc.FreeAll(TList<TObject>((Bot)));
end;

procedure TFrmMain.D1Click(Sender: TObject);
begin
  // Desativar Tudo Popup Menu Lv
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
  begin
    TBotBase(Lv.Selected.Data).Active := False;
    self.UpdateControl(Lv.Selected.Data);
  end;
end;


procedure TFrmMain.E1Click(Sender: TObject);
begin
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
    TBotBase(Lv.Selected.Data).CloseApp;
end;

procedure TFrmMain.e2Click(Sender: TObject);
begin
  self.Show;
  application.Restore;
end;

procedure TFrmMain.F1Click(Sender: TObject);
begin
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
    TBotBase(Lv.Selected.Data).CloseWindow;
end;

procedure TFrmMain.FindData(Sender: TObject);
var
  L: TListItem;
begin
  L := Lv.FindData(0, Sender, True, False);
  if L <> nil then
  begin
    Tree.remover(StrToInt(L.Caption));
    Bot.Remove(TBotBase(Sender));
    L.Delete;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Contador := 0;
  Bot := TList<TBotBase>.Create;
  Tree := TIntegerTree.Create;
  UpdateControl(nil);
  CFG := TStoreCFG.Create;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  TShareProc.FreeAll(TList<TObject>(Bot));
end;

procedure TFrmMain.I1Click(Sender: TObject);
begin
  // Informação do Char Popup Menu Lv
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
    TBotBase(Lv.Selected.Data).showPlayerInfo;
end;

procedure TFrmMain.L1Click(Sender: TObject);
begin
  if Lv.Items.Count > 0 then
  begin
    TShareProc.FreeAll(TList<TObject>(Bot));
    Tree.Esvaziar;
    UpdateControl(nil);
  end;
end;

procedure TFrmMain.LvClick(Sender: TObject);
begin
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
  begin
    I1.Caption := 'Informações de ' + TBotBase(Lv.Selected.Data).Player.Nome;
    UpdateControl(Lv.Selected.Data);
  end
  else
    I1.Caption := 'Informação do Char';
end;

procedure TFrmMain.LvItemChecked(Sender: TObject; Item: TListItem);
begin
  if (Item <> nil) and (Item.Data <> nil) then
  begin
    TBotBase(Item.Data).Active := Item.Checked;
    Item.SubItems[4] := 'Sim';
    Item.SubItems[5] := 'Sim';
    if not Item.Checked then
    begin
      Item.SubItems[4] := 'Não';
      Item.SubItems[5] := 'Não';
    end;
  end;
end;

procedure TFrmMain.M1Click(Sender: TObject);
var
  s: String;
begin
  // Renomear Janela popup menu lv
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
  begin
    if (InputQuery('Renomear janela', 'Defina um novo título para a janela', s)
      and (Trim(s) <> '')) then
    begin
      TBotBase(Lv.Selected.Data).setWindowCaption(s);
      Lv.Selected.SubItems[2] := TBotBase(Lv.Selected.Data).Window.Caption;
    end;
  end;
end;

procedure TFrmMain.M2Click(Sender: TObject);
begin
  // Minimiza a janela
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
    TBotBase(Lv.Selected.Data).MinimizeWindow;
end;

procedure TFrmMain.M3Click(Sender: TObject);
begin
  // maximiza a janela
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
    TBotBase(Lv.Selected.Data).MaximizeWindow;
end;

procedure TFrmMain.P2Click(Sender: TObject);
begin
  // Envio de pacote fazer depois
end;

procedure TFrmMain.R1Click(Sender: TObject);
begin
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
    TBotBase(Lv.Selected.Data).RestoreWindow;
end;

procedure TFrmMain.R2Click(Sender: TObject);
begin
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
  begin
    TBotBase(Lv.Selected.Data).Window.retoreOriginalCaption;
    Lv.Selected.SubItems[2] := TBotBase(Lv.Selected.Data).Window.Caption;
  end;
end;

procedure TFrmMain.S1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.setStatus(Id, KeyId, Interval: NativeUint; Active: Boolean);
begin
  if (Lv.Selected <> nil) then
    if Lv.Selected.Data <> nil then
    begin
      TBotBase(Lv.Selected.Data).Key[Id].KeyId := KeyId;
      TBotBase(Lv.Selected.Data).Key[Id].Interval := Interval;
      TBotBase(Lv.Selected.Data).Key[Id].Active := Active;
      TBotBase(Lv.Selected.Data).Key[Id].BotActive := TBotBase(Lv.Selected.Data).Active;
      UpdateControl(Lv.Selected.Data);
    end;
end;

procedure TFrmMain.sSpeedButton1Click(Sender: TObject);
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
  Buf: array [0 .. MAX_PATH - 1] of char;
  ClassName: string;
  Len: Integer;
  L: TListItem;
begin
  UpdateControl(nil);
  // Rotina (Listar todos os elements Clientes)
  FSnapshotHandle := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    // and  then
    if (Trim(lowercase(FProcessEntry32.szExeFile)) = 'elementclient.exe') then
    begin
      Len := GetClassName
        (TWinSystem.GetHWndByPID(FProcessEntry32.th32ProcessID), @Buf[0],
        Length(Buf));
      SetString(ClassName, Buf, Len);
      if (ClassName = 'ElementClient Window') then
      begin
        Bot.Add(TBotBase.Create(FProcessEntry32.th32ProcessID));
        if Bot.Items[Bot.Count - 1].Player.Id <> 0 then
        begin
          if (Tree.Adicionar(Bot[Bot.Count - 1].Player.Id) = True) then
          begin
            Bot[Bot.Count - 1].OnDestroy := FindData;
            L := Lv.Items.Add;
            L.Caption := IntToStr(Bot.Items[Bot.Count - 1].Player.Id);
            L.SubItems.Add(IntToStr(Bot.Items[Bot.Count - 1].Window.Handle));
            L.SubItems.Add(IntToStr(FProcessEntry32.th32ProcessID));
            L.SubItems.Add(Bot.Items[Bot.Count - 1].Window.Caption);
            L.SubItems.Add(Bot.Items[Bot.Count - 1].Player.Nome);
            if Bot.Items[Bot.Count - 1].Freeze = True then
              L.SubItems.Add('Sim')
            else
              L.SubItems.Add('Não');
            if Bot.Items[Bot.Count - 1].Active = True then
              L.SubItems.Add('Sim')
            else
              L.SubItems.Add('Não');
            L.Data := Bot.Items[Bot.Count - 1];
          end
          else
            Bot.Remove(Bot.Items[Bot.Count - 1]);
        end
        else
          Bot.Remove(Bot.Items[Bot.Count - 1]);
      end;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TFrmMain.sSpeedButton2Click(Sender: TObject);
begin
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
  begin
    with TBotBase(Lv.Selected.Data) do
    begin
      Window.Caption := Player.Nome;
      Lv.Selected.SubItems[2] := Window.Caption;
    end;
  end;
end;

procedure TFrmMain.sSpeedButton3Click(Sender: TObject);
begin
  FrmConfig := TFrmConfig.Create(self);
  try
    FrmConfig.ShowModal;
  finally
    FrmConfig.Free;
  end;
end;

procedure TFrmMain.sSpeedButton5Click(Sender: TObject);
begin
  MessageBox(Self.Handle,
  PChar('Autor: Swellington Soares'+#13+'Versão: 1.0'),
  PChar('Pw Botinho 2.0 Alpha '),
  MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmMain.A1Click(Sender: TObject);
begin
  // auto popup menu fazer depois
  if (Lv.Items.Count > 0) and (Lv.Selected <> nil) then
  begin
    TBotBase(Lv.Selected.Data).showAutoPot;
  end;
end;

end.
