function [A_go_level5,B_go_level5,claster_id_both5,AB_go_level5,level5_progo_num]=...
    collect_level5(claster_id,goA,goB,progo_respair)
% clear all;
% clc;
load('go5_dict_num.mat')
%###
%load (['protein-go-all-' algo_spA_spB_name]);  
num=0;claster_id_both5=[];
N=length(goA);
for j=1:N%
    indexA=[];indexB=[];

    for i=1:length(goA{j})
         index1=find(firstc==goA{j}{i}, 1);
         if ~isempty(index1)
             indexA=[indexA index1];
         end
    end

    for i=1:length(goB{j})
         index2=find(firstc==goB{j}{i}, 1);
         if ~isempty(index2)
            indexB=[indexB index2];
         end
    end

    if ~isempty(indexA) && ~isempty(indexB)
        num=num+1;
        claster_id_both5(num)=claster_id(j);
        A_level5=[];B_level5=[];
        for i=1:length(indexA)
            tmp=cell2mat(go5_dict{indexA(i)}(1,2:end));
            A_level5=[A_level5 tmp];
        end
        A_level5=unique( A_level5);
         for i=1:length(indexB)
            tmp=cell2mat(go5_dict{indexB(i)}(1,2:end));
            B_level5=[B_level5 tmp];
         end
        B_level5=unique( B_level5);
        
         A_go_level5{num}=A_level5;
         B_go_level5{num}=B_level5;
    end
 
       % fprintf('(%d/%d) generations are completed in collect go terms of level 5\n',j,N)
end
claster_id_both5=claster_id_both5';
 A_go_level5= A_go_level5';
 B_go_level5=B_go_level5';
 AB_go_level5=[A_go_level5  B_go_level5];
 level5_progo_num=[num N num/N];
 %###
%save (['AB-go-level5-' algo_spA_spB_name],  'A_go_level5' ,'B_go_level5', 'claster_id_both5' ,'AB_go_level5' ,'level5_progo_num')


