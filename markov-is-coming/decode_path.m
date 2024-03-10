function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states

  path = path';
  path(end)=[];                               %elimin starea win
  [row, col] = ind2sub([cols lines], path);   %trec de la codificarea starilor la coodonatele din matrice
  decoded_path = [col; row]';
endfunction