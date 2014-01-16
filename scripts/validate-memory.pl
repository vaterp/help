#!/usr/bin/perl

my ($line1);
my ($line2);

$start=0;

my ($ACM_LENGTH) = 25334;
my ($ACM_BLOCKS) = 8;
my ($TUN_LENGTH) = 1001;
my ($TUN_BLOCKS) = 5;


my ($mem_loc) = hex($ARGV[0]);

#Default to TUN config....

$total = $TUN_LENGTH * ($TUN_BLOCKS+3);
$acm_mode = 0;

if ($ARGV[1] eq "acm")
{
	$acm_mode = 1;
	$total = $ACM_LENGTH * ($ACM_BLOCKS+2);
}


#Testing...
#$total = 10;

my @data;

#Preprocess the file to then be easier to parse.....

$current = 0;
while (<STDIN>)
{
	if (/(.*): (........) (........) (........) (........)/)
	{
		#The Start Line....
		if ($start == 0)  
		{
			$addr = hex($1);

			if ($addr == $mem_loc)
			{
				$start = 1;

				if ($2 eq "01234567")
				{
					push (@data,$2);
					push (@data,$3);
					push (@data,$4);
					push (@data,$5);
					$total -= 4;
					next;
				}

				if ($3 eq "01234567")
				{
					push (@data,$3);
					push (@data,$4);
					push (@data,$5);
					$total -= 3;
					next;
				}
				if ($4 eq "01234567")
				{
					push (@data,$4);
					push (@data,$5);
					$total -=2;
					next;
				}

				push (@data,$5);
				$total -=1;
        next;
			}
		}
		else
		{
			#The main body.....
			if ($total >4)
			{
				push (@data,$2);
				push (@data,$3);
				push (@data,$4);
				push (@data,$5);
				$total -= 4;
				next;
			}

			#The last line.....
			if ($total == 4)
			{
				push (@data,$2);
				push (@data,$3);
				push (@data,$4);
				push (@data,$5);
				$total -=4;
				last;
			}
			if ($total == 3)
			{
				push (@data,$2);
				push (@data,$3);
				push (@data,$4);
				$total -= 3;
				last;
			}
			if ($total == 2)
			{
				push (@data,$2);
				push (@data,$3);
				$total -=2;
				last;
			}
			push (@data,$2);
			$total -= 1;
			last;
		}
	}
}

#Now Process......
die "Bad input, not enough characters\n" if $total != 0;

$num_elements = @data;
print "There are $num_elements entries in array\n";

$counter = 0;

if ($acm_mode == 1)
{
	while ($counter < $num_elements)
	{
    if (@data[$counter] ne "01234567")
		{
			die "Failure on START @ offset $counter\n";
		}
		$counter += $ACM_BLOCKS+1;
		if (@data[$counter] ne "89ABCDEF")
		{
			die "Failure on END @ offset $counter\n";
		}
		$counter++;
	}
}
else  #Do tunnel mode processing.....
{
	while ($counter < $num_elements)
	{
    if (@data[$counter] ne "01234567")
		{
			die "Failure on START @ offset $counter\n";
		}
		$counter += $TUN_BLOCKS+1;
		if (@data[$counter] ne "89ABCDEF")
		{
			die "Failure on END @ offset $counter\n";
		}
		$counter+=2; #There is an extra byte for some reason... so lets skip it.
	}
}

