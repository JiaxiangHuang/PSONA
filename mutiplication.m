function vo=mutiplication(c,vi )

global dimb
if c>0
    if c>1    
        c0=floor(c);
        c=c-c0;     
        vi_tmp=vi;
        for k=1:c0
            vi_tmp=addition(vi_tmp,vi);
        end
    end
    %#####2
    vc=linear_to_canonical_v2(vi);

    len=length(vc);
    r=randi(len,1,1);
    index=1:len;
    index_sft=circshift(index,[0,r]);
    vc=vc(index_sft);
    vc(ceil(c*length(vc))+1:length(vc))=[];
    vo=canonical_to_linear(vc);
   
    if vo<dimb
        vo=[vo,zeros(1,dimb-length(vo))];
    end

    if ~all(vo)      %all(paa)£º
        zero_ix=find(vo==0);
        vo(zero_ix)=zero_ix;
    end
elseif c==0  %#####3
    vo=1:dimb;
else
    error('c can not be a negative.')
end

end

