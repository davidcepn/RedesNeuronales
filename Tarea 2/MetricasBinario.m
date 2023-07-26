% -------------------------------------------------------------------------
% Redes Neuronales
% Función para obtención de métricas de un clasificador binario
% Realizado por: David Fabián Cevallos Salas
% EPN, Doctorado FIEE
% -------------------------------------------------------------------------

% Parámetros de entrada:
%   Ytrue: Vector con etiquetas verdaderas
%   Ypred: Vector con etiquetas de predicción
%   Yprob: Vector con valores de probabilidades de predicción de cada clase
%   pos_class: Clase positiva para obtención de métricas
%   fold: Número de fold que se está ejecutando
function Output = MetricasBinario(Ytrue, Ypred, Yproba, pos_class, meaning, fold)
    % Matriz de confusión
    C = confusionmat(Ytrue', Ypred');
    
    % Cálculo de métricas
    Prec = diag(C)./sum(C,1)';
    Rec = diag(C)./sum(C,2);
    F1s = 2.*Prec.*Rec./(Prec+Rec);
    Accuracy = sum(diag(C))/sum(C,"all");
    Error = 1-Accuracy;
    
    % Se toma métricas correspondientes a la clase positiva
    Precision = Prec(pos_class);
    Recall = Rec(pos_class);
    F1 = F1s(pos_class);
    
    % Curva ROC 
    figure;
    title(strcat('Curva ROC para Fold Nro.',num2str(fold)));
    grid on;
    hold on;
    [x,y,t,Auc] = perfcurve(Ytrue,Yproba(:,pos_class),pos_class);
    plot(x,y);
    legend(strcat("Clase ", meaning, " (AUC=", string(round(Auc,4)),")"), 'Location', 'southeast');
    hold off;

    % Se retorna resultado
    Output = [Precision, Recall, F1, Accuracy, Error, Auc];
end