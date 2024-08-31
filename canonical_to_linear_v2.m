function p = canonical_to_linear_v2(q,dimb)
% q=[3,11,6];
if ~iscell(q) %type:vector.used in <plinear=canonical_to_linear(pdr);>
    q={q};%vector is stored in a cell
end
p=zeros(1,dimb);
for s=1:length(q)
    qq=q{s}; %qq:each cycle in q
    n=1;
    while n<length(qq)
        p(qq(n))=qq(n+1);
        n=n+1;
    end


    if  p(qq(length(qq)))~=0   %  
        p(qq(1))=0;     
        ix=find(p==qq(2));
        p(ix)=qq(1);
        p(qq(1))=qq(2);
        %             ix_single=setdiff(ix,qq(1));
        %             p(ix_single)=qq(1);
    else
        p(qq(length(qq)))=qq(1);
    end
end
% p=p';
end





