#!/usr/bin/perl

my ($line1);
my ($line2);

$x=0;
$time='';

while (<STDIN>)
{
	if (/Nov/)
	{
		chomp;
		$time = $_ . "\t$ARGV[0]\t";
		next;
	}

	if (/RMT:$ARGV[0]/)  #We are looking at RMT stats
	{
		$x=1;
	}
	else
	{
		if (/RMT/)
		{
			$x = 0;
			next;
		}
	}

	if ($x)
	{
		print $time . $_ if (/Num Ovf Err/);
	}

# 	16APSK-4/5 1540426    4245834    2000134842 1          0          0
# 	16APSK-5/6 4177       0          6623754    0          0          0


}
