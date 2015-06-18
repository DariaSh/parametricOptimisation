function U = getUproportional(obj)
    Xsol = obj.getZ;
    U = zeros(size(Xsol, 1),...
    size(obj.Klqr*Xsol(1,:)',1));
    NumberOfPoints = size(Xsol,1);
    for i=1:NumberOfPoints,
         U(i,:) = obj.Klqr*Xsol(i,:)';
    end;

end

