function [obj,ft,fs]= objective(pp,A,B,H,name)


% test
% function obj= objective()
% name='ec';
% A=[0 1 1 1;1 0 1 0;1 1 0 1;1 0 1 0];
% B=[0 1 0 1 1;1 0 1 1 0;0 1 0 1 0;1 1 1 0 0;1 0 0 0 0];
% pp=[1 2 3 4];
% H=magic(5);
% H(5,:)=[]
 % lambda=0.3;


 global lambda
% lambda=0.3;   
% tic;
ft=zeros(size(pp,1),1);  
for c=1:size(pp,1)
    p=pp(c,:);
    p=p';
    
    % t0=clock;
    
    % % ensure adjacency, symmetric
    % A(A > 0) = 1.0;
    % A = max(A, A');%symmetrization£¬another way£ºdelete main diagoal,then A=A+A'
    % B(B > 0) = 1.0;
    % B = max(B, B');
    
    % extract the matrix composed of mapping nodes
    % num_matches = length(p);
    % ma=(1:num_matches)';
    mb=p;
    % Am = A(ma, ma);   %this C is equal to original adjacent matrix A because A is a smaller one;
    Bm = B(mb, mb) ;  %a matrix composed of the mapping nodes extracted from origial adjacent matrix B;
    D = Bm + A;
    
    % % delete the main diagonal
    % d = spdiags(D, 0);   % extract the main diagonal
    % D = D - spdiags(d, 0, num_matches, num_matches);% delete
    % Am = Am - spdiags(spdiags(Am, 0), 0, num_matches, num_matches);
    % Bm = Bm - spdiags(spdiags(Bm, 0), 0, num_matches, num_matches);
    
    % compute the measure function
    cedge= length(find(D==2))/2;  % cedge:conserved edge. note:D is a symmetric matric
    aedge= length(find(A==1))/2;
    bedge= length(find(Bm==1))/2;
    switch lower(name)
        case 'ec'
            f=cedge/aedge;
        case 'ics'
            f=cedge/bedge;
        case 'sss'
            f=cedge/(aedge+bedge-cedge);
        otherwise
            error('Undefined evaluation function name');
    end
    ft(c)=f;
end

% toc;
% dt = etime(clock, t0);

%
if size(H,1)>size(H,2)   
    H=H';
end
fs=zeros(size(pp,1),1);  
for c=1:size(pp,1)
    p=pp(c,:);
    row=1:length(p);
    s1=sum(diag(H(row,p(row))));
    s2=sum(max(H,[],2));
    if s2==0
        error('Denominator of sequence objective equals 0.');
    end
    fs(c)=s1./s2;
end
% test_ft=ft
% test_fs=fs
obj=(lambda)*ft+(1-lambda)*fs;
clear c;

end


