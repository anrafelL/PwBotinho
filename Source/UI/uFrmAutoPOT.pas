unit uFrmAutoPOT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sLabel, Vcl.ExtCtrls,
  sPanel, sScrollBox, sButton, PwBotinho.Lib.AutoPOT;

type
  TfrmAutoPotion = class(TForm)
    sScrollBox1: TsScrollBox;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sLabel1: TsLabel;
    sButton1: TsButton;
    procedure sButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FHandle: THandle;
    FPlayerBase: Pointer;
    AutoPotionList: TList<TAutoPotKey>;
    FOnUpdateEvent: TUpdateEventList;
    procedure DeleteFromList(Sender: TObject);
    function getListCounter: NativeUInt;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Handle: THandle;
      Player: Pointer); overload;
  end;

var
  frmAutoPotion: TfrmAutoPotion;

implementation

{$R *.dfm}

uses PwLib.Player.Base;

{ TfrmAutoPotion }

constructor TfrmAutoPotion.Create(AOwner: TComponent; Handle: THandle;
  Player: Pointer);
begin
  inherited Create(AOwner);
  if Player = nil then
    raise Exception.Create('Error Message');
  self.FPlayerBase := Player;
  self.Caption := TPlayerBase(self.FPlayerBase).Nome;
  self.sLabel1.Caption := Format('%s: %u',
    ['Id do jogador: ', TPlayerBase(self.FPlayerBase).Id]);
  FHandle := Handle;
end;

procedure TfrmAutoPotion.DeleteFromList(Sender: TObject);
begin
  AutoPotionList.Remove(TAutoPotKey(Sender));
end;

procedure TfrmAutoPotion.FormCreate(Sender: TObject);
begin
  AutoPotionList := TList<TAutoPotKey>.Create;
end;

procedure TfrmAutoPotion.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to AutoPotionList.Count-1 do
  begin
    AutoPotionList.Items[i].Free;
    AutoPotionList.Delete(i);
  end;
end;

function TfrmAutoPotion.getListCounter: NativeUInt;
begin
  Result := 0;
  if AutoPotionList <> nil then
    Result := AutoPotionList.Count;
end;

procedure TfrmAutoPotion.sButton1Click(Sender: TObject);
begin
  AutoPotionList.Add(TAutoPotKey.Create(self.sScrollBox1, FHandle,
    FPlayerBase));
  AutoPotionList.Items[AutoPotionList.Count - 1].OnDestroy := DeleteFromList;
end;

end.
