#!/usr/bin/perl

my ($line1);
my ($line2);

while (<STDIN>)
{
	next if (/^\+----/); #Skip the Delimiter Lines
	next if (/^$/);     #Skip the Blank Lines
	if (/ETHER/)
	{
		chomp;
		$line1 = $_;
		$line1 =~ s/ETHER//;
		next;
	}
	my ($line2) = substr $_,168,15;

	print "$line1  $line2\n";
}
