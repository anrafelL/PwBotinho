unit PwBotinho.Lib.IntegerTree;

interface

uses Windows, SysUtils;

type
  PPInfo = ^PInfo;
  PInfo = ^TInfo;

  TInfo = record
    FValor: Int64;
    Esq: PInfo;
    Dir: PInfo;
  end;

type
  TIntegerTree = class
  private
    FRoot: PInfo;
  protected
    function Inserir(Raiz: PPInfo; const Valor: Int64): boolean;
    function Remove(Raiz: PPInfo; const Valor: Int64): PInfo;
    procedure Esvazia(Raiz: PPinfo);
  public
    procedure Esvaziar;
    function Adicionar(const Valor: Int64): boolean;
    function remover(const Valor: Int64): Boolean;
    constructor Create;
    Destructor destroy; override;
  end;

implementation

{ TIntegerTree }

function TIntegerTree.Adicionar(const Valor: Int64): boolean;
begin
  Result := Inserir(@FRoot, Valor);
end;

constructor TIntegerTree.Create;
begin
  FRoot := nil;
end;

destructor TIntegerTree.destroy;
begin
  if FRoot <> nil then
  Esvaziar;
  inherited;
end;

procedure TIntegerTree.Esvazia(Raiz: PPinfo);
begin
  if Raiz^ = nil then
    Exit;
  Esvazia(@((Raiz^)^.Esq));
  Esvazia(@((Raiz^)^.Esq));
  FreeMem(Raiz^);
  Raiz^ := nil;
end;

procedure TIntegerTree.Esvaziar;
begin
   Esvazia(@FRoot);
end;

function TIntegerTree.Inserir(Raiz: PPInfo; const Valor: Int64): boolean;
var
  novo: PInfo;
begin
  novo := nil;
  Result := False;
  if Raiz^ = nil then
  begin
    getMem(novo, Sizeof(TInfo));
    novo^.FValor := Valor;
    novo^.Esq := nil;
    novo^.Dir := nil;
    Raiz^ := novo;
    Result := True;
  end
  else if (Raiz^)^.FValor > Valor then
  begin
    Result := Inserir(@((Raiz^)^.Esq), Valor);
  end
  else if (Raiz^)^.FValor < Valor then
  begin
   Result :=  Inserir(@((Raiz^)^.Dir), Valor);
  end
  else
    Result := False;
end;

function TIntegerTree.Remove(Raiz: PPInfo; const Valor: Int64): PInfo;
var
  T: PInfo;
begin
  if (Raiz^ = nil) then
    Result := nil
  else if (Raiz^)^.FValor > Valor then
    (Raiz^)^.Esq := Remove(@((Raiz^)^.Esq), Valor)
  else if (Raiz^)^.FValor < Valor then
    (Raiz^)^.Dir := Remove(@((Raiz^)^.Dir), Valor)
  else
  begin
    if ((Raiz^)^.Esq = nil) and ((Raiz^)^.Dir = nil) then
    begin
      FreeMem(Raiz^);
      Raiz^ := nil;
    end
    else if (Raiz^)^.Esq = nil then
    begin
      T := (Raiz^);
      Raiz^ := (Raiz^)^.Dir;
      FreeMem(T);
    end
    else if ((Raiz^)^.Dir = nil) then
    begin
      T := (Raiz^);
      Raiz^ := (Raiz^.Esq);
      FreeMem(T);
    end
    else
    begin
      T := (Raiz^)^.Esq;
      while T <> nil do
        T := T^.Dir;
      (Raiz^)^.FValor := T^.FValor;
      T^.FValor := Valor;
      (Raiz^)^.Esq := Remove(@((Raiz^)^.Esq), Valor);
    end;
  end;
  Result := (Raiz^);
end;

function TIntegerTree.remover(const Valor: Int64): Boolean;
begin
  Result := Remove(@FRoot, Valor) <> nil;
end;



end.
