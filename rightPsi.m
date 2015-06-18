function res = rightPsi(t, psi, kalmanObj)
% psi' = -A(p)^* psi + 2(Q+K(p)^* R K(p))^* x
% psi(T)=0 psi=s

P=kalmanObj.P;
Q=kalmanObj.Q;
R=kalmanObj.R;
K=kalmanObj.K;
size1=size(Q, 1);
NullMatrix=zeros(size1,size1);
Qext = [Q NullMatrix; NullMatrix   NullMatrix];
Qext =1;
%Rext = [NullMatrix NullMatrix; NullMatrix   R];
Rext=R;

res=-P'*psi + 2*(Qext+K'*Rext*K)'*getXbyT(t, kalmanObj.step,0,kalmanObj.XZ,kalmanObj.T);
%getXbyT(t, kalmanObj.step,kalmanObj.t0,kalmanObj.XZ,kalmanObj.T)
%2*(Qext+K'*Rext*K)
%eig(-P)

end

