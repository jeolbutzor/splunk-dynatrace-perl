#!C:\\Perl64\\bin\\perl.exe

use strict;
use warnings;
use POSIX;
use constant DATETIME => strftime("%Y-%m-%d_%H-%M-%S", localtime);
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

my $str = LWP::Simple::get($dtPostURL);

#----------------------

open(my $fh_log, '>', 'C:\Perl Logs\results'.DATETIME.'.log');
print $fh_log $dtPostURL;
close $fh_log;

print "done\n";

#----------------------