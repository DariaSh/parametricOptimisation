function dIdp = getdIdp( k, i, j, kalmanObj, I)
    step=0.01;
    Ac=kalmanObj.Ac;
    Bc=kalmanObj.Bc;
    Cc=kalmanObj.Cc;

if k>=1 && k<=kalmanObj.sizeOfAcParams
     Ac = variateMatrix(Ac, step, i, j);
     obj =kalmanObj.recalculateSolution( Ac, Bc, Cc );
     Inext = integralCriterion(obj);

     Ac = variateMatrix(Ac, -step, i, j);
     Iprev = integralCriterion(kalmanObj.recalculateSolution(Ac,Bc,Cc));
     
     dIdp=(Inext-Iprev)/(2*step);  

end
   
if k>=kalmanObj.sizeOfAcParams+1 && k<=kalmanObj.sizeOfBcParams
     Bc = variateMatrix(Bc, step, i, j);
     obj = kalmanObj.recalculateSolution(Ac,Bc,Cc);
     Inext = integralCriterion(obj);

     Bc = variateMatrix(Bc, -step, i, j);
     Iprev = integralCriterion(kalmanObj.recalculateSolution(Ac,Bc,Cc));
     
     dIdp=(Inext-Iprev)/(2*step);  
end


if k>=kalmanObj.sizeOfBcParams+1 && k<=kalmanObj.sizeOfCcParams
     Cc = variateMatrix(Cc, step, i, j);
     Inext = integralCriterion(kalmanObj.recalculateSolution(Ac,Bc,Cc));

     Cc = variateMatrix(Cc, -step, i, j);
     Iprev = integralCriterion(kalmanObj.recalculateSolution(Ac,Bc,Cc));
     
     dIdp=(Inext-Iprev)/(2*step);  
else

end

end