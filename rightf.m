function res = rightf(~, y, obj)
% x' = A x 
f_pertrubation = zeros(size(obj.P,1), 1);
f_pertrubation(1:4, 1) = obj.ft(:,1);
%to do: f(t)
f1=-obj.Bc*obj.yref(:,1);
f_ref=zeros(size(obj.P,1), 1);
f_ref(size(y,1)/2+1:size(y,1),1)=f1(:,1);
res=obj.P*y+f_ref+f_pertrubation;
end

