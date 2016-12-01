use strict;
use warnings;
use LWP::Simple;

my $baseURL = "http://localhost:4000/genericmonitor?";
my $equals = "=";

my @array;

open my $fh_in, '<', 'C:\Program Files\Splunk\var\run\splunk\csv\results.csv' 
	or die "could not open results.csv for reading: $!\n";

while(<$fh_in>) { 
    chomp; 
    push @array, $_;
} 
close $fh_in or die;

my $dtPostURL = $baseURL.$array[0].$equals.$array[1];

open(my $fh_out, '>', 'C:\Splunk_output.txt');
    print $fh_out $dtPostURL;
close $fh_out or die;

print "done\n";