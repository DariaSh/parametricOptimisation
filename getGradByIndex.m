function gradI = getGradByIndex(numOfP, i, j, kalmanObj )

psi0 =zeros(1,size(kalmanObj.P,1)) ;
[T,PSI]=ode45(@rightPsi, [kalmanObj.Tend,0], psi0,[],kalmanObj);


step=kalmanObj.step;
t0=0 ;
tend=kalmanObj.Tend ;
X=kalmanObj.XZ;
T=kalmanObj.T;

F = zeros(size(T,1),1);
 k=1;
        for t=t0:step:tend
            psi=getXbyT(t, step ,t0,PSI,T );
            x=getXbyT(t, step , t0, X, T);
            F(k)=-(psi'*getdPdp(numOfP,i, j, kalmanObj )*x)...
            +(2*x'*((getdKdp(numOfP, i, j, kalmanObj ))'...
            *kalmanObj.R*kalmanObj.K)*x);
            k=k+1;
        end
        gradI = trapz(T,F);
end

