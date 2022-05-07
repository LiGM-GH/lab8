unit lib_string;

interface
    Procedure changesSort(var arr : array of string);
    overload;

    Procedure selectionSort(var arr : array of string);
    overload;

    procedure insertionSort(var arr : array of String);
    overload;

    Procedure fastSort(var arr : array of String; arr_begin, arr_end : integer);
    overload;

implementation
    procedure changesSort(var arr : array of String);
    overload;
    var index1, index2 : integer;
        buffer : string;
        AnyChanges : boolean;
    begin
        for index1 := 0 to length(arr) - 1 do begin
            AnyChanges := false;
            for index2 := 0 to length(arr) - 2 do begin
                if arr[index2] > arr[index2 + 1]
                then begin
                    AnyChanges := true;
                    buffer          := arr[index2];
                    arr[index2]     := arr[index2 + 1];
                    arr[index2 + 1] := buffer;
                end;
            end;
            if not AnyChanges 
            then begin writeln; break; end;
        end;
    end;

    Procedure selectionSort(var arr : Array of String);
    overload;
    var index1, index2, min_index : integer;
        min, buffer : string;
    begin
        for index1 := 0 to length(arr) - 2 do begin
            min := arr[index1]; min_index := index1;
            for index2 := index1 + 1 to length(arr) - 1 do begin
                if arr[index2] < min then begin
                    min := arr[index2];
                    min_index := index2
                end;
            end;
            if min_index <> index1 then begin
                buffer := arr[index1];
                arr[index1] := min;
                arr[min_index] :=  buffer;
            end;
        end;
    end;

    Procedure insertionSort(var arr : Array of String);
    overload;
    var index1, index2 : integer;
        elem_buffer : string;
    begin
        index1 := 0;
        while (index1 < length(arr)) do begin
            while   (index1 < length(arr) - 2)
                and (arr[index1] < arr[index1 + 1])
            do index1 := index1 + 1;
            if index1 < length(arr)
            then begin // changing elements
                index2 := index1 - 1;
                elem_buffer := arr[index1];
                while   (index1 < length(arr))
                    and (index2 >= 0)
                    and (elem_buffer < arr[index2])
                do begin // changing elements
                // writeln('index2: ', index2, ', elems: ', arr[index2], ' -> ', arr[index2 + 1], ', buffer: ', elem_buffer);
                    arr[index2 + 1] := arr[index2];
                    index2 := index2 - 1;
                end;
                arr[index2 + 1] := elem_buffer;
            end;
            index1 := index1 + 1;
        end;
    end;

    function expr(index1, index2 : integer) : boolean;
    begin
        expr := index1 > index2
    end;

    Procedure fastSort(var arr : Array of String; arr_begin, arr_end : integer);
    overload;
    var index1, index2 : integer;
        value, buffer, elem : string;
    begin
        writeln('Sorting ', arr_begin, ', ', arr_end);
        index1 := arr_begin;
        index2 := arr_end;
        value := arr[(arr_begin + arr_end) div 2];
        repeat
        write('arr is'); for elem in arr do write(', ', elem); writeln;
            while   (arr[index1] < value) 
                and (index1 < arr_end) 
            do index1 := index1 + 1;
            while (arr[index2] > value)
                and (index2 > arr_begin) 
            do index2 := index2 - 1;

            if not expr(index1, index2) then begin
                if arr[index1] > arr[index2] then begin
                writeln('Changing ', index1, index2);
                    buffer := arr[index1];
                    arr[index1] := arr[index2];
                    arr[index2] := buffer;
                end;
                index1 := index1 + 1;
                index2 := index2 - 1;
            end;
        until expr(index1, index2);
        if index1 < arr_end then fastSort(arr, index1, arr_begin);
        if index2 > arr_begin then fastSort(arr, arr_begin, index2);
    end;
end.
