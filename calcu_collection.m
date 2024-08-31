function [id_FCs ,FC_mean ,AB_go_exact_num,FC_sum,fra_shareGO1,fra_shareGO2,...
    fra_shareGO3,fra_shareGO4,fra_shareGO5,fra_shareGO6]=...
    calcu_collection(A_go_level5,B_go_level5,claster_id_both5,AB_go_level5,level5_progo_num)
% clear all ;clc;

%load  (['AB-go-level5-' algo_spA_spB_name]);
N=length(A_go_level5);
FC=zeros(N,1);
AB_go_exact_num=0;
%--------------------------
 shareGO0=0;
shareGO1=0;
shareGO2=0;
shareGO3=0;
shareGO4=0;
shareGO5=0;
shareGO6=0;
%--------------------------
for i=1:N
    n=0;
    for j=1:length(A_go_level5{i})
        for k=1:length(B_go_level5{i})
            if  isequal(A_go_level5{i}(1,j), B_go_level5{i}(1,k))
                n=n+1;
                break
            end
        end
    end
    FC(i)=n/( length(A_go_level5{i})+length(B_go_level5{i})-n );
    %------------------
    switch n
        case 0
            shareGO0=shareGO0+1;
        case 1
            shareGO1=shareGO1+1;
        case 2
            shareGO1=shareGO1+1;
            shareGO2=shareGO2+1;
        case 3
            shareGO1=shareGO1+1;
            shareGO2=shareGO2+1;
            shareGO3=shareGO3+1;
        case 4
            shareGO1=shareGO1+1;
            shareGO2=shareGO2+1;
            shareGO3=shareGO3+1;
            shareGO4=shareGO4+1;
        case 5
            shareGO1=shareGO1+1;
            shareGO2=shareGO2+1;
            shareGO3=shareGO3+1;
            shareGO4=shareGO4+1;
            shareGO5=shareGO5+1;
        otherwise
            shareGO1=shareGO1+1;
            shareGO2=shareGO2+1;
            shareGO3=shareGO3+1;
            shareGO4=shareGO4+1;
            shareGO5=shareGO5+1;
            shareGO6=shareGO6+1;
    end
    %------------------
  %  fprintf('(%d/%d) generations are completed in calculate FCs\n',i,N)  ;
end
%----------------------
fra_shareGO1=shareGO1./N; %fraction of share GO terms num
fra_shareGO2=shareGO2./N;
fra_shareGO3=shareGO3./N;
fra_shareGO4=shareGO4./N;
fra_shareGO5=shareGO5./N;
fra_shareGO6=shareGO6./N;
%----------------------
id_FCs=[claster_id_both5 FC];
FC_mean=mean(FC);
FC_sum=sum(FC);

for i=1:N
       if isequal(A_go_level5{i},B_go_level5{i})
               AB_go_exact_num=AB_go_exact_num+1;
       end
end
%save ([dir '\' 'FCs-' algo_spA_spB_name] ,'id_FCs' ,'FC_mean' ,'AB_go_exact_num','FC_sum')
% fprintf('the number of  exact  are: %d\n',AB_go_exact_num) ;
% fprintf('the percentage of exact number  is: %d%%\n',100*(AB_go_exact_num/length(AB_go_level5)) );
fprintf('the mean value of FC score is: %d\n',FC_mean);