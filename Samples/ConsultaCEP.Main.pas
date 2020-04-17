unit ConsultaCEP.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, Rest.JSON;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtCEP: TEdit;
    Button1: TButton;
    mmRetorno: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses ConsultaCEP.Consulta, ConsultaCEP.Logradouro;

procedure TForm1.Button1Click(Sender: TObject);
var
  sRetorno : String;
begin
  mmRetorno.Lines.Clear;

  if TConsultaCEP.Consultar(edtCEP.Text, sRetorno) then
  begin
    var cep : TCEPRetorno;
    cep := TJson.JsonToObject<TCEPRetorno>(sRetorno);

    mmRetorno.Lines.Add('Logradouro: ' + cep.Logradouro);
    mmRetorno.Lines.Add('Complemento: ' + cep.Complemento);
    mmRetorno.Lines.Add('Bairro: ' + cep.Bairro);
    mmRetorno.Lines.Add('Localidade: ' + cep.Localidade);
    mmRetorno.Lines.Add('UF: ' + cep.UF);
    mmRetorno.Lines.Add('Unidade: ' + cep.Unidade);
    mmRetorno.Lines.Add('IBGE: ' + cep.IBGE);
    mmRetorno.Lines.Add('GIA: ' + cep.GIA);
  end
  else
  begin
    ShowMessage('CEP Inválido');
  end;
end;

end.
