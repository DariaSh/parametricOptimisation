function dPdpi = getdPdp(k, i,j, kalmanObj )
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
Azeros = zeros(size(kalmanObj.Ac,1),size(kalmanObj.Ac,1));

if k>=1 && k<=sizeOfAcParams
    dPdpi=[Azeros Azeros; Azeros getPartialOfMatrix(i,j,kalmanObj.Ac)];
end

if k>=sizeOfAcParams+1 && k<=sizeOfBcParams
    dPdpi=[Azeros Azeros; getPartialOfMatrix(i,j,kalmanObj.Bc)*kalmanObj.C Azeros];
end

if k>=sizeOfBcParams+1 && k<=sizeOfCcParams
    dPdpi=[Azeros kalmanObj.B*getPartialOfMatrix(i,j,kalmanObj.Cc); Azeros Azeros];
else
    %disp('index is out of bounds');
end

end

