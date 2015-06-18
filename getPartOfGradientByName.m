function gradIMatrix = getPartOfGradientByName( gradI, obj, nameOfMatrix )

if strcmp(nameOfMatrix,'Ac')==1
            gradIMatrix= zeros(size(obj.Ac,1),size(obj.Ac,2));
            k=1;
            for i=1:size(obj.Ac,1)
                for j=1:size(obj.Ac,2)
                gradIMatrix(i,j)=gradI(1,k);
                k=k+1;
                end
            end
else   
    
    if strcmp(nameOfMatrix,'Bc')==1
            gradIMatrix= zeros(size(obj.Bc,1),size(obj.Bc,2));
            k=obj.sizeOfAcParams+1;
            for i=1:size(obj.Bc,1)
                for j=1:size(obj.Bc,2)
                gradIMatrix(i,j)=gradI(1,k);
                k=k+1;
                end
            end
    else  
        
        if strcmp(nameOfMatrix,'Cc')==1
            gradIMatrix= zeros(size(obj.Cc,1),size(obj.Cc,2));
            k=obj.sizeOfBcParams+1;
            for i=1:size(obj.Cc,1)
                for j=1:size(obj.Cc,2)
                gradIMatrix(i,j)=gradI(1,k);
                k=k+1;
                end
            end
        else
           disp('Input name is incorrect') ;
           gradIMatrix=0;
        end

end
end
end

