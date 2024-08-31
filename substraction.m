function padd =substraction(pb,pa)   %£¨pb,pa£©
%UNTITLED4 Summary of this function goes here

%test
% pa=randperm(2805,2805);
% pb=randperm(2805,2805);


[~,ix]=sort(pa); 
pai=ix;
%multiply
padd=addition(pai,pb);

end

