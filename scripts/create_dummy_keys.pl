#!/usr/bin/perl

my $count = 4608;


if( defined ($ARGV[0]))
{
	if( $ARGV[0] > 0 && $ARGV[0] < 10000 )
	{
		$count = $ARGV[0];
	}
}


for( my $at=0; $at<$count; ++$at )
{
	print "\n[FAKEGROUP_$at]\n";

	for ( my $key=0; $key < 5; ++$key)
	{
		print "\tfakey_key_$key = is_this_good_$key\n"
	}
}
