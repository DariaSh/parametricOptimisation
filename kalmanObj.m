classdef kalmanObj    
    properties
        A;
        B;
        C;
        D;      
        H;
        %весовые матрицы
        Q;        
        R; 
        QI;
        RI;
        tauPhi;
        tauPsi;
        %параметры
        P;
        Ac;
        Bc;
        Cc;
        sizeOfAcParams;
        sizeOfBcParams;
        sizeOfCcParams;
        %возмущения
        ft; 
        yref;
        X0;
        XZ0;
        %время
        Tend;
        step;
        T;
        Tinit;
        XZ;
        %динамика
        Klqr;
        U;
        K;
        uFunc;
    end
    
    methods
        function obj = kalmanObj(uFunc, A, B, C , D,...
            tauPhi,tauPsi, Q, QI, R, RI, ft, yref,X0, XZ0,step, Tend)
        
            %инициализация
            obj.uFunc=uFunc;
            
            obj.A=A;
            obj.B=B;
            obj.C=C;
            obj.D=D;
           
            obj.Q=Q;
            obj.R=R;
            obj.QI=QI;
            obj.RI=RI;
 
            
            obj.ft=ft; 
            obj.yref=yref;
            obj.X0=X0;
            obj.XZ0=XZ0;
            
            obj.Tend=Tend;
            obj.step=step;

            obj.tauPhi=tauPhi;
            obj.tauPsi=tauPsi;
            sys_ss = ss(obj.A,obj.B,obj.C,obj.D);
            [~,obj.H,~] = kalman(sys_ss, obj.tauPhi, obj.tauPsi, 0);
            obj.Klqr = -lqr(obj.A, obj.B,  obj.Q, obj.R, 0);
            
            obj.Ac = obj.A+obj.B*obj.Klqr-obj.H*obj.C;
            obj.Bc = obj.H;
            obj.Cc = obj.Klqr;  
            
            obj.K = [zeros(size(obj.Cc,1),size(obj.Cc,2)) obj.Cc];
            obj.P = [obj.A obj.B*obj.Cc; obj.Bc*obj.C   obj.Ac];
            
            obj.sizeOfAcParams=size(obj.Ac,1)*size(obj.Ac,2);
            obj.sizeOfBcParams=obj.sizeOfAcParams+size(obj.Bc,1)*size(obj.Bc,2);
            obj.sizeOfCcParams=obj.sizeOfBcParams+size(obj.Cc,1)*size(obj.Cc,2);
            
            [obj.T, obj.XZ]=ode45(@rightf, 0:obj.step:obj.Tend, obj.XZ0,[],obj);
          
        end
        
        function obj = recalculateSolution(obj, Ac, Bc, Cc )
            obj.Ac = Ac;
            obj.Bc = Bc;
            obj.Cc = Cc;            
            obj.P = [obj.A obj.B*obj.Cc; obj.Bc*obj.C   obj.Ac];
            [obj.T, obj.XZ]=ode45(@rightf, 0:obj.step:obj.Tend, obj.XZ0,[],obj);
        end
        
        function [T, X]= getSolBySpecF(obj, rightF)
            isa(rightF, 'function_handle');
            [T, X]=ode45(rightF, 0:obj.step:obj.Tend, obj.X0,[],obj);
        end
                    
        function U = getU( obj )
            isa(obj.uFunc, 'function_handle');
            U = obj.uFunc(obj);
        end

        function X = getX( obj )
            X = obj.XZ(:, 1: size(obj.A,1));
        end

        function Z = getZ( obj )
            Z = obj.XZ(:, size(obj.A,1)+1:size(obj.P,1));
        end

    end
    
    
end

