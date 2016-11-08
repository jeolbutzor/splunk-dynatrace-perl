#!/usr/bin/perl

use strict;
use warnings;
use LWP::Simple;

my $url;

   $url = "http://localhost:4000/genericmonitor?Vendor Status:Experian=123,Anthem=234,Availity=332";

my $str = LWP::Simple::get($url);

#-----------------------
print "$str\n";
#-----------------------
