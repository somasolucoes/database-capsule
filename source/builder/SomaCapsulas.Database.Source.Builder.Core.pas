unit SomaCapsulas.Database.Source.Builder.Core;

interface

uses
  System.Classes, System.SysUtils, SomaCapsulas.Database.Interfaces,
  SomaCapsulas.Database.Types;

type
  TDatabaseBuilder = class(TInterfacedObject, IDatabaseBuilder)
  private
    FDatabase: IDatabase;
  public
    function WithIP(AIP: string): IDatabaseBuilder;
    function OnSite(ASite: string): IDatabaseBuilder;
    function UsingUser(AUser: string): IDatabaseBuilder;
    function WithPassword(APassword: string): IDatabaseBuilder;
    function ByDBMS(ADBMS: TDBMS): IDatabaseBuilder;
    function Build: IDatabase;
    constructor Create;
  end;

implementation

uses
  SomaCapsulas.Database.Source.Core;

{ TDatabaseBuilder }

constructor TDatabaseBuilder.Create;
begin
  Self.FDatabase := TDatabase.Create;
end;

function TDatabaseBuilder.Build: IDatabase;
begin
  Result := Self.FDatabase;
end;

function TDatabaseBuilder.ByDBMS(ADBMS: TDBMS): IDatabaseBuilder;
begin
  Self.FDatabase.DBMS := ADBMS;
  Result := Self;
end;

function TDatabaseBuilder.WithIP(AIP: string): IDatabaseBuilder;
begin
  Self.FDatabase.IP := AIP;
  Result := Self;
end;

function TDatabaseBuilder.OnSite(ASite: string): IDatabaseBuilder;
begin
  Self.FDatabase.Site := ASite;
  Result := Self;
end;

function TDatabaseBuilder.UsingUser(AUser: string): IDatabaseBuilder;
begin
  Self.FDatabase.User := AUser;
  Result := Self;
end;

function TDatabaseBuilder.WithPassword(APassword: string): IDatabaseBuilder;
begin
  Self.FDatabase.Pass := APassword;
  Result := Self;
end;

end.
