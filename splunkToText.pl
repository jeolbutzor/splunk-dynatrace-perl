use strict;
use warnings;

my @array;
open my $fh_in, '<', 'results.csv' 
	or die "could not open results.csv for reading: $!\n";
 
while(<$fh_in>) { 
    chomp; 
    push @array, $_;
} 
close $fh_in or die;

open(my $fh_out, '>', 'C:\PerlScripts\output.txt');
    print $fh_out $array[1];
close $fh_out or die;

print "done\n";
