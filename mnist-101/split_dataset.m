function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  temp = [y X];                               %pun laolalta intrarile si labelurile asociate
  [m n] = size(temp);
  shuffled = temp(randperm(m), :);            %reasez intr-o ordine aleatoare setul de date
  part_1 = round(m * percent);                %cat de mare va fi parte pentru antrenamet                                          
  y_train = shuffled(1 : part_1, 1);          %prima parte e aleasa pentru antrenamet
  X_train = shuffled(1 : part_1, 2 : n);      
  y_test = shuffled(part_1 + 1 : m, 1);       %iar a doua pentru test
  X_test = shuffled(part_1 + 1 : m, 2 : n);   

endfunction