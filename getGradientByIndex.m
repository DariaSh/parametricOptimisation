function gradIi = getGradientByIndex(i, K, X, Z, T, obj,kalmanObj,X0Z0,interval)
%частная производная
Q=obj.Q;
R=obj.R;
sizeOfGradient = size(K,2);

Icurrent = getIntegralCriterion(X, K , Z, Q , R , T ,false);
% I = I (X, K , Z, Q , R ,T )
% Q , R ,T - consts
% XZ=XZ(K)
% I = I(X(K), K , Z(K))

%gradIi=zeros(1,sizeOfGradient);
%dp=zeros(1,sizeOfGradient);
%точность для частной производной
epsilon =0.001;
if (i>sizeOfGradient && i<1)
    disp('i must be in [1,sizeOfGradient]')
end
 %шаг вычисления
 step=0.1;
while(1)
        K = variateMatrix(K, step, 1, i);
        % checkControlability(obj);
        Inext= integrCritWithNewK(K , obj, kalmanObj, X0Z0, interval);
        gradIi=(Inext-Icurrent)/step;
       
        %dp(1,i)=step;
        if(abs(Inext-Icurrent)<epsilon)
            break;
        end
        step=step/2;
        Icurrent=Inext;        
end
    
end

