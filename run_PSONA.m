function run_PSONA
%% Simple test
filename='result_PSONA';
%PSONA(filename,rowth,spa,spb,lam,END_SCAT,itr,pop,rate)
PSONA(filename,2,'mm','ce',0.1,100,4,4,0.6);
fprintf('mm-ce complete!\n');

%% PSONA on 10 data sets
% filename='result_PSONA';
% PSONA(filename,2,'mm','ce',0.1,100,300,100,0.6);
% fprintf('mm-ce complete!\n');
% PSONA(filename,3,'mm','sc',0.1,100,300,100,0.6);
% fprintf('mm-sc complete!\n');
% PSONA(filename,4,'mm','dm',0.1,100,300,100,0.6);
% fprintf('mm-dm complete!\n');
% PSONA(filename,5,'mm','hs',0.1,100,300,100,0.6);
% fprintf('mm-hs complete!\n');
% PSONA(filename,6,'ce','sc',0.1,100,300,100,0.6);
% fprintf('ce-sc complete!\n');
% PSONA(filename,7,'ce','dm',0.1,100,300,100,0.6);
% fprintf('ce-dm complete!\n');
% PSONA(filename,8,'ce','hs',0.1,100,300,100,0.6);
% fprintf('ce-hs complete!\n');
% PSONA(filename,9,'sc','dm',0.1,100,300,100,0.6);
% fprintf('sc-dm complete!\n');
% PSONA(filename,10,'sc','hs',0.1,100,300,100,0.6);
% fprintf('sc-hs complete!\n');
% PSONA(filename,11,'dm','hs',0.1,100,300,100,0.6);
% fprintf('dm-hs complete!\n');

end

