function [X, y] = load_dataset(path)
  % path -> a relative path to the .mat file that must be loaded
  
  % X, y -> the training examples (X) and their corresponding labels (y)
  
  data = load(path);    %incarca in memorie fisierul
  X = data.X;           %imparte structura in cele doua componente
  y = data.y;                   

endfunction