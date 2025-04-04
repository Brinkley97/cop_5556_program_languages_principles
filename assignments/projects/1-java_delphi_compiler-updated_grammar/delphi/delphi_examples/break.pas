program x (x);

var
    number: Integer;
begin
    number := 5; 
    for i := 1 to number do begin
        WriteLn(0);
        if (i = 2) then break;
    end;
end.