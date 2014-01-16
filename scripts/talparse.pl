#!/usr/bin/perl

my ($line1);
my ($line2);

$x=0;

while (<STDIN>)
{
	if (/Nov/)
	{
		print;
		next;
	}

	if (/RMT:3827/)  #We are looking at RMT stats
	{
		$x=1;
	}
	else
	{
		if (/RMT/)
		{
			$x = 0;
		}
	}

	print if ($x);

}
