unit ConsultaCEP.Logradouro;

interface

type
  TCEPRetorno = class
  private
    FLogradouro: String;
    FIBGE: String;
    FBairro: String;
    FUF: String;
    FCEP: String;
    FLocalidade: String;
    FUnidade: String;
    FComplemento: String;
    FGIA: String;
    FErro: Boolean;
    procedure SetBairro(const Value: String);
    procedure SetCEP(const Value: String);
    procedure SetComplemento(const Value: String);
    procedure SetGIA(const Value: String);
    procedure SetIBGE(const Value: String);
    procedure SetLocalidade(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetUF(const Value: String);
    procedure SetUnidade(const Value: String);
    procedure SetErro(const Value: Boolean);
  public
    property CEP:         String  read FCEP         write SetCEP;
    property Bairro:      String  read FBairro      write SetBairro;
    property Complemento: String  read FComplemento write SetComplemento;
    property GIA:         String  read FGIA         write SetGIA;
    property IBGE:        String  read FIBGE        write SetIBGE;
    property Localidade:  String  read FLocalidade  write SetLocalidade;
    property Logradouro:  String  read FLogradouro  write SetLogradouro;
    property UF:          String  read FUF          write SetUF;
    property Unidade:     String  read FUnidade     write SetUnidade;
    property Erro:        Boolean read FErro        write SetErro;

    constructor Create;
  end;

implementation

{ TConsultaCEP }

constructor TCEPRetorno.Create;
begin
  FErro := False;
end;

procedure TCEPRetorno.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TCEPRetorno.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TCEPRetorno.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TCEPRetorno.SetErro(const Value: Boolean);
begin
  FErro := Value;
end;

procedure TCEPRetorno.SetGIA(const Value: String);
begin
  FGIA := Value;
end;

procedure TCEPRetorno.SetIBGE(const Value: String);
begin
  FIBGE := Value;
end;

procedure TCEPRetorno.SetLocalidade(const Value: String);
begin
  FLocalidade := Value;
end;

procedure TCEPRetorno.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TCEPRetorno.SetUF(const Value: String);
begin
  FUF := Value;
end;

procedure TCEPRetorno.SetUnidade(const Value: String);
begin
  FUnidade := Value;
end;

end.
