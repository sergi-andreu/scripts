#!/usr/bin/perl

$file=shift @ARGV;chomp $file;
open (F,$file)||die "cant open  :$!";
$seq="";
while ($line = <F>){
        chomp ($line);
        if ($line =~ /^>/){
            $line =~ s/>//;
            push(@seqname,$line);
            if ($seq ne ""){
              push(@seq,$seq);
              $seq = "";
            }
        }
        else{
            $seq=$seq.$line;
        }
}
push(@seq,$seq);
close F;
@seq1=@seq;
@seq1n=@seqname;
undef @seq;undef @seqname;

$file=shift @ARGV;chomp $file;
open (F,$file)||die "cant open  :$!";
$seq="";
while ($line = <F>){
        chomp ($line);
        if ($line =~ /^>/){
            $line =~ s/>//;
            push(@seqname,$line);
            if ($seq ne ""){
              push(@seq,$seq);
              $seq = "";
            }
        }
        else{
            $seq=$seq.$line;
        }
}
push(@seq,$seq);
close F;

$sn1=shift @ARGV;chomp $sn1;

$sn2=shift @ARGV;chomp $sn2;
$sn3=shift @ARGV;chomp $sn3;
$sn4=shift @ARGV;chomp $sn4;

@seq2=@seq;
@seq2n=@seqname;
undef @seq;undef @seqname;

#$cont=affine($seq1,$seq2);
#print "\n\n>SEQ1.$seq1n[1]\n$seq1[1]\n>SEQ2.$seq2n[1]\n$seq2[1]\n\nSCORE-$cont\n\n";

for($c=0;$c<$#seq1;$c++){
	if($c==$sn1-1){
	for($cc=0;$cc<=$#seq2;$cc++){
#		if($c < $cc){
			#$cont=affine(@seq[$c],@seq[$cc]);
			if($cc==$sn2-1 ||  $cc==$sn3-1 ||  $cc==$sn4-1){
				$conseq.="@seq2[$cc]NNNNNNNNNNNNNNNN";
				$conseqname.="@seq2n[$cc]\t";
				$ccn.="$ccN";	
			}
	}
			open(F1,">file1.txt");
			open(F2,">file2.txt");
			print F1">@seq1n[$c]\n@seq1[$c]\n";
			print F2">$conseqname\n$conseq\n";
			print "$c and $ccn\t@seq1n[$c] and $conseqname\n";
#			system("bl2seq -i file1.txt -j file2.txt -p blastn -o $c.$cc.txt");
			system("stretcher file1.txt file2.txt -gapopen=10 -gapext=1 -outfile=$c.$ccn.txt");
			close F1;
			close F2;
			}
}

sub affine {
	$sequence1=shift;chomp $seqeunce1;$seqeunce1=~s/\s+//g;
	@sequencerow=split(//,$sequence1); 
	unshift(@sequencerow,0);
	$sequence2=shift;chomp $seqeunce2;$seqeunce2=~s/\s+//g;
	@sequencecol=split(//,$sequence2);
	unshift(@sequencecol,0);
	for ($row=0;$row<=$#sequencerow;$row++)        {
		      for ($column=0;$column<=$#sequencecol;$column++){
		                      if ($row==0 ){
	                                $fscore1[$row][$column]=0-$gapopen*$column;
				      	if ($column>1 ){
		                        	$fscore1[$row][$column]=0-($gapopen+$gapext*$column);
		                        	$point1[$row][$column]="h";
					}
		                      }
		                      if ($column==0 ){
	                                $fscore1[$row][$column]=0-$gapopen*$column;
				      	if ($row>1 ){
		                        	$fscore1[$row][$column]=0-($gapopen+$gapext*$row);
		                        	$point1[$row][$column]="v";
					}
		                      }
		                      elsif ($row>0 and $column >0){
					$score=$fscore1[$row-1][$column-1]+$R{"$sequencecol[$column]-$sequencerow[$row]"};
					$fscore1[$row][$column]=$score;
					$point1[$row][$column]="d";
					if($score<($fscore1[$row-2][$column-1]-($gapopen+$gapext))){
						$score=$fscore1[$row-2][$column-1]-($gapopen+$gapext);
						$fscore1[$row][$column]=$score;
						$point1[$row][$column]="g";
					}
					if($score<($fscore1[$row-1][$column-1]-($gapopen+$gapext))){
						$score=$fscore1[$row-1][$column-1]-($gapopen+$gapext);
						$fscore1[$row][$column]=$score;
						$point1[$row][$column]="f";
					}
					if($score<($fscore1[$row-2][$column]-($gapext))){
						$score=$fscore1[$row-2][$column]-($gapext);
						$fscore1[$row][$column]=$score;
						$point1[$row][$column]="e";
					}
				      }
		                      print "$fscore1[$row][$column]-[$sequencecol[$column]-$sequencecol[$row]]-$point1[$row][$column]\t";
			}
			print "\n";
	}

	return ($score);
}

