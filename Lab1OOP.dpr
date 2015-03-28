program Lab1OOP;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DrawShapes in 'DrawShapes.pas',
  Shape in 'Shape.pas',
  ShapesDraw in 'ShapesDraw.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
