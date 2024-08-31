function p = canonical_to_linear(q)
% q=[3,11,6];
if ~iscell(q) %type:vector.used in <plinear=canonical_to_linear(pdr);> 
    q={q};%vector is stored in a cell
end
p=[];
for s=1:length(q)
    qq=q{s}; %qq:each cycle in q
    n=1;
    while n<length(qq)
        p(qq(n))=qq(n+1);
        n=n+1;
    end
    p(qq(length(qq)))=qq(1);
end
% p=p';
end
