# PSONA — A global network alignment method using discrete particle swarm optimization

This repository contains the official MATLAB implementation of the paper: 

Huang J, Gong M, Ma L. A global network alignment method using discrete particle swarm optimization[J]. IEEE/ACM transactions on computational biology and bioinformatics, 2016, 15(3): 705-718.



## Reproducing Results

### Code

Run:

```
Rename the "PSONA-main" file to "PSONA".

Copy the "PSONA" file to root of D:\\.
If you want to change the name or path of file, please change the 10th row in PSONA.m. 

Open run_PSONA.m file and just run.
```

sparse_to_csr.m and scomponents.m are from David Gleich in https://www.cs.purdue.edu/homes/dgleich/codes/netalign/.

### Data

Data are in "ABH" file, e.g.:

```
AB_ce_dm.mat   (Two PPI networks: ce, dm)

H_ce_dm.mat    (BLAST scores between network ce and the other network dm)
```

The dataset can also be acquired from Isobase [1] in http://cb.csail.mit.edu/cb/mna/isobase/ (data version: 2014/4/14), or MAT3 [3] in http://compbio.soihub.org/projects/fastalign/

It contains five major eukaryotic PPInetworks: H. sapiens (Human), M. musculus (Mouse), D. melanogaster (Fly), C. elegans (Worm), and S. cerevisiae (Yeast), originally from BioGRID, DIP, and HPRD databases. 

The isolate nodes and the duplicate edges are removed by ourselves.

[1] D. Park, R. Singh, M. Baym, C.-S. Liao, B. Berger, Isobase: a database of functionally related proteins across ppi networks, Nucleic acids research 39 (suppl 1) (2010) D295–D300.

[2] G. Kollias, M. Sathe, S. Mohammadi, A. Grama, A fast approach to global alignment of protein-protein interaction networks, BMC research notes 6 (1) (2013) 35.

## Citation

```
@article{huang2016global,
  title={A global network alignment method using discrete particle swarm optimization},
  author={Huang, Jiaxiang and Gong, Maoguo and Ma, Lijia},
  journal={IEEE/ACM transactions on computational biology and bioinformatics},
  volume={15},
  number={3},
  pages={705--718},
  year={2016},
  publisher={IEEE}
}
```





