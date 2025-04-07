program x (x);

type
    ClassDeclaration = class
    public
        function Method: Integer;
    end;

function ClassDeclaration.Method: Integer;
begin
    WriteLn(33);
    Result := 33;
end;

var
    classInit: ClassDeclaration;
    returnInteger: Integer;
begin
    classInit := ClassDeclaration.Create;
    returnInteger := classInit.Method;
    WriteLn(returnInteger);
end.