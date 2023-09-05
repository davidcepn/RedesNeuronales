% ------------------------------------------------------------------------
% ESCUELA POLIT�CNICA NACIONAL
% SCRIPT DE M�TRICAS PARA ANALIZAR DESEMPE�O DE ALGORITMOS DE APRENDIZAJE 
% NO SUPERVISADO
% Realizado por: David Fabi�n Cevallos Salas
% Fecha: 2023-08-21
% ------------------------------------------------------------------------
% Funci�n para c�lculo de m�tricas - Aprendizaje No Supervisado
% Par�metros de entrada:
%   X: Datos del problema (filas = observaciones, columnas = descriptores)
%   idx: N�mero de cluster al que fue asignada cada observaci�n
% Par�metros de salida:
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
        % Obtenci�n de centroide
        observaciones = X(idx==i,:);
        centroide = mean(observaciones,1,"omitnan");
        centroides(fila,:) = centroide;
        
        % Obtenci�n de total de observaciones en cluster
        [ni,ci] = size(observaciones);
        n(fila,1) = ni;
        
        % C�lculo de suma de distancias euclideanas
        suma = suma + sum(pdist2(observaciones,centroide));
        
        % Se incrementa en 1 el n�mero de fila 
        fila = fila+1;
    end
    
    % Obtenci�n de centroide de todos los datos
    gcentroide = mean(X,1,"omitnan");
    
    % M�trica Sum of Squared Within (SSW)
    SSW = suma/N;
    
    % M�trica Sum of Squared Between (SSB)
    SSB = sum(n.*pdist2(centroides,gcentroide))/N;
    
    % M�trica WB-Index
    WB = m*SSW/SSB;
    
    % M�trica Silhouette 
    SIL = mean(silhouette(X,idx),"omitnan");
end