# Consulta CEP com Deplhi - ViaCEP

![Delphi Supported Versions](https://img.shields.io/badge/Delphi%20Supported%20Versions-10.3%20or%20later-blue)

## Utilizar no seu projeto
Adicionar as units ConsultaCEP.Consulta.pas e ConsultaCEP.Logradouro.pas que estão na pasta Lib.

## Exemplo de uso

```pascal

var
  sRetorno : String;
begin
  mmRetorno.Lines.Clear;

  if TConsultaCEP.Consultar(edtCEP.Text, sRetorno) then
  begin
    var cep : TCEPRetorno;
    cep := TJson.JsonToObject<TCEPRetorno>(sRetorno);

    ShowMessage('Logradouro: ' + cep.Logradouro + sLineBreak +
                'Complemento: ' + cep.Complemento + sLineBreak +
                'Bairro: ' + cep.Bairro  + sLineBreak +
                'Localidade: ' + cep.Localidade  + sLineBreak +
                'UF: ' + cep.UF + sLineBreak +
                'Unidade: ' + cep.Unidade + sLineBreak +
                'IBGE: ' + cep.IBGE + sLineBreak +
                'GIA: ' + cep.GIA);
  end
  else
  begin
    ShowMessage('CEP Inválido');
  end;
end;
```


## CEP desatualizado?
Informe a ViaCEP através do link [**Atualizar CEP**](https://viacep.com.br/cep/) 
