#!/usr/bin/perl

my $ip = "1.2.3";

for( my $i=1; $i<254; ++$i )
{
	print "ip route $ip.$i 255.255.255.255 null0\n"
}
