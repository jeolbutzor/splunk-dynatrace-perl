#!/usr/bin/perl
#
# sendsnmptrap.pl: A script to enable using Splunk alerts to send an SNMP trap.
#
# Modify the following code as necessary for your local environment.
#
	use strict;
	use warnings;
	use POSIX;
	use PerlIO::gzip;
	use constant DATETIME => strftime("%Y-%m-%d_%H-%M-%S", localtime);

#$hostPortSNMP = "qa-tm1:162"; # Host:Port of snmpd or other SNMP trap handler
#$snmpTrapCmd = "/usr/bin/snmptrap"; # Path to snmptrap, from http://www.net-snmp.org
#$TRAPOID = "1.3.6.1.4.1.27389.1.2"; # Object IDentifier for traps/notifications 
#$OID = "1.3.6.1.4.1.27389.1.1"; # Object IDentifier for objects, Splunk Enterprise OID is 27389
# Parameters passed in from the alert.
# $1-$9 is the positional parameter list. $ARGV[0] starts at $1 in Perl.

$filename = $ARGV[7]; 
gunzip $filename; # gunzip the results file
$filename =~ s/.gz$//; # remove ".gz" from $filename
open('RESULTS', '<', $filename) or die($!);
while (<RESULTS>){
    my $result = $_;
    # do something with $result;
}
close('RESULTS');

# Send trap, with the parameter list above mapping down into the OID.
#$cmd = qq/$snmpTrapCmd -v 2c -c public $hostPortSNMP '' $TRAPOID 
#$OID.1 i $searchCount $OID.2 s "$searchTerms" $OID.3 s "$searchQuery" $OID.4 s 
#"$searchName" $OID.5 s "$searchReason" $OID.6 s "$searchURL" $OID.7 s 
#"$searchTags" $OID.8 s "$searchPath"/;
# system($cmd);

	open(my $fh, '>', 'C:\splunkReports\report'.DATETIME.'.txt');
	print $fh "$result";
    close $fh;
 