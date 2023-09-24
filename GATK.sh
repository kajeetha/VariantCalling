ubuntu@kajeetha:~$ docker run -v ~/tmp:/tmp alexcoppe/gatk -T UnifiedGenotyper \
 -nct 8 -R /tmp/reference/hg19_short.fa -I /tmp/output/cell_line_sorted.bam \
 -o /tmp/output/cell_line_snps.vcf.

ubuntu@kajeetha:~/tmp/output$ wc -l cell_line_snps.vcf.

ubuntu@kajeetha:~/tmp/output$ grep -v '#' cell_line_snps.vcf. | wc -l

ubuntu@kajeetha:~/tmp/output$ ls cell_line_snps.vcf.|awk '{ print "less \
 -S "$1"|grep -v \"^#\"|grep -v INDEL|grep \"1/1\"|wc -l && echo "$1; }' \
|sh 

ubuntu@kajeetha:~/tmp/output$ ls cell_line_snps.vcf.|awk '{ print "less \
 -S "$1"|grep -v \"^#\"|grep -v INDEL|grep \"0/1\"|wc -l && echo "$1; }' \
|sh

