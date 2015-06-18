function [gradI,dp ]= getGradient(kalmanObj)
% I = I (X, K , Z, Q , R ,T )
% Q , R ,T - consts
% XZ=XZ(K)
% I = I(X(K), K , Z(K))
Klqr=kalmanObj.Klqr;
sizeOfGradient = size(Klqr,2);
dp=zeros(1,sizeOfGradient);
gradI=zeros(1,sizeOfGradient);
gradIprev=zeros(1,sizeOfGradient);

    
    epsilon =0.0001;
    Ac=kalmanObj.Ac;
    Bc=kalmanObj.Bc;
    CcConst=kalmanObj.Cc;

  
    for i=1:sizeOfGradient
    %шаг вычисления
    step=0.1;
    Cc=CcConst;
    Icurrent =  getIntegralCriterion(getKalmanObjByAcBcCc(Ac,Bc,Cc), false);
    Cc = variateMatrix(Cc, step, 1, i);
    Inext= getIntegralCriterion(getKalmanObjByAcBcCc(Ac,Bc,Cc), false);
    gradIprev(1,i)=(Inext-Icurrent)/step;         
    while(1)
        Cc = variateMatrix(Cc, step, 1, i);
        Inext= getIntegralCriterion(getKalmanObjByAcBcCc(Ac,Bc,Cc), false);
        gradI(1,i)=(Inext-Icurrent)/step; 
        dp(1,i)=step;
        if(abs(gradI(1,i)-gradIprev(1,i))<epsilon)
            break;
        end
        gradIprev(1,i)=gradI(1,i);
        step=step/2;
        Icurrent=Inext;
        
    end
    end
end