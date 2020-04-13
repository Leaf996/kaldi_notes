#!/usr/bin/env perl

$in_list = $ARGV[0];

open IL, $in_list;			# open file

while ($l = <IL>)			# read line
{
	chomp($l);				# del \n
	$l =~ s/\.wav//;		# replace .wav
	$trans = $l;			# assign
	$trans =~ s/0/NO/g;		# replace 0 with NO
	$trans =~ s/1/YES/g;	# replace 1 with YES
	$trans =~ s/\_/ /g;		# replace _ with space
	print "$l $trans\n";	# print
}
