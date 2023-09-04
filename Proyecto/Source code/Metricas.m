% Función para obtención de métricas de problema multiclase
% Orden de especificación de las métricas:
% Precision, Recall, F1-score, Accuracy, Error, Specificity, False Positive
% Rate (FPR)
function Output = Metricas(Ytrue, Ypred)
    C = confusionmat(Ytrue', Ypred');
    
    Prec = diag(C)./sum(C,1)';
    Rec = diag(C)./sum(C,2);
    F1s = 2.*Prec.*Rec./(Prec+Rec);
    Accuracy = sum(diag(C))/sum(C,"all");
    Error = 1-Accuracy;
    
    total = sum(C,"all")*ones(length(C),1);
    Sps =  (total-sum(C,1)'-sum(C,2)+sum(diag(C),2))./(total-sum(C,2));
    FPRs = 1-Sps;
    
    Precision = mean(Prec, "omitnan");
    Recall = mean(Rec, "omitnan");
    F1 = mean(F1s, "omitnan");
    Specificity = mean(Sps, "omitnan");
    FPR = mean(FPRs, "omitnan");
    
    Output = [Precision, Recall, F1, Accuracy, Error, Specificity, FPR];
end