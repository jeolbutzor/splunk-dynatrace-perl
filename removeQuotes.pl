#!C:\\Perl64\\bin\\perl.exe

use strict;
use warnings;

open my $fh_in, '<', 'C:\resultsRandomTest.csv' 
	or die "could not open results.csv for reading: $!\n";