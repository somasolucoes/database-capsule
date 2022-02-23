unit SomaCapsulas.Database.Interfaces;

interface

uses
  SomaCapsulas.Database.Types;

type
  IDatabase = interface
  ['{096245DC-7DD9-40B8-B62F-A58CB235F333}']
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
    property DBMS: TDBMS read GetDBMS write SetDBMS;
    property IP: string read GetIP write SetIP;
    property Site: string read GetSite write SetSite;
    property User: string read GetUser write SetUser;
    property Pass: string read GetPass write SetPass;
  end;

  IDatabaseBuilder = interface
  ['{2ED3BD79-5B75-497B-8D7A-F29D4370FEC2}']
    function WithIP(AIP: string): IDatabaseBuilder;
    function OnSite(ASite: string): IDatabaseBuilder;
    function UsingUser(AUser: string): IDatabaseBuilder;
    function WithPassword(APassword: string): IDatabaseBuilder;
    function ByDBMS(ADBMS: TDBMS): IDatabaseBuilder;
    function Build: IDatabase;
  end;

implementation end.
