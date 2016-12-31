// Unit : DH Informator
// Version : 0.2
// (C) Doddy Hackman 2016

unit DH_File_Joiner;

interface

uses Windows, SysUtils, Classes;

type
  T_DH_File_Joiner = class
  private
  public
    constructor Create;
    destructor Destroy; override;
    function join_files(filename: string; files: array of string): boolean;
    function split_files(filename: string; files: array of string;
      limits: array of integer): boolean;
  end;

implementation

constructor T_DH_File_Joiner.Create;
begin
  inherited Create;
  //
end;

destructor T_DH_File_Joiner.Destroy;
begin
  inherited Destroy;
end;

function T_DH_File_Joiner.join_files(filename: string;
  files: array of string): boolean;
var
  file_stream, home_stream: TFileStream;
  i: integer;
begin
  try
    begin
      home_stream := TFileStream.Create(filename, fmCreate);
      for i := Low(files) to High(files) do
      begin
        file_stream := TFileStream.Create(files[i], fmOpenRead);
        home_stream.CopyFrom(file_stream, file_stream.Size);
        file_stream.Free;
      end;
      home_stream.Free;
      Result := True;
    end;
  except
    begin
      Result := False;
    end;
  end;
end;

function T_DH_File_Joiner.split_files(filename: string; files: array of string;
  limits: array of integer): boolean;
var
  home_stream, file_stream: TStream;
  content: array of Byte;
  i: integer;
begin
  try
    begin
      home_stream := TFileStream.Create(filename, fmOpenRead);
      for i := Low(files) to High(files) do
      begin
        file_stream := TFileStream.Create(files[i], fmCreate);
        SetLength(content, limits[i]);
        home_stream.ReadBuffer(Pointer(content)^, Length(content));
        file_stream.WriteBuffer(content[0], Length(content));
        file_stream.Free;
      end;
      home_stream.Free;
      Result := True;
    end;
  except
    begin
      Result := False;
    end;
  end;
end;

end.

// The End ?
