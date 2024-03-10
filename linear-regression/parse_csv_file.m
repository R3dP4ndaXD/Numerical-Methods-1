function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  fid = fopen (file_path, "r");
  [Initial] = textscan(fid, "%f %f %f %f %f %s %s %s %s %s %u %s %s", 'Delimiter', ',', 'HeaderLines', 1);
  Y = Initial(1,1);                      %prima coloana
  Y = cell2mat(Y);
  
  m = size(Initial{1,1}, 1);
  n = size(Initial, 2);
  Initial = Initial(1, 2 : n);
  n = n - 1;
  InitialMatrix = cell(m, n);
  
  %parcurg fiecarea coloana din matricea Initial si salvez linie cu linie intr-o matrice de celule(cu elemente cell) 
  for j = 1 : n
    for i = 1 :m
      InitialMatrix(i,j) = Initial{1,j}(i);
    endfor
  endfor

endfunction
