function [p,dw]=local_search(A,B,H,p,name,iter)
%local_search_scatter 
% A=[0 1 1 1;1 0 1 0;1 1 0 1;1 0 1 0];
% B=[0 1 0 1 1;1 0 1 1 0;0 1 0 1 0;1 1 1 0 0;1 0 0 0 0];
% pp=[1 2 3 4];
% H=magic(5);
% H(5,:)=[]
% lambda=0.3;

 global dima dimb iterMax  END_SCATTER
% lambda=0.3;     %/////
% dima=size(A,1); %/////
% dimb=size(B,1); %/////
%% weight
weight=compute_weight(A,B,H,p(1:dima),name);
%% scatter
%  END_SCATTER=10;
MAX_swap=1+floor(iter*( END_SCATTER-1)./iterMax);   
% fprintf('-----MAX_swap:%d\n',MAX_swap);
n=1;
dw=0;

while n<=MAX_swap
    ix_zero=find(weight==0);%s_ix:
    ra_pool=[ix_zero',dima+1:dimb];%
    [dw,p,weight]=scatter(A,B,H,ra_pool,p,weight);
    n=n+1;
end
%  fprintf('-----MAX_swap:%d,length of weight equal to zero:%d\n',MAX_swap,length(ix_zero));
    function [dw,p,weight]=scatter(A,B,H,ra_pool,p,weight)
        %
        rb_pool=p(ra_pool);
        st_pool=rb_pool(randperm(length(rb_pool)));
        p_tmp=p;
        p_tmp(ra_pool)=st_pool;
        weight_tmp=compute_weight(A,B,H,p_tmp(1:dima),name);
        dw=sum(weight_tmp)-sum(weight);
        if dw>0
            p=p_tmp;
            weight=weight_tmp;
        end
    end
end








