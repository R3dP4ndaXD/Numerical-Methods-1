function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  fid = fopen (file_path, "r");
  [m n] = fscanf(fid, "%i %i ", "C");


  for i = 1:m
    Y(i,1) = fscanf(fid, "%f", "C");                  %elementul din vectorul cu iesiri             
    for j = 1:n
      InitialMatrix{i, j} = fscanf(fid, "%s", "C");   
    endfor
  endfor
  fclose (fid);
endfunction