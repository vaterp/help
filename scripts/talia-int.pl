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
	my ($tun_seq) = substr $_,132,2;
	my ($agg_len) = substr $_,144,11;
	my ($agg_mcd) = substr $_,156,12;

	my ($line2) = substr $_,144;
	$line2 = chomp $line2;

	$agg_len_value = 0;
	$agg_mcd_value = 0;

	$agg_len_value = hex($1) << 24 | hex($2) << 16 | hex($3) << 8 | hex($4) if ($agg_len =~ /(..)\|(..)\|(..)\|(..)/);
	$agg_mcd_value = hex($1) << 24 | hex($2) << 16 | hex($3) << 8 | hex($4) if ($agg_mcd =~ /(..)\|(..)\|(..)\|(..)/);

	print "$line1\t$tun_seq\t$agg_mcd\t$agg_len_value\n";
	#print "$line1\t$tun_seq\t$agg_mcd_value\t$agg_len_value\n";
}
