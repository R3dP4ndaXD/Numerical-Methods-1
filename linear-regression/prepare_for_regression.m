function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples

  [m n] = size(InitialMatrix);
  FeatureMatrix= zeros(m, n);
  i=1;
  %construieste o matrice normala pe baza matricei de celule convertind 
  %stringurile numerice si inlucuind coloanele cu stringuri alfanumerice la 1/2 coloane cu codificarile aferente 
  %ii si jj sunt indexi pentru matricea de celule, iar i si j sunt indexi pentru matricea construita
  for ii = 1:m    
    j = 1;
    for jj = 1:n
      if (strcmp(InitialMatrix(ii, jj),"yes"))
        FeatureMatrix(i,j) = 1;
      elseif (strcmp(InitialMatrix(ii, jj),"no"))
        FeatureMatrix(i,j) = 0;
      elseif (strcmp(InitialMatrix(ii, jj),"semi-furnished"))
        FeatureMatrix(i,j) = 1;
        FeatureMatrix(i,j+1) = 0;
        j=j+1;
      elseif (strcmp(InitialMatrix(ii, jj),"unfurnished"))
        FeatureMatrix(i,j) = 0;
        FeatureMatrix(i,j+1) = 1;
        j=j+1;
      elseif (strcmp(InitialMatrix(ii, jj),"furnished"))
        FeatureMatrix(i,j) = 0;
        FeatureMatrix(i,j+1) = 0;
        j=j+1;
      else
        if (isnumeric(InitialMatrix{ii, jj}))
          FeatureMatrix(i,j) = InitialMatrix{ii, jj};
        else
          FeatureMatrix(i,j) = str2num(InitialMatrix{ii, jj});
        endif
      endif
      j=j+1;
    endfor
    i=i+1;
   endfor

endfunction