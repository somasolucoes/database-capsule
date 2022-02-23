unit SomaCapsulas.Database.Source.Core;

interface

uses
  System.Classes, System.SysUtils, SomaCapsulas.Database.Interfaces,
  SomaCapsulas.Database.Types, SomaCapsulas.Database.Source.Builder.Core;

type
  /// <summary>
  ///   Database connection informations.
  /// </summary>
  TDatabase = class(TInterfacedObject, IDatabase)
  strict private
    constructor Create;
  private
    FSite: string;
    FDBMS: TDBMS;
    FPass: string;
    FUser: string;
    FIP: string;
    function GetDBMS: TDBMS;
    function GetPass: string;
    function GetSite: string;
    function GetUser: string;
    function GetIP: string;
    procedure SetDBMS(const Value: TDBMS);
    procedure SetPass(const Value: string);
    procedure SetSite(const Value: string);
    procedure SetUser(const Value: string);
    procedure SetIP(const Value: string);
  public
    /// <summary>
    ///   Builder to create the object.
    /// </summary>
    type Builder = TDatabaseBuilder;
    /// <summary>
    ///   Used Database Management System.
    /// </summary>
    property DBMS: TDBMS read GetDBMS write SetDBMS;
    /// <summary>
    ///   IP of the host (PostgreSQL only).
    /// </summary>
    property IP: string read GetIP write SetIP;
    /// <summary>
    ///   Site to connect to the database (TSNames in Oracle).
    /// </summary>
    property Site: string read GetSite write SetSite;
    /// <summary>
    ///   User of database.
    /// </summary>
    property User: string read GetUser write SetUser;
    /// <summary>
    ///   Password of that user.
    /// </summary>
    property Pass: string read GetPass write SetPass;
    /// <summary>
    ///   Converts an enumerator of TDBMS to DBMS name string.
    /// </summary>
    /// <param name="ADBMS">
    ///   Enumerator to convert.
    /// </param>
    /// <returns>
    ///   Returns a string with the DBMS name.
    /// </returns>
    class function DBMSToString(ADBMS: TDBMS): string;
    /// <summary>
    ///   Converts a DBMS name string to an enumerator of TDBMS.
    /// </summary>
    /// <param name="ADBMSString">
    ///   DBMS name string.
    /// </param>
    /// <returns>
    ///   Returns an enumerator of TDBMS.
    /// </returns>
    class function StringToDBMS(ADBMSString: string): TDBMS;
    /// <summary>
    ///   Converts a DBMS abbreviation char to an enumerator of TDBMS.
    /// </summary>
    /// <param name="AAbbr">
    ///   Abbreviation char to convert.
    /// </param>
    /// <returns>
    ///   Returns an enumerator of TDBMS.
    /// </returns>
    class function AbbrToDBMS(AAbbr: string): TDBMS;
  end;

implementation

uses
  SomaCapsulas.Database.Constant, System.StrUtils;

{ TDatabase }

constructor TDatabase.Create;
begin
  { Construtor privado }
end;

class function TDatabase.AbbrToDBMS(AAbbr: string): TDBMS;
begin
  case AnsiIndexStr(AAbbr, [ABBR_ORACLE,
                            ABBR_FIREBIRD,
                            ABBR_POSTGRESQL,
                            ABBR_MYSQL]) of
    0: Result := dbmsOracle;
    1: Result := dbmsFirebird;
    2: Result := dbmsPostgreSQL;
    3: Result := dbmsMySQL;
    else
      Result := dbmsOracle;
  end;
end;

class function TDatabase.DBMSToString(ADBMS: TDBMS): string;
begin
  case ADBMS of
    dbmsOracle:
      Result := DRIVER_ORACLE;
    dbmsFirebird:
      Result := DRIVER_FIREBIRD;
    dbmsPostgreSQL:
      Result := DRIVER_POSTGRESQL;
    dbmsMySQL:
      Result := DRIVER_MYSQL;
    else
      Result := EmptyStr;
  end;
end;

class function TDatabase.StringToDBMS(ADBMSString: string): TDBMS;
begin
  case AnsiIndexStr(ADBMSString, [DRIVER_ORACLE,
                                  DRIVER_FIREBIRD,
                                  DRIVER_POSTGRESQL,
                                  DRIVER_MYSQL]) of
    0: Result := dbmsOracle;
    1: Result := dbmsFirebird;
    2: Result := dbmsPostgreSQL;
    3: Result := dbmsMySQL;
  end;
end;

function TDatabase.GetDBMS: TDBMS;
begin
  Result := Self.FDBMS;
end;

function TDatabase.GetIP: string;
begin
  Result := Self.FIP;
end;

function TDatabase.GetPass: string;
begin
  Result := Self.FPass;
end;

function TDatabase.GetSite: string;
begin
  Result := Self.FSite;
end;

function TDatabase.GetUser: string;
begin
  Result := Self.FUser;
end;

procedure TDatabase.SetDBMS(const Value: TDBMS);
begin
  FDBMS := Value;
end;

procedure TDatabase.SetIP(const Value: string);
begin
  FIP := Value;
end;

procedure TDatabase.SetPass(const Value: string);
begin
  FPass := Value;
end;

procedure TDatabase.SetSite(const Value: string);
begin
  FSite := Value;
end;

procedure TDatabase.SetUser(const Value: string);
begin
  FUser := Value;
end;

end.
