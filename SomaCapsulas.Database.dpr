program SomaCapsulas.Database;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SomaCapsulas.Database.Constant in 'SomaCapsulas.Database.Constant.pas',
  SomaCapsulas.Database.Interfaces in 'SomaCapsulas.Database.Interfaces.pas',
  SomaCapsulas.Database.Types in 'SomaCapsulas.Database.Types.pas',
  SomaCapsulas.Database.Source.Core in 'source\SomaCapsulas.Database.Source.Core.pas',
  SomaCapsulas.Database.Source.Builder.Core in 'source\builder\SomaCapsulas.Database.Source.Builder.Core.pas',
  SomaCapsulas.Database.Message in 'SomaCapsulas.Database.Message.pas';

var
  LReadLnToWait: string;
begin
  try
    Writeln('SOMA Cápsulas - Database');
    Writeln(EmptyStr);
    Writeln('      ___,A.A_  __        ');
    Writeln('      \   ,   7"_/        ');
    Writeln('       ~"T(  r r)         ');
    Writeln('         | \    Y         ');
    Writeln('         |  ~\ .|         ');
    Writeln('         |   |`-''        ');
    Writeln('         |   |            ');
    Writeln('         |   |            ');
    Writeln('         |   |            ');
    Writeln('         |   |            ');
    Writeln('         j   l            ');
    Writeln('        /     \           ');
    Writeln('       Y       Y          ');
    Writeln('       l   \ : |          ');
    Writeln('       /\   )( (          ');
    Writeln('      /  \  I| |\         ');
    Writeln('     Y    I l| | Y        ');
    Writeln('     j    ( )( ) l        ');
    Writeln('    / .    \ ` | |\   -Row');
    Writeln('   Y   \    i  | ! Y      ');
    Writeln('   l   .\_  I  |/  |      ');
    Writeln('    \ /   [\[][]/] j      ');
    Read(LReadLnToWait);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
