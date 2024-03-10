function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function
  
  %pentru fiecare antrenament calculeaza predictia si eroarea: (h(x_i) - y_i)
  %toate erorile astfel calculata se salveaza intr-un vector pentru care calculam norma si impartim la 2m
  %se calculeaza norma_2 a vectorului de weights si se adauga cu o anumita proportie rezultatului obtinut anterior

  [m n] = size(FeatureMatrix);
  Error = 1 / (2 * m) * norm(FeatureMatrix * Theta(2 : n + 1) - Y) ^ 2 + lambda * norm(Theta(2 : n + 1)) ^ 2;

endfunction