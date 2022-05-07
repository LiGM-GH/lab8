program main; 
uses lib_integer, lib_string;

Procedure fill(var arr : Array of integer);
var index : integer;
begin
    for index := 0 to (length(arr) - 1) div 2 do begin
        arr[index] := index;
        (* writeln('Now index is ', index, 
                ' and element is ', arr[index]); *)
    end;
    for index := (length(arr) - 1) div 2 to length(arr) - 1 do begin
        arr[index] := -index
    end;
end;

var arr : Array of integer;
    elem : integer;
begin
    SetLength(arr, 500);
    fill(arr);
    { // Operation with no sorting also had time 0.001-0.003 s
    writeln('Inserting!'); // 0.006 s (rev.order), 0.006 s (needed order), 0.007 s (other order)
    insertionSort(arr);
    for elem in arr do writeln(elem); fill(arr);
    writeln('Selecting!'); // 0.009 s (rev.order), 0.004 s (needed order), 0.010 s (other order)
    selectionSort(arr);
    for elem in arr do writeln(elem); fill(arr);
    writeln('Changing!');  // 0.007 s (rev.order), 0.008 s (needed order), 0.012 s (other order)
    changesSort(arr);
    for elem in arr do writeln(elem); fill(arr);
    writeln('FSorting!');  // 0.007 s (rev.order), 0.007 s (normal order), 0.007 s (other order)
    fastSort(arr, 0, length(arr));
    for elem in arr do writeln(elem); fill(arr);
    }
end.
