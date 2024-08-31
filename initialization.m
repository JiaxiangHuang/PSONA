function [Particle,V ] =initialization(H,randrate)

%   Detailed explanation goes here
global dima dimb popsize

%MaxRand=500;
 MaxRand=floor(randrate*dima);
c=10;
%% 
Particle=zeros(popsize,dimb);
V=zeros(popsize,dimb);
%    Particle(1,:)=p;
for n=1:popsize
    %     rng(n);%make the stable rand permutations
    Particle(n,:)=randperm(dimb,dimb);
    k=1;
    while k<=MaxRand
        x=randi(dima,1,1);
        b=Particle(n,x);
        [~,s_y]=sort(H(x,:),'descend');
        y=s_y(1);  %y=maxb
        [~,s_x]=sort(H(:,y),'descend');
        %         if y~=b
        %             invs_a=find(Particle(n,:)==y);
        %             Particle(n,x)=y;
        %             Particle(n,invs_a)=b;
        %         end
        neib_x=s_y(1:c);  %b
        neib_y=s_x(1:c);  %a
        neib_y=neib_y';
%         length(unique(neib_x))
        %
        ixa_neib_x=zeros(1,c);
        for i=1:c
            aa=find(Particle(n,:)==neib_x(i));
            ixa_neib_x(i)=aa;
        end
        
        ix_sect=intersect(neib_y,ixa_neib_x);
        if ~isempty(ix_sect)
           if length(ix_sect)==c
            %空
           end
%             a=00000000
            ix_unique_y=setdiff(neib_y,ix_sect);
            ix_unique_x=setdiff(ixa_neib_x,ix_sect);
            unique_y=Particle(n,ix_unique_y);          
            unique_x=Particle(n,ix_unique_x);
            
            Particle(n,ix_unique_y)=unique_x;
            Particle(n,ix_unique_x)=unique_y;
%            if length(ix_sect)==c
%             %空
%            end
        else
            tmp = Particle(n,neib_y);
            Particle(n,neib_y)=neib_x;
            Particle(n,ixa_neib_x)=tmp;
        end
        k=k+1;
    end   
        swap_len=ceil(1/4*size(Particle,2)); %1/4种群长度
        V=zeros(popsize,dimb);
        Va=cell(swap_len,1);
        for r=1:popsize
            p=1:dimb;  %
            for k=1:swap_len
                % rng(k);
                ix_select=randperm(length(p),2);
                p_select=p(ix_select);
                Va{k}=p_select;
                p(ix_select)=[];
            end
            %
            v_line = canonical_to_linear(Va);
            if v_line<dimb
                v_line=[v_line,zeros(1,dimb-length(v_line))];
            end
            if ~all(v_line)      %
                zero_ix=find(v_line==0);
                v_line(zero_ix)=zero_ix;
            end
            V(r,:)=v_line;
        end
%     fprintf('The %dth particle complete.\n',n);
    
end
clear H0 Vc
end




