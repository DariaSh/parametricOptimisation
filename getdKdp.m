function dKdpi = getdKdp (k, i,j, kalmanObj )

%p_ka
%p_kb
%p_kc
% Ac=A+B*K_lqr-H_klm*C
% Bc=H_klm
% Cc=K_lqr
% P=[A BCc ; BcC Ac]
% K=[O Cc]
sizeOfAcParams=size(kalmanObj.Ac,1)*size(kalmanObj.Ac,2);
sizeOfBcParams=sizeOfAcParams+size(kalmanObj.Bc,1)*size(kalmanObj.Bc,2);
sizeOfCcParams=sizeOfBcParams+size(kalmanObj.Cc,1)*size(kalmanObj.Cc,2);
sizeOfAllParams =sizeOfAcParams+sizeOfBcParams+sizeOfCcParams; 
p=zeros(1,sizeOfAllParams);
%to do : make size of exactly A matrix of obj
Kzeros = zeros(size(kalmanObj.K,1),size(kalmanObj.K,2));
Czeros = zeros(size(kalmanObj.Cc,1),size(kalmanObj.Cc,2));
if k>=1 && k<=sizeOfAcParams
    dKdpi=Kzeros;
end

if k>=sizeOfAcParams+1 && k<=sizeOfBcParams
    dKdpi=Kzeros;
end

if k>=sizeOfBcParams+1 && k<=sizeOfCcParams
    dKdpi=[Czeros getPartialOfMatrix(i,j,kalmanObj.Cc)];
end;


end

