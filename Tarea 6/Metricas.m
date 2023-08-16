% Función para obtención de métricas de problema multiclase
function Output = Metricas(Ytrue, Ypred)
    C = confusionmat(Ytrue', Ypred');
    
    Prec = diag(C)./sum(C,1)';
    Rec = diag(C)./sum(C,2);
    F1s = 2.*Prec.*Rec./(Prec+Rec);
    Accuracy = sum(diag(C))/sum(C,"all");
    Error = 1-Accuracy;
    
    Precision = mean(Prec, "omitnan");
    Recall = mean(Rec, "omitnan");
    F1 = mean(F1s, "omitnan");
    
    Output = [Precision, Recall, F1, Accuracy, Error];
end