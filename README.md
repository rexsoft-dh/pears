# PeaRS

Commnad line  for PRS (Polygenic Risk Score)

# INSTALLATION

- From PIP

```
pip install pears
```

# USAGE

## Preprocessing of cel files

```
usage: pears preproc [-h] [-i [IN [IN ...]]] [-o OUT] [-c] [-u] [-d] [-p]

Preprocess genotype
----------------------------------------------------------------
[example]:
    pears preproc -i ./test/cel/01.cel ./test/cel/02.cel ./test/cel/03.cel -o ./test/preproc_test --cluster
    pears preproc -i ./test/cel/01.cel ./test/cel/02.cel ./test/cel/03.cel -o ./test/preproc_test --cluster --upqc --downqc --preimp

optional arguments:
  -h, --help            show this help message and exit
  -i [IN [IN ...]], --in [IN [IN ...]]
                        input cel files
  -o OUT, --out OUT     output prefix
  -c, --cluster         Create cluster
  -u, --upqc            UpQC
  -d, --downqc          DownQC
  -p, --preimp          prepare imputation
```

## Imputatation
* to imputate with [minimac4]()

```
usage: pears impute [-h] [-v VCF] [-r REF] [-p PREFIX] [-m MINIMAC4] [-c CPUS]

Impute genotype
----------------------------------------------------------------
[example]:
    pears impute -v ./test/NA06984_chr22.vcf -r ./test/22.1000g.Phase3.v5.With.Parameter.Estimates.m3vcf.gz -p ./test/NA06984_chr22 -c 2

optional arguments:
  -h, --help            show this help message and exit
  -v VCF, --vcf VCF     input vcf data
  -r REF, --ref REF     Reference haplotypes
  -p PREFIX, --prefix PREFIX
                        Output parameters
  -m MINIMAC4, --minimac4 MINIMAC4
                        Minimac4 path
  -c CPUS, --cpus CPUS  Number of threads
```

## PRS calculation

```
usage: pears calprs [-h] [-i IN] [-t INTYPE] [-o OUT] [-m METHOD] [-c [SSNAME [SSNAME ...]]] [-v SSVERSION]
                     [-s [SUMSTATS [SUMSTATS ...]]] [-a GCTA] [-p PLINK]

Calculate polygenic risk score
----------------------------------------------------------------
[example]:
    pears calprs -i ./test/KOR1.bed -t bed -o ./test/KOR1 -m mtag -c SNUH_BP SNUH_BS SNUH_HDL -v 1.0
    pears calprs -i ./test/K23andme.txt -t bed -o ./test/K23andme -m wmtsblup -s ./test/SS_BP.stats ./test/SS_BS.stats ./test/SS_BP.stats

optional arguments:
  -h, --help            show this help message and exit
  -i IN, --in IN        genotype filename
  -t INTYPE, --intype INTYPE
                        input genotype data type
  -o OUT, --out OUT     output prefix
  -m METHOD, --method METHOD
                        method
                        for univariate: "mtag","wmtsblup"
                        for multivariate: "pt","ct","ldpred","lassosum","prscs"
  -c [SSNAME [SSNAME ...]], --ssname [SSNAME [SSNAME ...]]
                        Summary stats field names
  -v SSVERSION, --ssversion SSVERSION
                        Summary stats version
  -s [SUMSTATS [SUMSTATS ...]], --sumstats [SUMSTATS [SUMSTATS ...]]
                        Summary stats files
  -a GCTA, --gcta GCTA  gcta path
  -p PLINK, --plink PLINK
                        plink path
```

### Input file format
* txt: genotype text file

	```
	# rsid	chromosome	position	genotype
	rs548049170	1	69869	TT
	rs9326622	1	567092	CC
	rs116587930	1	727841	GG
	rs3131972	1	752721	AG
	rs12184325	1	754105	CC
	rs12567639	1	756268	AA
	rs114525117	1	759036	GG
	rs12127425	1	794332	GG
	rs79373928	1	801536	TT
	```

* bed: plink bed, bim, fam file
* vcf: VCF file


### Output file format

```
FID IID traitA traitB traitC
KNIHGR000001 KNIHGR000001 -1.19456e-05 -4.17862e-05 2.11323e-05
KNIHGR000002 KNIHGR000002 1.41525e-05 -5.49473e-06 -2.51558e-05
KNIHGR000005 KNIHGR000005 -6.20412e-05 -5.29189e-05 0.000114996
```

## Annotation
```
usage: pears annot [-h] [-i IN] [-o OUT] [-r REF]

Annotate genotype
----------------------------------------------------------------
[example]:
    pears annot -i ./test/K23andme.txt -o ./test/K23andme

optional arguments:
  -h, --help         show this help message and exit
  -i IN, --in IN     genotype filename
  -o OUT, --out OUT  prefix of output file
  -r REF, --ref REF  reference version
```

