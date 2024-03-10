function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg
   
  % selectez elementele corespunzatoare fiecarei din matricele Theta_1 si Theta_2 si le reconstruiesc pe COLOANE!!!
  Theta_1 = params(1 : hidden_layer_size * (input_layer_size + 1));
  Theta_2 = params(length(Theta_1) + 1 : length(params));
  Theta_1 = reshape(Theta_1, hidden_layer_size, input_layer_size + 1);
  Theta_2 = reshape(Theta_2, output_layer_size, hidden_layer_size + 1);
  [m n] = size(X);
  Delta_1 = zeros(size(Theta_1));
  Delta_2 = zeros(size(Theta_2));
  J = 0;
  
  %Forward propagation
  a_1 = [ones(m, 1) X]';                                      %matricea activarilor in layerul de input (+ bias)
  z_2 = Theta_1 * a_1;                                        %aplic prima transformare => layer intermediar preactivare
  [a_2] = sigmoid(z_2);                                       %activez rezultatelor din layer-ul intermediar
  a_2 = [ones(1, m); a_2];                                    %adaug componenta de bias
  z_3 = Theta_2 * a_2;                                        %aplic a doua transformare => rezultatele layer-ul de output practivare
  [a_3] = sigmoid(z_3);                                       %activez rezultatelor finale => matrice de predictii cu dimensiunea output_layer_size * m
  Y = sparse(y, [1 : m], ones(1, m), output_layer_size, m);   %expandez vectorului de labels la o matrice de tipul lui a_3
  
  %Ma intereseaza sa fac doar operatiile dintre coloanele cu acelasi index ale matricei Y si a_3,
  %adica diagonala produsului a celor doua matrice, care ulterior se insumeaza, adica operatia de trace.
  %Cu produsul Haramald fac exclusiv inmultirile pentru determinarea diagonalei principale
  J = 1 / m * sum((-Y .* log(a_3) - (1 - Y) .* log(1 - a_3))(:)) + lambda / (2 * m) * (norm(Theta_1(:, [2 : input_layer_size + 1]), 'fro') ^ 2 + norm(Theta_2(:, [2 : hidden_layer_size + 1]), 'fro') ^ 2);
  
  %Backpropagation
  delta_3 = a_3 - Y;                                                                   %eroarea în layer-ul de output
  Delta_2  = Delta_2 + delta_3 * a_2';                                                 %acumulez gradientii trecerii de la layer-ul intermediar la layer-ul de output
  delta_2 = Theta_2' * delta_3 .* (a_2 .* (1-a_2));                                    %erorea în layer-ul intermediar
  delta_2(1, :) = [];                                                                  %elimin componenta de bias
  Delta_1  = Delta_1 + delta_2 * a_1';                                                 %gradientii trecerii de la layer-ul de input la cel intermediar
  
  grad_1 = 1 / m * Delta_1;
  grad_1(:, 2 : size(Delta_1, 2)) +=  lambda / m * Theta_1(:, 2 : size(Theta_1, 2));   %componenta de regularizare
  grad_2 = 1 / m * Delta_2;
  grad_2(:, 2 : size(Delta_2, 2)) +=  lambda / m * Theta_2(:, 2 : size(Theta_2, 2));   %componenta de regularizare

  grad = [reshape(grad_1, 1, []) reshape(grad_2, 1, [])]';                             %scriere desfasurata

%  save params params;
%  save X X;
%  save y y;
%  save lambda lambda;
%  save input_layer_size input_layer_size;
%  save hidden_layer_size hidden_layer_size;
%  save output_layer_size output_layer_size;                
%  save Theta_1 Theta_1;
%  save Theta_2 Theta_2;
%  save a_1 a_1;
%  save z_2 z_2;
%  save a_2 a_2;
%  save z_3 z_3;
%  save a_3 a_3;
%  save yy yy;
%  save test test;
%  save J J;
%  save Delta_1 Delta_1;
%  save Delta_2 Delta_2;
%  save delta_2 delta_2;
%  save delta_3 delta_3;
  
endfunction

function [h] = sigmoid(x)
  h = 1 ./ (1 + e.^(-x));
endfunction

