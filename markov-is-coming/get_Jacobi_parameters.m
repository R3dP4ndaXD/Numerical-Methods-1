function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
  
  % G -> iteration matrix
	% c -> iteration vector
  
  s = size(Link,1);
  G = Link(1 : s - 2, 1 : s - 2);
  c = Link(1 : s - 2, s -1);        %probabilitatile pentru win
endfunction
