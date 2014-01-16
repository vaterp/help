#!/usr/bin/perl
use strict;

my ($line1);
my ($line2);

my ($tun_seq) =0;
my ($time_stamp) = 0;
my ($last_tun_seq) = 0xFFFF;
my ($in_a_frag) = 0;
my ($length) = 0;
my ($last_frag_seq) = 0xFFFF;

#my ($bad_modcod) = 0x3efbff; #Idirect valid
my ($bad_modcod) =  0x3efa00; #talia valid

while (<STDIN>)
{
	my ($agg_len) =0;
	my ($agg_mcd) =0;

	if (/^(.*) IP .* length (.*)/)
	{
		$time_stamp = $1;
		$length     = $2;
	}

	if (/ *0x0010: +.... .... .... .... .... .... (..).. ....$/)
	{

		$tun_seq = hex($1);

		if ($tun_seq > 127)  #We are a FRAG packet!
		{
			$tun_seq = $tun_seq & 0x7F; #Strip the FRAG bit

			if ($last_frag_seq == $tun_seq)
			{ #This is the second part of the frag!
				if ($length > 300) #We should be the big packet!
				{
					print "TIME: $time_stamp SEQ: $tun_seq LEN: $length - Big packet came second   ERROR!\n";
				}
				$in_a_frag=0; #Frag should be finished!
			}
			else
			{ #First part of the frag
				if ($length < 1000)
				{
					print "TIME: $time_stamp SEQ: $tun_seq LEN: $length - little packet came first   ERROR!\n";
				}
				$last_frag_seq = $tun_seq;
				$in_a_frag = 1;
				print "Time: $time_stamp SEQ: $tun_seq  LEN: $length FRAG Begin\n";
				next; #Take the next line....
				print "blah\n";
			}

			#	print "TIME: $time_stamp SEQ: $tun_seq LEN: $length - FRAG Seq ERROR!\n" if ($in_a_frag > 2);
		}

		if ($in_a_frag == 1)
		{
			print "FRAG MISSING!\n";
		}

		if ($last_tun_seq == 0xFFFF)  #Only first time...
		{
			$last_tun_seq = $tun_seq;
		}
		else
		{
			if ($last_tun_seq == 0x7F)
			{
				$last_tun_seq = 0;
			}
			else
			{
				$last_tun_seq++;
			}
			if ($last_tun_seq != $tun_seq)
			{
				print "TIME: $time_stamp SEQ: $tun_seq LEN: $length - SEQ ERROR!\n";
			}
		}
		print "Time: $time_stamp SEQ: $tun_seq  LEN: $length\n";
	}






	$last_tun_seq = $tun_seq;
# 	if (/ *0x0020:  (....) (....) (....) (....)/)
# 	{
# 		$agg_len = hex($1)<<16 | hex($2);
# 		$agg_mcd = hex($3)<<16 | hex($4);
# 		if (($agg_mcd | $bad_modcod) != $bad_modcod)
# 		{
# 			print "TIME: $time_stamp TS:$tun_seq\t LEN:$agg_len MCD: $3 $4 :::";
# 			print "Q1/4\t" if (($agg_mcd & 1) == 1);
# 			print "Q1/3\t" if (($agg_mcd & 2) == 2);
# 			print "Q2/5\t" if (($agg_mcd & 4) == 4);
# 			print "Q1/2\t" if (($agg_mcd & 8) == 8);
# 			print "Q3/5\t" if (($agg_mcd & 16) == 16);
# 			print "Q2/3\t" if (($agg_mcd & 32) == 32);
# 			print "Q3/4\t" if (($agg_mcd & 64) == 64);
# 			print "Q4/5\t" if (($agg_mcd & 128) == 128);
# 			print "Q5/6\t" if (($agg_mcd & 256) == 256);
# 			print "Q9/10\t" if (($agg_mcd & 1024) == 1024);
# 			print "8P9/10\t" if (($agg_mcd & 65536) == 65536);
# 			print "16P9/10\t" if (($agg_mcd & 4194304) == 4194304);
# 			print "32P3/4\t"  if (($agg_mcd & 8388608) == 8388608);
# 			print "32P4/5\t"  if (($agg_mcd & 16777216) == 16777216);
# 			print "32P5/6\t"  if (($agg_mcd & 33554432) == 33554432);
# 			print "32P8/9\t"  if (($agg_mcd & 67108864) == 67108864);
# 			print "32P9/10\t"  if (($agg_mcd & 134217728) == 134217728);
# 			print "\n";
# 		}
# 		else
# 		{
# 			print "TIME: $time_stamp TS:$tun_seq\t LEN:$agg_len MCD: $3 $4 OKAY\n";
# 		}
# 		$tun_seq = 0;
# 		$time_stamp =0;
# 	}
}
