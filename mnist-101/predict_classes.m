function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % X -> the test examples for which the classes must be predicted
  % weights -> the trained weights (after optimization)
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % classes -> a vector with labels from 1 to 10 corresponding to
  %            the test examples given as parameter
  
% selectez elementele corespunzatoare fiecarei din matricele Theta_1 si Theta_2 si le reconstruiesc pe COLOANE!!!
  Theta_1 = weights(1 : hidden_layer_size * (input_layer_size + 1));
  Theta_2 = weights(length(Theta_1) + 1 : length(weights));
  Theta_1 = reshape(Theta_1, hidden_layer_size, input_layer_size + 1);
  Theta_2 = reshape(Theta_2, output_layer_size, hidden_layer_size + 1);
  [m n]= size(X);

  %Forward propagation
  a = [ones(1, m); X'];         %matricea activarilor in layerul de input (+ bias)
  z = Theta_1 * a;              %aplic prima transformare => layer intermediar preactivare
  [a] = sigmoid(z);             %activez rezultatelor din layer-ul intermediar
  a = [ones(1, m); a];          %adaug componenta de bias
  z = Theta_2 * a;              %aplic a doua transformare => rezultatele layer-ul de output practivare
  [a] = sigmoid(z);             %activez rezultatelor finale => matrice de predictii cu dimensiunea output_layer_size * m
  
  %pentru fiecare vector de predictii(coloana a matricei de predictii) labelul care se asociaza
  %e dat de indexul liniei ce contine probabilitatea cea mai mare
  [~, classes] = max(a);          
  classes = classes';

endfunction

function [h] = sigmoid(x)
  h = 1 ./ (1 + e.^(-x));
endfunction


