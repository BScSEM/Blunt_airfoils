function [Name] = Name_det(option,i)
% Only for input of background, untripped and tripped at the same time



% Background name array
Background_names = {'Ambient background noise, wind tunnel off','Background empty wind tunnel','Background, Airfoil attachment','Background, Airfoil attachment'};

% Background
if 0<i && i<5

    Name = Background_names(i);

% Untripped
elseif 4<i && i<29
flow = 'Untripped';

    if  4<i && i<11 % 0012
        Airfoil = 'NACA 0012 ';

    elseif 10<i && i<17 % 5512
        Airfoil = 'NACA 5512 ';

    elseif 16<i && i<23 % 63-418
        Airfoil = 'NACA 63-418 ';

    else    % 64-421
        Airfoil = 'NACA 64-421 ';
    end

    
% Tripped
else
flow = 'Tripped';

 if  4+24<i && i<11+24 % 0012
        Airfoil = 'NACA 0012 ';

    elseif 10+24<i && i<17+24 % 5512
        Airfoil = 'NACA 5512 ';

    elseif 16+24<i && i<23+24 %63-418
        Airfoil = 'NACA 63-418 ';

    else    % 64-421
        Airfoil = 'NACA 64-421 ';
    end


end


% TE type
iseven = rem(i,2);
if iseven == 1  % uneven, STE
    TE = 'STE ';

    % AOA
    isthirds = rem(i,3);
    if isthirds == 2    % a0
        AOA = '$\alpha = 0$ ';
    elseif isthirds == 1    
        AOA = '$\alpha = 10$ ';
    else
        AOA = '$\alpha = 15$ ';
    end


else % BTE
    TE = 'BTE ';

    % AOA
    isthirds = rem(i-1,3);
    if isthirds == 2    % a0
        AOA = '$\alpha = 0$ ';
    elseif isthirds == 1    
        AOA = '$\alpha = 10$ ';
    else
        AOA = '$\alpha = 15$ ';
    end


end






if i > 4

    Name = append(Airfoil,TE,AOA,flow);

end



