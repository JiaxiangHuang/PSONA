function p = trans_res(ma,mb)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[s_ma,ix]=sort(ma);
p=mb(ix);
p=p';
p_diff=setdiff(1:2805,p);
p=[p,p_diff];

end

