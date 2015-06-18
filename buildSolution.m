init_Quad;
obj = kalmanObj(@getUproportional, A, B, C , D, tauPhi,...
            tauPsi, Q, QI, R, RI, ft, yref, X0, XZ0, step, Tend);  
        
objFromDiss = modelObj(@getUfromDiss, @rightfNEW, A, B, C , D,...
              QI, RI, ft, yref, X0, step, Tend);         
    
fullparams = 4;
rqp =2;
omegas=3;
prqwomegas=1;

tLabel = 'время [с]';
omegaLabel = 'w [м/c], \omega [рад/c]';
allLabel = '';
uLabel = 'U [В]';


print = 1;
str = max(yref);
if(print == 1 && str ==0)

plotWithTitle(obj.T, obj.XZ(:,1:size(obj.yref)),1,'Y',...
    tLabel, omegaLabel, rqp);
plotWithTitle(obj.T, obj.getU(), 3, 'U',...
    tLabel, uLabel,omegas);
% plotWithTitle(objFromDiss.T, obj.getX, 4,'X',tLabel,...
% allLabel,prqwomegas);

% plotWithTitle(obj.T, obj.XZ ,1 ,'XZ', tLabel, allLabel, fullparams);

Xi = objFromDiss.getX;
plotWithTitle(objFromDiss.T, Xi(:,1:4), 11,'Yi',tLabel,...
omegaLabel,rqp);
plotWithTitle(objFromDiss.T, objFromDiss.getU, 33,'Ui',...
    tLabel, uLabel ,omegas);
% plotWithTitle(objFromDiss.T, objFromDiss.getX, 44,'Xi',tLabel,...
% allLabel,prqwomegas);
end


if(str ~= 0)
plotWithTitle(obj.T, obj.XZ(:,1:size(obj.yref)),100,'Yref',...
    tLabel, omegaLabel, rqp);
plotWithTitle(obj.T, obj.getU(), 300, 'Uref',...
    tLabel, uLabel,omegas);
% plotWithTitle(objFromDiss.T, obj.getX, 400,'Xref',tLabel,...
% allLabel,prqwomegas);

% plotWithTitle(obj.T, obj.XZ ,1 ,'XZref', tLabel, allLabel, fullparams);
Xir = objFromDiss.getX;         
plotWithTitle(objFromDiss.T, Xir(:,1:4), 110,'Yiref',tLabel,...
omegaLabel,rqp);
plotWithTitle(objFromDiss.T, objFromDiss.getU, 330,'Uiref',...
    tLabel, uLabel ,omegas);
end

integr = 1;
if(integr == 1)
I = integralCriterionStructure(obj)
Ii = integralCriterionStructure(objFromDiss)
end

po = 0;
if(po == 1)
parametric_Optimisation
end

print = 0;
if(print == 1)
plotWithTitle(obj.T, obj.XZ, 44,'XZ(T)','XZt','x','y');
plotWithTitle(obj.T, obj.XZ(:,1:size(obj.yref)),33,'y ref','Yr','x','y');
plotWithTitle(obj.T, obj.getU(), 55, 'U(T)', 'U', 'x', 'y');                 
end

