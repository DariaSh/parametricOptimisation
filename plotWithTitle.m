function  plotWithTitle( T, X, numOfFigure, ... 
filename, xTitle, yTitle, mode)

h = figure(numOfFigure);
plot(T, X);
%title(myTitle);
grid on;

 switch mode
              case 1
                 legend('w', 'r', 'q', 'p', '\omega_1', '\omega_2',....
                     '\omega_3','\omega_4');
              case 2
                 legend('w','r', 'q', 'p');
              case 3
                 legend('U_1', 'U_2', 'U_3','U_4');
              case 4
                 legend('w [м/с]', 'r [рад/с]', 'q [рад/с]', 'p [рад/с]',...
                     '\omega_1 [рад/с]', '\omega_2 [рад/с]', ...
                     '\omega_3 [рад/с]','\omega_4 [рад/с]',...
                     'z_1', 'z_2', 'z_3', 'z_4', 'z_5',...
                     'z_6', 'z_7', 'z_8');
              case 5 
                 
  end

xlabel(xTitle);
ylabel(yTitle);

% составляем имя файла
file_name = strcat('V:\sci\Pendulum\docs\Диплом\images\', filename);  
    
% сохранение графика в файл c нужным расширением (смотри help)
saveas(h, file_name, 'jpg'); 

file_name2 = strcat('V:\sci\Pendulum\docs\презентация\images\', filename);  
    
% сохранение графика в файл c нужным расширением (смотри help)
saveas(h, file_name2, 'jpg'); 
    
%close(h) %закрываем построенный график, чтоб не засорять память

end

