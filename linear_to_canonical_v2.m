function q=linear_to_canonical_v2(p)

%   1   2 3 4 5  6 7 8 9 10 11 12 13
%  p=[12 13 3 1 11 9 5 10 6 4 7 8 2];
%  p=[13 9 11 2 7 5 3 1 10 8 6 4 12];
% p=[12 0 0 1 11 0 5 10 6 0 7 8 2]; %q=(5,11,7)
% p=zeros(1,13);
% p=randperm(2000);

%tic;
m=length(p);
n=1;
c=zeros(1,m);
q=cell(1,m);
for i =1:m 
	j=1; 
    k=p(i);
    c(j)=i;%store each cycle
    while k>i
        j=j+1;
        c(j)=k;
        k=p(k);
    end
    if k<i     
%         c(1:j)=0; %clear c to 0
        continue; 
    end
    % Now have k == i, i.e the least in its cycle   
   
    q{n}=c(1:j);  
    n=n+1;
%     c(1:j)=0; %clear c to 0
%    fprintf('%d cycle complete.\n',n);
end

q=q(1:n-1);
if ~exist('q','var') 
    error('No cycle produced.');    
end
clear c;

%canonical cycle

end


