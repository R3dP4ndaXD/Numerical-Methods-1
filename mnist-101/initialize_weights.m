function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values
  
  e = sqrt(6) / sqrt(L_prev + L_next);              %limita intervalalului
  matrix = 2 * e .* rand(L_next, L_prev + 1) - e;   %intai matrice cu elemente aleatoare intre (0, 1) care apoi sunt trecute in intervalul (-e, e)

endfunction
