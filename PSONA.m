function  PSONA(filename,rowth,spa,spb,lam,END_SCAT,itr,pop,rate)
% JIAXIANG HUANG
% Copyright, XIDIAN UNIVERSTY, 2015

% History
% 2015-09-07: Initial version

%  clear all;
%  profile on;
dir_root='D:\PSONA\';
load([dir_root,'ABH\','AB_',spa,'_',spb,'.mat']);
load([dir_root,'ABH\','H_',spa,'_',spb,'.mat']);
global  popsize dima dimb lambda iterMax w0 w_end END_SCATTER %A B H name
% global alpha adj_A adj_B edges_A edges_B NA NB  NEA  NEB  degree_A degree_B  H smH S edges_A1 edges_A2
% try_times=10;
% alpha=lam;
name='ec';
iterMax=itr;  
popsize=pop; 
lambda=lam; 
w0=0.9;  
w_end=0.4; 
END_SCATTER=END_SCAT;
randrate=rate;
% c1=2; 
% c2=2; 
% r1=rand();
% r2=rand();
% cr1=c1*r1;
% cr2=c2*r2;
dima=size(A,1); %only used in compute obj
dimb=size(B,1);
[Particle,V ] =initialization(H,randrate);
fprintf('initialization complete.\n');
%% ========INITIALIZATION===========
[init_f,init_f_ft,init_f_fs]=objective(Particle(:,1:dima),A,B,H,name);
[init_max_f,init_max_f_ix]=max(init_f);
init_max_f_ft=init_f_ft(init_max_f_ix);
init_max_f_fs=init_f_fs(init_max_f_ix);
fprintf('initial obj=%d, ft=%d, fs=%d.\n',init_max_f,init_max_f_ft,init_max_f_fs);
clear r;
%% ===========MAKEDIR===============
dir = makedir(name,spa,spb,dir_root,filename);
%% ======INITIALIZATION OUTPUT=========
best_f=init_max_f;
best_f_ft=init_max_f_ft;
best_f_fs=init_max_f_fs;
best_solution=Particle(init_max_f_ix,:);%%
%-----FC-----%
sa=species_name(dima);
sb=species_name(dimb);
[id_FCs ,FC_mean ,AB_go_exact_num,FC_sum,fra_shareGO1,fra_shareGO2,...
    fra_shareGO3,fra_shareGO4,fra_shareGO5,fra_shareGO6]=...
    calculate_FCs(1:dima,best_solution,sa,sb);
%-----EC-ICS-S3-----%
[LCCS_node,LCCS_edge]=lccs(A,B,Particle(init_max_f_ix,1:dima));
EC=best_f_ft;
SEQ=best_f_fs;
obj=best_f;
[~,ICS,~]= objective(best_solution(1:dima),A,B,H,'ics');
[~,S3,~]= objective(best_solution(1:dima),A,B,H,'sss');

%----save------%
%save mat
save(strcat(dir,'\','results.mat'),'Particle', 'best_solution', 'id_FCs',...
    'EC','ICS','S3','SEQ','obj','FC_mean','FC_sum','LCCS_edge','LCCS_node',...
    'fra_shareGO1','fra_shareGO2','fra_shareGO3','fra_shareGO4',...
    'fra_shareGO5','fra_shareGO6','AB_go_exact_num');
% dlmwrite(strcat(dir,'\','optima_per10.txt'),optima); %save('resres.txt','optima','-ASCII');
%save xls
filepath = [dir_root,filename,'\',filename,'.xls'];
% para=[num2str(iterMax),'-p',num2str(popsize)];
para=END_SCATTER;  
sp_name=[spa,'-',spb,'-',num2str(para),'-',num2str(iterMax),'-p',num2str(popsize)];
content = {sp_name,EC,ICS,S3,SEQ,obj,FC_mean,FC_sum,LCCS_edge,LCCS_node,fra_shareGO1,fra_shareGO2,...
    fra_shareGO3,fra_shareGO4,fra_shareGO5,fra_shareGO6,AB_go_exact_num};
sheet = 1;
write_init=rowth;
pos=write_init;    
xlRange = ['A' num2str(pos)];
xlswrite(filepath,content,sheet,xlRange);
%xls title
if rowth==2  
    title={'Name','EC','ICS','S3','SEQ','obj','FC_mean','FC_sum','LCCS_edge','LCCS_node',...
        'fra_shareGO1','fra_shareGO2','fra_shareGO3','fra_shareGO4',...
        'fra_shareGO5','fra_shareGO6','AB_go_exact_num'};
    xlswrite(filepath,title,sheet,['A' num2str(1)]);
end
%init-output-end
%% =========MAIN====================
optima=zeros(iterMax,3);
Pbest=Particle;    %%pbest
gbest=Particle(init_max_f_ix,:);
iter=1;
w=w0;
while iter<=iterMax
    cr1=2*rand();
    cr2=2*rand();
    %------update Velocity and Position-----%
    for r=1:popsize   %v1,v2,v3,pbest,particle have same number of lines£¬r:line dex
        v1=mutiplication(w,V(r,:));%v1=c1*vt
        v2=mutiplication(cr1,substraction(Pbest(r,:),Particle(r,:)));%v2=c2(pit-xt)
        v3=mutiplication(cr2,substraction(gbest,Particle(r,:)));
        V(r,:)=addition(addition(v1,v2),v3);  
        Particle(r,:)=addition(Particle(r,:),V(r,:));
        clear v1 v2 v3
        %fprintf('The %d row complete.\n',r);
    end
    %-----update Pbest-----%
    [f_pbest,ft_pbest,fs_pbest]=objective(Pbest(:,1:dima),A,B,H,name);
    [f_particle,ft_particle,fs_particle]=objective(Particle(:,1:dima),A,B,H,name);  %ft:column vector
    index=find(f_particle>f_pbest);  
    Pbest(index,:)=Particle(index,:);
    f_pbest(index)=f_particle(index);
    ft_pbest(index)=ft_particle(index);
    fs_pbest(index)=fs_particle(index);
    %     [f_gbest,ix]=max(f_particle);
    %     gbest=Particle(ix,:);
    [f_gbest,ix]=max(f_pbest);
    gbest=Pbest(ix,:);
    [gbest,dw]=local_search(A,B,H,gbest,name,iter);
    %------------w decay------------------%
    w=w-(w0-w_end)/iterMax; %w=0.4+(w0-w_end)/iterMax  %w=w-(0.9-0.4)/(iterMax-1);
    %     w=0.9;
    %--------output for each iteration-----------%
    [max_f,max_f_ix]=max(f_pbest);  
    max_f_ft=ft_pbest(max_f_ix);     
    max_f_fs=fs_pbest(max_f_ix);
    optima(iter,1)=max_f;
    optima(iter,2)=max_f_ft;
    optima(iter,3)=max_f_fs;
    fprintf('iteration %d complete,best obj=%d, ft=%d, fs=%d\n',iter,max_f,max_f_ft,max_f_fs);
    %     if rem(iter,20)==0 
    %         save(strcat(dir,'\','particle','-',num2str(iter)),'Particle');
    %     end
    iter=iter+1;
    %% ==========OUTPUT FOR EACH 10 ITERATIONS ===================
    if rem((iter-1),10)==0
        rowth=rowth+1;
        best_f=max_f;
        best_f_ft=max_f_ft;
        best_f_fs=max_f_fs;
        %best_solution=Particle(max_f_ix,:);%#
        best_solution=Pbest(max_f_ix,:);
        %-----FC-----%
        sa=species_name(dima);
        sb=species_name(dimb);
        [id_FCs ,FC_mean ,AB_go_exact_num,FC_sum,fra_shareGO1,fra_shareGO2,...
            fra_shareGO3,fra_shareGO4,fra_shareGO5,fra_shareGO6]=...
            calculate_FCs(1:dima,best_solution,sa,sb);
        %-----EC-ICS-S3-----%
        [LCCS_node,LCCS_edge]=lccs(A,B,Pbest(max_f_ix,1:dima));
        EC=best_f_ft;
        SEQ=best_f_fs;
        obj=best_f;
        [~,ICS,~]= objective(best_solution(1:dima),A,B,H,'ics');
        [~,S3,~]= objective(best_solution(1:dima),A,B,H,'sss'); 
        %-----SAVE-----%
        %save mat
        save([dir,'\','results-',num2str(iter-1),'.mat'],'Particle', 'best_solution', 'id_FCs',...
            'EC','ICS','S3','SEQ','obj','FC_mean','FC_sum','LCCS_edge','LCCS_node',...
            'fra_shareGO1','fra_shareGO2','fra_shareGO3','fra_shareGO4',...
            'fra_shareGO5','fra_shareGO6','AB_go_exact_num');
        dlmwrite(strcat(dir,'\','optima_per10.txt'),optima); %save('resres.txt','optima','-ASCII');
        %save xls
        filepath = [dir_root,filename,'\',filename,'.xls'];
        % para=[num2str(iterMax),'-p',num2str(popsize)];
        para=END_SCATTER; 
        sp_name=[spa,'-',spb,'-',num2str(para),'-',num2str(iterMax),'-p',num2str(popsize)];
        content = {sp_name,EC,ICS,S3,SEQ,obj,FC_mean,FC_sum,LCCS_edge,LCCS_node,fra_shareGO1,fra_shareGO2,...
            fra_shareGO3,fra_shareGO4,fra_shareGO5,fra_shareGO6,AB_go_exact_num};
        sheet = 1;
        write_init=rowth;%
        pos=write_init;   
        xlRange = ['A' num2str(pos)];
        xlswrite(filepath,content,sheet,xlRange);
        %xls title
        if rowth==2  
            title={'Name','EC','ICS','S3','SEQ','obj','FC_mean','FC_sum','LCCS_edge','LCCS_node',...
                'fra_shareGO1','fra_shareGO2','fra_shareGO3','fra_shareGO4',...
                'fra_shareGO5','fra_shareGO6','AB_go_exact_num'};
            xlswrite(filepath,title,sheet,['A' num2str(1)]);
        end
        %output-end
    end
end
% profile off;
% profile report;
end




