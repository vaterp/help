#!/usr/bin/perl

while (<STDIN>)
{

	if (/^.*: Demand\[(.*)\] .* Allocation\[(.*)\]/)
	{
		print $_ if ($1 != $2);
		#print $_ if ($1 > 10000);
	}


}
