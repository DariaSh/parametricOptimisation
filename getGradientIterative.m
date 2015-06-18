function p = getGradientIterative( kalmanObj )
I = integralCriterionStructure(kalmanObj);

p=zeros(1,kalmanObj.sizeOfCcParams);

k=1;
for i =1:size(kalmanObj.Ac,1)
    for j = 1:size(kalmanObj.Ac,2)
    p(1,k) = getdIdp(k, i, j, kalmanObj, I);
    k=k+1;
    end
end

for i =1:size(kalmanObj.Bc,1)
    for j = 1:size(kalmanObj.Bc,2)
       p(1,k) = getdIdp(k, i, j, kalmanObj, I );
       k=k+1;
   end
end

for i =1:size(kalmanObj.Cc,1)
    for j = 1:size(kalmanObj.Cc,2)
       p(1,k) = getdIdp(k, i, j, kalmanObj,I );
       k=k+1;
    end   
end

end