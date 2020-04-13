#!/usr/bin/env perl

$waves_dir = $ARGV[0];
$in_list = $ARGV[1];

open IL, $in_list;

while ($l = <IL>)
{
	chomp($l);
	$full_path = $waves_dir . "\/" . $l;	# str concatenate
	$l =~ s/\.wav//;						# del .wav
	print "$l $full_path\n";				# print (key path)
}
