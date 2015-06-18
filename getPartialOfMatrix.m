function dMdp=getPartialOfMatrix ( i,j, M)
dMdp=zeros(size(M,1),size(M,2));
dMdp(i,j)=1;
end

