program ConsultaCEPSample;

uses
  System.StartUpCopy,
  FMX.Forms,
  ConsultaCEP.Main in 'ConsultaCEP.Main.pas' {Form1},
  ConsultaCEP.Consulta in '..\Lib\ConsultaCEP.Consulta.pas',
  ConsultaCEP.Logradouro in '..\Lib\ConsultaCEP.Logradouro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
