%% Airfoil generator
clc; clear variables; close all;

iaf.designation='0018';
% designation='0008';
iaf.n=30;
iaf.HalfCosineSpacing=1;
iaf.wantFile=1;
iaf.datFilePath='./'; % Current folder
iaf.is_finiteTE=0;

af = naca4gen(iaf);

% plot(af.x,af.z,'bo-')

plot(af.xU,af.zU,'bo-')
hold on
plot(af.xL,af.zL,'ro-')

fileans = input('Do you want to export the airfoil coordinates to a .txt file? [yes/no]\n\n','s');
fileans = upper(fileans);
if strcmp(fileans,'YES')
    foilsize = input('What should the chordlength be in [mm]?\n\n');

    Foilchords = [zeros(size([af .xU; af .xL])), [af .xU; af .xL], [af .zU; af .zL]] * foilsize;
    Foilchords = Foilchords(1:end,:);

    filename = input('What should the filename be?\n\n','s');

    fid = fopen(filename, 'wt');
    
    [rows, columns] = size(Foilchords);
    for row = 1 : rows
    	for col = 1 : columns
    		fprintf(fid, '%f ', Foilchords(row, col));
    	end
    	fprintf(fid, '\n');
    end
    fclose(fid);
    winopen(filename); % Open in Notepad or Wordpad

end



axis equal