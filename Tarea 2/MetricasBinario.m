% -------------------------------------------------------------------------
% Redes Neuronales
% Funci�n para obtenci�n de m�tricas de un clasificador binario
% Realizado por: David Fabi�n Cevallos Salas
% EPN, Doctorado FIEE
% -------------------------------------------------------------------------

% Par�metros de entrada:
%   Ytrue: Vector con etiquetas verdaderas
%   Ypred: Vector con etiquetas de predicci�n
%   Yprob: Vector con valores de probabilidades de predicci�n de cada clase
%   pos_class: Clase positiva para obtenci�n de m�tricas
%   fold: N�mero de fold que se est� ejecutando
function Output = MetricasBinario(Ytrue, Ypred, Yproba, pos_class, meaning, fold)
    % Matriz de confusi�n
    C = confusionmat(Ytrue', Ypred');
    
    % C�lculo de m�tricas
    Prec = diag(C)./sum(C,1)';
    Rec = diag(C)./sum(C,2);
    F1s = 2.*Prec.*Rec./(Prec+Rec);
    Accuracy = sum(diag(C))/sum(C,"all");
    Error = 1-Accuracy;
    
    % Se toma m�tricas correspondientes a la clase positiva
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