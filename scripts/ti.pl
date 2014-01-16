#!/usr/bin/perl
use strict;

my ($line1);
my ($line2);

my ($tun_seq) =0;

#my ($bad_modcod) = 0x3efbff; #Idirect valid
my ($bad_modcod) =  0x3efa00; #talia valid

while (<STDIN>)
{
	my ($agg_len) =0;
	my ($agg_mcd) =0;
	if (/ *0x0010:  .... .... .... .... .... .... (..).. ....$/)
	{
		$tun_seq = $1;
	}
	if (/ *0x0020:  (....) (....) (....) (....)/)
	{
		$agg_len = hex($1)<<16 | hex($2);
		$agg_mcd = hex($3)<<16 | hex($4);



		if (($agg_mcd | $bad_modcod) != $bad_modcod)
		{
			print "TS:$tun_seq\t LEN:$agg_len MCD: $3 $4 :::";
			print "Q1/4\t" if (($agg_mcd & 1) == 1);
			print "Q1/3\t" if (($agg_mcd & 2) == 2);
			print "Q2/5\t" if (($agg_mcd & 4) == 4);
			print "Q1/2\t" if (($agg_mcd & 8) == 8);
			print "Q3/5\t" if (($agg_mcd & 16) == 16);
			print "Q2/3\t" if (($agg_mcd & 32) == 32);
			print "Q3/4\t" if (($agg_mcd & 64) == 64);
			print "Q4/5\t" if (($agg_mcd & 128) == 128);
			print "Q5/6\t" if (($agg_mcd & 256) == 256);
			print "Q9/10\t" if (($agg_mcd & 1024) == 1024);
			print "8P9/10\t" if (($agg_mcd & 65536) == 65536);
			print "16P9/10\t" if (($agg_mcd & 4194304) == 4194304);
			print "32P3/4\t"  if (($agg_mcd & 8388608) == 8388608);
			print "32P4/5\t"  if (($agg_mcd & 16777216) == 16777216);
			print "32P5/6\t"  if (($agg_mcd & 33554432) == 33554432);
			print "32P8/9\t"  if (($agg_mcd & 67108864) == 67108864);
			print "32P9/10\t"  if (($agg_mcd & 134217728) == 134217728);

			print "\n";
		}
		$tun_seq = 0;
	}


}
