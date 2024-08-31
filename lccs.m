function [max_node,max_edge]=lccs(A,B,p)
%LCCS largest common connected subgraph
%   p:  a matching
%   max_node: number of nodes in LCCS
%   max_edge: number of edges in LCCS

mb=p;
Bm = B(mb, mb) ;
C = Bm + A;
C(find(C==1))=0;
C(find(C==2))=1;

[sci,sizes] = scomponents(C);  %sizes:the number of nodes in each connected subgraph
                               %sci:the subgraph index each node belongs to 
[max_node,index]=max(sizes);
ni=find(sci==index); %node  index
max_edge=sum(sum(C(ni,:)))/2;

end

