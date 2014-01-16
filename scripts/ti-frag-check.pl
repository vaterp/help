#!/usr/bin/perl
use strict;

my ($tun_seq) =0;
my ($time_stamp) = 0;
my ($length) = 0;
my ($last_frag_seq) = 0xFFFF;


while (<STDIN>)
{

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
				if ($length > 100) #We should be the big packet! (I think 52 shoudl be the max size).
				{
					print "TIME: $time_stamp SEQ: $tun_seq LEN: $length - ***Big packet came second   ERROR!***\n";
				}
			}
			else  #First Frag packet!
			{ 
				if ($length < 1472)
				{
					print "TIME: $time_stamp SEQ: $tun_seq LEN: $length - Little packet came first!\n";
				}
				$last_frag_seq = $tun_seq;
				#print "Time: $time_stamp SEQ: $tun_seq  LEN: $length FRAG Begin\n";
			}
		}
	}
}
