function dir = makedir(name,spa,spb,dir_root,filename)

%   Detailed explanation goes here

global iterMax popsize lambda END_SCATTER % w0 w_end dima dimb 
% nameA=species_name(dima);
% nameB=species_name(dimb);
nameA=spa;
nameB=spb;

% dir=strcat(dir_root,upper(name),'-',nameA,'-',nameB,'-',...
%     num2str(iterMax),'-p',num2str(popsize),'-',num2str(lambda),'-w',num2str(w0),num2str(w_end));
dir=strcat(dir_root,filename,'\',upper(name),'-',nameA,'-',nameB,'-',...
    num2str(iterMax),'-p',num2str(popsize),'-',num2str(lambda),'-',num2str(END_SCATTER));

mkdir(dir);

end

