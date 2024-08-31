function b= addition(pa,pb)  %(pa,pb)
%ADDITION:PSO
%%==test==
%  pa=[12 13 3 1 11 9 5 10 6 4 7 8 2];
%  pb=[10 1 5 8 9 7 11 4 13 6 3 2 12];
%--
%  pa=[12 13 3 1 11 9 5 10 6 4 7 8 2];
%  pb=[0 11 0 7 0 0 2 0 0 0 4];
%--
%  pa=[12 13 3 1 11 9 5 10 6 4 7 8 2;
%      10 1 5 8 9 7 11 4 13 6 3 2 12];
%  pb=[10 1 5 8 9 7 11 4 13 6 3 2 12];
%--
%  pa=[0 5 7 0 0 0 0 0 0 0 0 0 13];
%  pb=[0 11 0 7 0 0 2 0 0 0 4];    
%--
% pa=[3 0 1 9 0 7 6 0 4 0 0];
% pb=[5 0 0 0 7 0 8 1 0 0 0];

%map to pb 

%   if ~all(pa)      %all(paa)£º
%       zero_ix=find(pa==0);
%       pa(zero_ix)=zero_ix;
%       %    error('Part of element of paa are 0 .');
%   end 
%   if ~all(pb)      
%       zero_ix=find(pb==0);
%       pb(zero_ix)=zero_ix;
%       %    error('Part of element of pb are 0 .');
%   end 
 b=pb(pa);
 
end







