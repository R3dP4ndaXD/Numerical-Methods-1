function [Labyrinth] = parse_labyrinth (file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits
  
  % Labyrinth -> the matrix of all encodings for the labyrinth's walls
  
  fid = fopen (file_path, "r");
  [size] = fscanf(fid, "%i", [1,2]);                    %dimensiunile
  [Labyrinth, ~] = fscanf(fid, "%i", flip(size));  % flipul apare fiindca citeste pe linii dar scrie pe coloane
  Labyrinth = Labyrinth';                                     
  fclose (fid);
  
endfunction