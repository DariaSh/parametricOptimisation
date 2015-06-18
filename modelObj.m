classdef modelObj  
    properties
        A;
        B;
        C;
        D;      
        %весовые матрицы
        QI;
        RI;
        tauPhi;
        tauPsi;
        %возмущения
        ft; 
        yref;
        X0;
        %время
        Tend;
        step;
        T;
        %динамика
        X;
        U;
        uFunc;
        rightF;
    end
    
    methods
        function obj = modelObj(uFunc, rightF, A, B, C , D,...
             QI, RI, ft, yref, X0, step, Tend)
        
            %инициализация
            isa(uFunc, 'function_handle');
            obj.uFunc=uFunc;

            isa(rightF, 'function_handle');
            obj.rightF=rightF;

            obj.A=A;
            obj.B=B;
            obj.C=C;
            obj.D=D;
           
            obj.QI=QI;
            obj.RI=RI;
    
            obj.ft=ft; 
            obj.yref=yref;
            obj.X0=X0;
            
            obj.Tend=Tend;
            obj.step=step;

            [obj.T, obj.X]=ode45(rightF, 0:obj.step:obj.Tend, obj.X0,[],obj);
          
        end
                           
        function U = getU( obj )
            U = obj.uFunc(obj);
        end

        function X = getX( obj )
            X = obj.X;
        end



    end
    
    
end



