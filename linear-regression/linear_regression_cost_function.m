function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function
  
  %pentru fiecare antrenanament calculeaza predictia si eroarea: (h(x_i) - y_i)
  %toate erorile astfel calculata se salveaza intr-un vector pentru care calculam norma si impartim la 2m
  [m n] = size(FeatureMatrix);
  Error = 1 / (2 * m) * norm(FeatureMatrix * Theta(2 : n + 1) - Y)^2;
  
endfunction