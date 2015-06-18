function x = getXbyT(t, step ,t0 ,X,T )
x = zeros(1,size(X,2));
indexOfT = fix((t-t0)/step)+1;
if( indexOfT>=size(T,1) ) 
     indexOfT=size(T,1)-2;
end;


%indexOfT
x1=X(indexOfT,:);
x2=X(indexOfT+1,:);
t1=T(indexOfT);

t2=T(indexOfT+1);
for i =1:size(X,2)
    x(1,i)=((x2(1,i)-x1(1,i))/(t2-t1))*t+x1(1,i)-t1*((x2(1,i)-x1(1,i))/(t2-t1));
end    

x=x';
end

