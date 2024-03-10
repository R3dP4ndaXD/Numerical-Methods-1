function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

  for steps = 1 : max_steps
    x = G * x0 + c;             % caluleaza x la pasul curent
    err = norm(x - x0);
    if(err < tol)
      return
    endif
    x0 = x;                     %pregateste pasul urmator
  endfor
endfunction