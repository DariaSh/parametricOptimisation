epsilonForNormOfGradient=0.01;
epsilonForStepChoice = 0.01;
lambda=0.01;
delta = 2;
I=integralCriterionStructure(obj);
I0=I;
Cctemp=obj.Cc;
tic
while(1)
    %вычисление градиента в точке  
    %gradI = getGradientParFormula(obj);
    gradI = getGradientIterative(obj);
    Icurrent = integralCriterionStructure(obj);
    
    %шаг в направлении антиградиента
    if( norm( gradI ) < epsilonForNormOfGradient )
        break;
    else 
         while(1)
             
              Cc = obj.Cc;
              Bc = obj.Bc;
              Ac = obj.Ac;
              Cctemp = Cc;
              Cc = Cc - lambda * getPartOfGradientByName( gradI, obj, 'Cc');
              
             % Bc = Bc - lambda * getPartOfGradientByName( gradI, obj, 'Bc');
             % Ac = Ac - lambda * getPartOfGradientByName( gradI, obj, 'Ac');
              
              obj = obj.recalculateSolution(Ac, Bc, Cc );
              obj.K=(obj.K)';
              
              Inext = integralCriterionStructure(obj)            
              if(Inext.sum > Icurrent.sum)
                lambda=lambda*delta;
                Icurrent=Inext;
                break;
              end
              
            Icurrent=Inext;
            Icurrent.sum/I0.sum
            if(Inext.sum-Icurrent.sum>1)
                Inext.sum-Icurrent.sum
                obj = obj.recalculateSolution(Ac, Bc, Cctemp );            
                break;
            end
            if(Icurrent.sum/I0.sum>1)
                obj = obj.recalculateSolution(Ac, Bc, Cctemp );     
                break;
            end
            
         end
         if(Inext.sum-Icurrent.sum>1)
             Inext.sum-Icurrent.sum
             obj = obj.recalculateSolution(Ac, Bc, Cctemp );  
             
                break;
            end
         
         if(Icurrent.sum/I0.sum>1)
             obj = obj.recalculateSolution(Ac, Bc, Cctemp );     
                break;
            end

    end
    Icurrent
    I0
end


