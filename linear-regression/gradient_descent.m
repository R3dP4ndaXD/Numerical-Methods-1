function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights
  
  Theta = zeros(n, 1);
  
  %pentru fiecare componenta j a lui Theta procedam astfel:
  %-pentru fiecare antrenanament i calculeaza predictia si eroarea: (h(x_i) - y_i) * x_i(j)
  %-rezultatele asftel obtinute o sa formeze un vector cu (m,1) care dupa transpunere va fi inmultit cu un vector ce contine componenta j a tuturor antrenamentelor
  %-rezultatul obtinut e folosit la actualizarea componentei j a lui Theta
  % tot procesul se repeta de iter ori
  for it = 1 : iter
    for j = 1: n
     Theta(j) = Theta(j) - alpha / m * (FeatureMatrix * Theta - Y)' * FeatureMatrix(:,j);
    endfor
  endfor
  Theta = [0; Theta];     %introducem prima componenta care se neglijeaza in calcule
endfunction