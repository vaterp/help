#!/usr/bin/perl
use strict;

my ($line1);
my ($line2);

my ($tun_seq) =0;


while (<STDIN>)
{
	my ($bad_modcod) =0;
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


		$bad_modcod = 1 if (($agg_mcd | 0x3efbff) != 0x3efbff);

		print "$tun_seq\t$agg_len\t$agg_mcd\t $bad_modcod\n";
		$tun_seq = 0;
	}

	$bad_modcod =0;

}
