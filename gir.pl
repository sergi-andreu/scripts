use strict;
use lib '/home/animesh/export/biomart-perl/ensembl/modules';
use Bio::EnsEMBL::Registry;
my $file=shift @ARGV;
open(F,$file);
my $genome=shift @ARGV;
my $slicename=shift @ARGV;
my $registry = 'Bio::EnsEMBL::Registry';

$registry->load_registry_from_db(
    -host => 'ensembldb.ensembl.org',
    -user => 'anonymous'
);

my %chrname = (
"groupXIX"	=>	19	,
"groupXII"	=>	12	,
"groupX"	=>	10	,
"groupXXI"	=>	21	,
"groupXV"	=>	15	,
"groupII"	=>	2	,
"groupXVIII"	=>	18	,
"groupV"	=>	5	,
"groupXX"	=>	20	,
"groupXI"	=>	11	,
"groupIX"	=>	9	,
"groupXIII"	=>	13	,
"groupIII"	=>	3	,
"groupVIII"	=>	8	,
"groupXVI"	=>	16	,
"groupXIV"	=>	14	,
"groupVII"	=>	7	,
"groupXVII"	=>	17	,
"groupVI"	=>	6	,
"groupIV"	=>	4	,
"groupI"	=>	1	,
"MT"	=>	0	
);

my %chrnumber = (
19	=>	"groupXIX"	,
12	=>	"groupXII"	,
10	=>	"groupX"	,
21	=>	"groupXXI"	,
15	=>	"groupXV"	,
2	=>	"groupII"	,
18	=>	"groupXVIII"	,
5	=>	"groupV"	,
20	=>	"groupXX"	,
11	=>	"groupXI"	,
9	=>	"groupIX"	,
13	=>	"groupXIII"	,
3	=>	"groupIII"	,
8	=>	"groupVIII"	,
16	=>	"groupXVI"	,
14	=>	"groupXIV"	,
7	=>	"groupVII"	,
17	=>	"groupXVII"	,
6	=>	"groupVI"	,
4	=>	"groupIV"	,
1	=>	"groupI"	,
0	=>	"MT"	
);


my $line;
my $gn;
my $tgcnt;
my $ttcnt;
while($line=<F>){
	chomp $line;
	my @tmp=split(/\s+/,$line);
	my $fbs=@tmp[5]+0;
	my $rbs=@tmp[7]+0;
	my $bacname=@tmp[1];
	my $chr1=@tmp[14]+0;
	my $chr2=@tmp[16]+0;
	my $chr1s=@tmp[8]+0;
	my $chr2e=@tmp[13]+0;
	if($chr1==$chr2){
		if($slicename eq "scaffold"){$chr1="scaffold_".$chr1;}
		if($slicename eq "group"){$chr1=$chrnumber{$chr1};}
		if($genome eq "tetraodon"){            
			$chr1=~s/0/MT/;
            		$chr1=~s/-1/Un/;
            		$chr1=~s/\.5/_random/;
		
		}
		if($chr1==0){$chr1="MT"}
		$gn++;
		print "$gn\t$bacname\t$fbs - $rbs\t@tmp[8]-@tmp[13] ($chr1)\t";
		if($chr1s<$chr2e){
			($tgcnt,$ttcnt)=GA($chr1,$chr1s,$chr2e);
		}
		else {
			($tgcnt,$ttcnt)=GA($chr1,$chr2e,$chr1s);
		}
		print "\tG:$tgcnt\tT:$ttcnt\t:BacNo:@tmp[0]\n";
	}
}


sub GA{ my $chr=shift;
	my $chrs=shift;
	my $chre=shift;
	my @db_adaptors = @{ $registry->get_all_DBAdaptors() };
	my $slice_adaptor = $registry->get_adaptor( $genome, 'Core', 'Slice' );
	my $slice = $slice_adaptor->fetch_by_region( $slicename, $chr, $chrs,$chre );
	my $gene_adaptor = $registry->get_adaptor( $genome , 'Core', 'Gene' );
	my $transcript_adaptor = $registry->get_adaptor( $genome, 'Core', 'Transcript' );

	my @genes = @{ $slice->get_all_Genes() };
	my $genecount;
	my $tcnall;
	foreach my $gene (@genes) {
		$genecount++;
		my $gname=feature2string($gene);
		print "GENE ($genecount) : ",$gname,"\t";
		print_DBEntries( $gene->get_all_DBEntries() );
		my $transcripts = $gene->get_all_Transcripts();
		my $tcn;
		while ( my $transcript = shift @{$transcripts} ) {
			my $stable_id = $transcript->stable_id();
			$tcn++;
			print "TRANSCRIPT ($tcn) : $stable_id\t"; 
			my $transcript = $transcript_adaptor->fetch_by_stable_id($stable_id);
			my $translation = $transcript->translation();
			if($translation){
				my $pfeatures = $translation->get_all_ProteinFeatures();
				while ( my $pfeature = shift @{$pfeatures} ) {
				    my $logic_name = $pfeature->analysis()->logic_name();
				    #print $pfeature->idesc(),"\t",$logic_name,"\t";
				    printf(
					"%d-%d %s %s %s\t",
					$pfeature->start(), $pfeature->end(), $logic_name,
					$pfeature->interpro_ac(),	
					$pfeature->idesc()
				    );
				}
			}
		}
		$tcnall+=$tcn;
	}
	return($genecount,$tcnall);
}

sub print_DBEntries
	{
	    my $db_entries = shift;

	    foreach my $dbe ( @{$db_entries} ) {
		printf "\tXREF %s (%s)\t", $dbe->display_id(), $dbe->dbname();
	    }
}

sub feature2string
	{
	    my $feature = shift;
	    my $abss = $feature->seq_region_start(),
    	    my $abse = $feature->seq_region_end(),
    	    my $absr = $feature->seq_region_strand() ;
	    my $abscord = $feature->coord_system_name();
	    my $stable_id  = $feature->stable_id();
	    my $seq_region = $feature->slice->seq_region_name();
	    my $start      = $feature->start();
	    my $end        = $feature->end();
	    my $strand     = $feature->strand();

	    return sprintf( "%s %s %s : %d-%d (%+d) %d-%d (%+d)",
		$stable_id, $abscord, $seq_region,  $abss, $abse, $absr, $start, $end, $strand );
}
__END__
foreach my $db_adaptor (@db_adaptors) {
    my $db_connection = $db_adaptor->dbc();

    printf(
        "species/group\t%s/%s\ndatabase\t%s\nhost:port\t%s:%s\n\n",
        $db_adaptor->species(),   $db_adaptor->group(),
        $db_connection->dbname(), $db_connection->host(),
        $db_connection->port()
    );
}

