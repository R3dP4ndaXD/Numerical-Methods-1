function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
  [m n] = size(FeatureMatrix);
  A = FeatureMatrix' * FeatureMatrix;     %matricea sistemului
  b = FeatureMatrix' * Y;                 %coloana termenilor liberi
  Theta = zeros(n, 1);                    %aproximarea initiala a solutiei 
  if (isdefinite(A) == 0)
    Theta = [0; Theta];
    return
  endif
  r_0 = b - A * Theta;
  v = r_0;
  tol_sq = tol * tol
  k = 1;
  while (k < iter && (r_0' * r_0 > tol_sq))
    t = (r_0' * r_0) / (v' * A * v);
    Theta = Theta + t * v;
    r = r_0 - t * A * v;
    sk = (r' * r) / (r_0' * r_0);
    v = r + sk * v;
    r_0 = r;
    k = k + 1;
  endwhile
  Theta = [0; Theta];
endfunction

 