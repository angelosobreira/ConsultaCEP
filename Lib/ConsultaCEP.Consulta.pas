unit ConsultaCEP.Consulta;

interface

uses System.Net.HttpClientComponent, System.SysUtils, System.Net.HttpClient, Rest.JSON, System.JSON;

const
  cURL = 'http://viacep.com.br/ws/';
  cFormato = '/json/';

type
  TConsultaCEP = class
  public
    class function Consultar(pCEP : String; var pRetorno : String) : Boolean;
  end;

implementation

uses
  ConsultaCEP.Logradouro;

{ TConsultaCEP }

class function TConsultaCEP.Consultar(pCEP: String;
  var pRetorno: String): Boolean;
var
  httpRequest : TNetHTTPRequest;
  httpClient : TNetHTTPClient;
  response : IHTTPResponse;
  objCEP : TCEPRetorno;
begin
  Result := True;

  try
    pCEP := pCEP.Replace('-','', [rfReplaceAll]);

    if pCEP.Trim.Length <> 8 then
    begin
      raise Exception.Create('CEP inválido!');
    end;

    try
      httpRequest := TNetHTTPRequest.Create(nil);
      httpClient  := TNetHTTPClient.Create(nil);
      httpRequest.Client := httpClient;


      response := httpRequest.Get(cURL + pCEP + cFormato);

      if response.StatusCode = 200 then
      begin
        objCEP := TJson.JsonToObject<TCEPRetorno>(TJSONObject(TJSONObject.ParseJSONValue(response.ContentAsString())));

        if objCEP.Erro then
        begin
          raise Exception.Create('CEP não localizado.');
        end
        else
        begin
          pRetorno := response.ContentAsString();
        end;
      end
      else
      begin
        raise Exception.Create(response.StatusText);
      end;
    finally
      FreeAndNil(httpRequest);
      FreeAndNil(httpClient);
      if Assigned(objCEP) then
      begin
        FreeAndNil(objCEP);
      end;
    end;
  except
    on E:Exception do
    begin
      Result   := False;
      pRetorno := E.Message;
    end;
  end;
end;

end.
