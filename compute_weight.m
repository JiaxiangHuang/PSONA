function weight=compute_weight(A,B,H,p,name)


% A=[0 1 1 1;1 0 1 0;1 1 0 1;1 0 1 0];
% B=[0 1 0 1 1;1 0 1 1 0;0 1 0 1 0;1 1 1 0 0;1 0 0 0 0];
% pp=[1 2 3 4];
% H=magic(5);
% H(5,:)=[]
% lambda=0.3;

 global lambda 
%  lambda=0.1;    

%% weight
%-----wt-----%
mb=p;
Bm = B(mb, mb) ;  %a matrix composed of the mapping nodes extracted from origial adjacent matrix B;
D = Bm + A;
%------------
% tic; %方式1
% D(find(D==1))=0;
% D(find(D==2))=1;
% sd=sum(D,2)/2;   
% toc;
%-----------
% tic;%方式2
% D_tmp=zeros(size(D));
% D_tmp(find(D==2))=1;
% sd=sum(D_tmp,2)/2; 
% clear D_tmp;
% toc;
%---------------
% tic;%
D=double(D>1.5);
sd=sum(D,2)/2;  
% toc;
%--------------
aedge= length(find(A==1))/2;
switch lower(name)
    case 'ec'

        wt=sd/aedge;
    case 'ics'
        bedge= length(find(Bm==1))/2;
        wt=sd/bedge;
    case 'sss'
        cedge= length(find(D==2))/2;  % cedge:conserved edge. note:D is a symmetric matric
        bedge= length(find(Bm==1))/2;
        wt=sd/(aedge+bedge-cedge);
    otherwise
        error('Undefined evaluation function name');
end
%-----wn-----%
if size(H,1)>size(H,2)   
    H=H';
end
row=1:length(mb);
s1=diag(H(row,mb(row)));%H(row,pp(row))
s2=sum(max(H,[],2));
if s2==0
    error('Denominator of sequence objective equals 0.');
end
wn=s1./s2;
weight=(lambda)*wt+(1-lambda)*wn;
% ft=sum(wt);
% fs=sum(wn);
% obj=(lambda)*ft+(1-lambda)*fs;
end
