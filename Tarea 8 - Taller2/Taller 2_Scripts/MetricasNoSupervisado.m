% ------------------------------------------------------------------------
% ESCUELA POLITÉCNICA NACIONAL
% SCRIPT DE MÉTRICAS PARA ANALIZAR DESEMPEÑO DE ALGORITMOS DE APRENDIZAJE 
% NO SUPERVISADO
% Realizado por: David Fabián Cevallos Salas
% Fecha: 2023-08-21
% ------------------------------------------------------------------------
% Función para cálculo de métricas - Aprendizaje No Supervisado
% Parámetros de entrada:
%   X: Datos del problema (filas = observaciones, columnas = descriptores)
%   idx: Número de cluster al que fue asignada cada observación
% Parámetros de salida:
%   SSW: Sum of Squared Within
%   SSB: Sum of Squared Between
%   WB: WB-Index
%   SIL: Silhouette 
function [SSW,SSB,WB,SIL] = MetricasNoSupervisado(X, idx)
    % Valores generales
    [N,col] = size(X);
    cmin = min(idx);
    cmax = max(idx);
    m = cmax-cmin+1;
    fila = 1;
    suma = 0;
    
    % Por cada uno de los clusters:
    for i = cmin:cmax
        % Obtención de centroide
        observaciones = X(idx==i,:);
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
    
    % Métrica Silhouette 
    SIL = mean(silhouette(X,idx),"omitnan");
end