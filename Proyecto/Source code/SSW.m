function [SSW,SSB,WB] = SSW(X, idx)
    % Valores generales
    [N,col] = size(X);

    clusteres = unique(idx);
    m = length(clusteres);

    fila = 1;
    suma = 0;
    
    % Por cada uno de los clusters:
    for i = 1:m
        % Obtención de centroide
        observaciones = X(idx==clusteres(i),:);
        centroide = mean(observaciones,1,"omitnan");
        centroides(fila,:) = centroide;
        
        % Obtención de total de observaciones en cluster
        [ni,ci] = size(observaciones);
        n(fila,1) = ni;
        
        % Cálculo de suma de distancias euclideanas
        suma = suma + sum(pdist2(observaciones,centroide));
        
        % Se incrementa en 1 el número de fila 
        fila = fila+1;
    end
    
    % Obtención de centroide de todos los datos
    gcentroide = mean(X,1,"omitnan");
    
    % Métrica Sum of Squared Within (SSW)
    SSW = suma/N;
    
    % Métrica Sum of Squared Between (SSB)
    SSB = sum(n.*pdist2(centroides,gcentroide))/N;
    
    % Métrica WB-Index
    WB = m*SSW/SSB;
end