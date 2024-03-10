function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
  len = length(probabilities);
  path = [start_position];            
  visited = zeros(1, len);              %fac initilizarile pentru pozitia de start
  visited(start_position) = true;

  while (isempty(path) == false)
     position = path(end);              %extarg pozitia
     if (position == len - 1)           %am ajuns la win
       path = path';
       return
     endif

     neighs = find(Adj(position, :));                   %vecini nodului curent
     idx_unvisited_neighs = find(~visited(neighs));     %nodurile nevizitate
     unvisited_neighs = neighs(idx_unvisited_neighs);   %vecini nevizitati
     if (isempty(unvisited_neighs) == true)
        path(end) = [];
     endif
     [~, idx_neigh] = max(probabilities(unvisited_neighs)); 
     neigh = unvisited_neighs(idx_neigh);               %vecinul nevizitat cu probavilitatea cea mai mare
     visited(neigh) = true;
     path = [path neigh];
  endwhile
  path = path';
endfunction
