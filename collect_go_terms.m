function [claster_id,goA,goB,progo_respair]=collect_go_terms(A,B,mapAB)
       % clear all;clc;
       % load 'pid_go_each_sp_dict.mat';%
        load 'protein-dict-sort.mat'
        %###
       % load (['mapAB-' algo_spA_spB_name]);
        
        switch A
            case 'ce'
                pid_go_A=ce;
                A_index=firstc_ce;
            case 'dm'
                pid_go_A=dm;
                 A_index=firstc_dm;
            case 'hs' 
                pid_go_A=hs;
                 A_index=firstc_hs;
            case 'mm'
                pid_go_A=mm;
                 A_index=firstc_mm;
            case 'sc'
                pid_go_A=sc;
                 A_index=firstc_sc;
        end

        switch B
            case 'ce'
                pid_go_B=ce;
                 B_index=firstc_ce;
            case 'dm'
                pid_go_B=dm;
                B_index=firstc_dm;
            case 'hs' 
                pid_go_B=hs;
                B_index=firstc_hs;
            case 'mm'
                pid_go_B=mm;
                B_index=firstc_mm;
            case 'sc'
                pid_go_B=sc;
                B_index=firstc_sc;
        end
        
       N= length(mapAB);
       num=0;
for i=1:N
         indexA=find(A_index==mapAB(i,1), 1);
         indexB=find(B_index==mapAB(i,2), 1);
         if ~isempty(indexA) && ~isempty(indexB)
             num=num+1;
             claster_id(num)=i;
             goA{num,1}=pid_go_A{indexA}(1,2: end); 
             goB{num,1}=pid_go_B{indexB}(1,2: end);
         end      
        %  fprintf('(%d/%d) generations are completed in collect protein go terms \n',i,N)       
end                  
      progo_respair=[num N num/N];
      %###
     % save (['protein-go-all-' algo_spA_spB_name] ,  'claster_id', 'goA', 'goB',  'progo_respair')
    