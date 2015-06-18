function res= rightfNEW(~, x, obj)
y=obj.C*x;
y_ref = obj.yref;
y_w=y(1,1)-y_ref(1,1);
y_r=y(2,1)-y_ref(2,1);
y_q=y(3,1)-y_ref(3,1);
y_p=y(4,1)-y_ref(4,1);

Bw =[1;-1;1;-1];
Kw =  282.6;


Br =[1;1;1;1];
Kr = -7.6896;

Bq = [1;0;-1;0];
Kq = -8.7696;

Bp = [0;1;0;-1];
Kp = -8.7696;

U=Bw*Kw*y_w+Br*Kr*y_r+Bq*Kq*y_q+Bp*Kp*y_p;
res = obj.A*x+obj.B*U;
end

