# PSONA — A global network alignment method using discrete particle swarm optimization

This repository contains the official MATLAB implementation of the paper: 

Huang J, Gong M, Ma L. A global network alignment method using discrete particle swarm optimization[J]. IEEE/ACM transactions on computational biology and bioinformatics, 2016, 15(3): 705-718.



## Reproducing Results

### Run

```
Copy the <PSONA> folder to the root of "D:\",
or change the path dir_root = 'D:\PSONA\' (on the 10th line of the PSONA.m file) to the current <PSONA> folder path.

Open the run_PSONA.m file and run it.
```

sparse_to_csr.m and scomponents.m are from David Gleich in https://www.cs.purdue.edu/homes/dgleich/codes/netalign/.

### Data

Data are in "ABH" file, e.g.:

```
AB_ce_dm.mat (Two PPI networks: ce, dm)

H_ce_dm.mat  (BLAST scores between network ce and the other network dm)
```

The dataset can also be acquired from Isobase [1] in http://cb.csail.mit.edu/cb/mna/isobase/ (data version: 2014/4/14), or MAT3 [2] in http://compbio.soihub.org/projects/fastalign/.

*[1] D. Park, R. Singh, M. Baym, C.-S. Liao, B. Berger, Isobase: a database of functionally related proteins across ppi networks, Nucleic acids research 39 (suppl 1) (2010) D295–D300.*

*[2] G. Kollias, M. Sathe, S. Mohammadi, A. Grama, A fast approach to global alignment of protein-protein interaction networks, BMC research notes 6 (1) (2013) 35.*

It contains five major eukaryotic PPI networks: H. sapiens (Human), M. musculus (Mouse), D. melanogaster (Fly), C. elegans (Worm), and S. cerevisiae (Yeast), originally from BioGRID, DIP, and HPRD databases. 

The isolate nodes and the duplicate edges are removed by ourselves.



## Citation

If you find the code helpful, please cite it as follows:

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





