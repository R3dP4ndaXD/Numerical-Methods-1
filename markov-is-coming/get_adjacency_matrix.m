function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  [m n] = size(Labyrinth);
  last_cell = m * n;                                  %aflu cat de mare e labirintul
  nodes = reshape(1 : last_cell, [n m]) .';           %construiesc matrice cu codificarea starilor
  %bordez matricea cu starile de win si lose
  nodes = [(last_cell + 1) * ones(1,n); nodes; (last_cell + 1) * ones(1,n)];           
  nodes = [(last_cell + 2) * ones(m + 2, 1) nodes (last_cell + 2) * ones(m + 2, 1)];
  ii =[];
  jj =[];
  %verific fiecare celula a labirintul si adaug in vectorii de indici perechile de coordonate
  %aferente cailor existente exprimate prim matricea de adiacenta
  
  for i = 1 : m
    for j = 1 : n
      if (bitand(Labyrinth(i,j), 8) == 0)
        ii = [ii nodes(i+1, j+1)];
        jj = [jj nodes(i, j+1)];
      endif
      if (bitand(Labyrinth(i,j), 4) == 0)
        ii = [ii nodes(i+1, j+1)];
        jj = [jj nodes(i+2 , j+1)];
      endif
      if (bitand(Labyrinth(i,j), 2) == 0)
        ii = [ii nodes(i+1, j+1)];
        jj = [jj nodes(i+1 , j+2)];
      endif
      if (bitand(Labyrinth(i,j), 1) == 0)
        ii = [ii nodes(i+1, j+1)];
        jj = [jj nodes(i+1 , j)];
      endif
    endfor
  endfor
  %adaug starile de win si lose
  ii = [ii (last_cell +1) (last_cell +2)];
  jj = [jj (last_cell +1) (last_cell +2)];
  sv = ones(1, length(ii));
  Adj = sparse(ii, jj, sv, last_cell +2, last_cell +2);
  
endfunction