# VariantCalling
perform germline variant (SNP) calling on the cell_line_sorted.bam file 
generated with BWA. The Broad Institute’s Genome Analysis
Toolkit (GATK) will be used to call the SNPs, generating a .vcf file. 
JBrowse will be used to view the SNPs and underlying evidence

1.	ubuntu@kajeetha:~$ docker run -v ~/tmp:/tmp alexcoppe/gatk -T UnifiedGenotyper \
 -nct 8 -R /tmp/reference/hg19_short.fa -I /tmp/output/cell_line_sorted.bam \
 -o /tmp/output/cell_line_snps.vcf.

2.	ubuntu@kajeetha:~/tmp/output$ wc -l cell_line_snps.vcf.
Answer: 24498 lines

3.	ubuntu@kajeetha:~/tmp/output$ grep -v '#' cell_line_snps.vcf. | wc -l
Answer: 24463 SNPs

4.	ubuntu@kajeetha:~/tmp/output$ ls cell_line_snps.vcf.|awk '{ print "less \
 -S "$1"|grep -v \"^#\"|grep -v INDEL|grep \"1/1\"|wc -l && echo "$1; }' \
|sh 
Answer: 10622 homozygous SNPs

5.	ubuntu@kajeetha:~/tmp/output$ ls cell_line_snps.vcf.|awk '{ print "less \
 -S "$1"|grep -v \"^#\"|grep -v INDEL|grep \"0/1\"|wc -l && echo "$1; }' \
|sh
![image](https://github.com/kajeetha/VariantCalling/assets/110184512/fda87060-d7f4-46a5-b75b-282ea4f737a4)
