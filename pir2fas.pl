#!/usr/bin/perl
use lib "/scratch/bioperl/";

         use Bio::SeqIO;
         my $infile = shift @ARGV;
         my $infileformat = pir;
         my $outfile = shift @ARGV;
         my $outfileformat = fasta;
         my $seq_in = Bio::SeqIO->new('-file' => "<$infile",
                                      '-format' => $infileformat);
         my $seq_out = Bio::SeqIO->new('-file' => ">$outfile",
                                       '-format' => $outfileformat);
         while (my $inseq = $seq_in->next_seq) {
            $seq_out->write_seq($inseq);
         }
         exit;
