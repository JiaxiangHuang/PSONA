function mapAB=mappingback(ma,mb,A,B)          
%MAPPINGBACK Summary of this function goes here
%   ma,mb
% example:mappingback(ma_new,mb_new,'sc','ce','isorank-sc-ce');
%   mapAB-algo_spA_spB_name.mat
load 'names-5-ce-dm-mm-sc-hs.mat'
switch A
    case 'ce'
        namesA=names_ce1;
    case 'dm'
        namesA=names_dm1;
    case 'hs' 
        namesA=names_hs1;
    case 'mm'
        namesA=names_mm1;
    case 'sc'
        namesA=names_sc1;
end

switch B
    case 'ce'
        namesB=names_ce1;
    case 'dm'
        namesB=names_dm1;
    case 'hs' 
        namesB=names_hs1;
    case 'mm'
        namesB=names_mm1;
    case 'sc'
        namesB=names_sc1;
end


 i=1:1:length(ma);
mapA=namesA(ma(i));
mapB=namesB(mb(i));
mapAB=[mapA',mapB'];

%###
%save (['mapAB-' algo_spA_spB_name], 'mapAB')    


