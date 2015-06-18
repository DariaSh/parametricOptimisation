function p = getGradientParFormula( kalmanObj)
% I = I (X, K , Z, Q , R ,T )
% Q , R ,T - consts
% XZ=XZ(K)
% I = I(X(K), K , Z(K))

%TO DO: передавать интервал
% sizeOfGradient = size(K,2);



%[T,psi]=ode45(@rightPsi, kalmanObj.t0:kalmanObj.step:kalmanObj.tend, psi0,[],kalmanObj);
%plotResult(9,'пси', T, psi, 0, false);

% parfor i=1:sizeOfGradient    
% end


%
% sizeOfAcParams=size(kalmanObj.Ac,1)*size(kalmanObj.Ac,2)
% sizeOfBcParams=size(kalmanObj.Bc,1)*size(kalmanObj.Bc,2)
% sizeOfCcParams=size(kalmanObj.Cc,1)*size(kalmanObj.Cc,2)

sizeOfAcParams=size(kalmanObj.Ac,1)*size(kalmanObj.Ac,2);
sizeOfBcParams=sizeOfAcParams+size(kalmanObj.Bc,1)*size(kalmanObj.Bc,2);
sizeOfCcParams=sizeOfBcParams+size(kalmanObj.Cc,1)*size(kalmanObj.Cc,2);

p=zeros(1,sizeOfCcParams);

k=1;
for i =1:size(kalmanObj.Ac,1)
    for j = 1:size(kalmanObj.Ac,2)
    %======
%        i
%        j
%        k
     p(1,k) = getGradByIndex(k, i, j, kalmanObj );
%      getdPdp(k, i,j, kalmanObj )
%      getdKdp(k, i,j, kalmanObj )
     k=k+1;
    %======
    
    end
end

for i =1:size(kalmanObj.Bc,1)
    for j = 1:size(kalmanObj.Bc,2)
    %======  
       p(1,k) = getGradByIndex(k, i, j, kalmanObj );
%        i
%        j
%        k
%        getdPdp(k, i,j, kalmanObj )
%        getdKdp(k, i,j, kalmanObj )
        k=k+1;
    %======
    end
end

for i =1:size(kalmanObj.Cc,1)
    for j = 1:size(kalmanObj.Cc,2)
    %======
       p(1,k) = getGradByIndex(k, i, j, kalmanObj );
%        i
%        j
%        k
%        getdPdp(k, i,j, kalmanObj )
%        getdKdp(k, i,j, kalmanObj )
       k=k+1;
    %======
    end
end

