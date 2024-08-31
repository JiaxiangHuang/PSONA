
function [id_FCs ,FC_mean ,AB_go_exact_num,FC_sum,fra_shareGO1,fra_shareGO2,...
    fra_shareGO3,fra_shareGO4,fra_shareGO5,fra_shareGO6]=calculate_FCs(ma,mb,A,B)
%function calculate_FCs(A,B,algo_spA_spB_name)
%example: calculate_FCs(ma,mb,'sc','ce','isorank-sc-ce');
%clear all;clc;
 %mappingback(ma,mb,A,B ,algo_spA_spB_name);
 mapAB=mappingback(ma,mb,A,B);
% collect_go_terms(A,B,algo_spA_spB_name);
[claster_id,goA,goB,progo_respair]=collect_go_terms(A,B,mapAB);
% collect_level5(algo_spA_spB_name);
[A_go_level5,B_go_level5,claster_id_both5,AB_go_level5,level5_progo_num]=...
    collect_level5(claster_id,goA,goB,progo_respair);
% [id_FCs,FC_mean,AB_go_exact_num,FC_sum]=calcu_collection(algo_spA_spB_name);
[id_FCs ,FC_mean ,AB_go_exact_num,FC_sum,fra_shareGO1,fra_shareGO2,...
    fra_shareGO3,fra_shareGO4,fra_shareGO5,fra_shareGO6]=...
    calcu_collection(A_go_level5,B_go_level5,claster_id_both5,AB_go_level5,level5_progo_num);

