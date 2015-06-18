classdef integralCriterionStructure
  
    properties
        sum ;
        accuracy;
        energy;
    end
    
    methods
        function I = integralCriterionStructure(object)
            % I(XQX')+I(URU') -квадратичный интегральный критерий
            % U=Kz
            % Q, R - задаются пользователем как коэффициенты
            T = object.T;
            X = object.getX;
            U = object.getU;

            NumberOfPoints = size(X,1);
            I1 = zeros(NumberOfPoints, 1);
            for i=1:NumberOfPoints,
                I1(i) = X(i,:)*object.QI*X(i,:)';
            end; 
            Is1 = trapz(T, I1); 

            for i=1:NumberOfPoints,
                  Uv = U(i,:);
                  I2(i) = Uv*object.RI*Uv';
            end;

            Is2 = trapz(T,I2); 

            I.sum = Is1+Is2;
            I.accuracy = Is1;
            I.energy = Is2;
        end
        
        function Isum = getSum(I)
            Isum = I.sum; 
        end
           
end
end
