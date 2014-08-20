#!/usr/bin/perl
use strict;
use Getopt::Long;
use Term::ANSIColor;

# Config
our @toHighlight;
our $color = 'white on_red';

main();

sub main {
	parseArguments();

	while ( <STDIN> ) {
		my $line = $_;
		chomp($line);

		foreach my $current ( @toHighlight ) {
			if ( $line =~ m/($current)/ig ) {
				my $found = $1;
				my $colored = colored($found,$color);

				$line =~ s/$found/$colored/;
			}
		}

		print("$line\n");
	}
}

sub parseArguments {
	GetOptions
	(
		"mark=s@" => \@toHighlight,
		"color=s" => \$color,
		"help" => \&printHelp
	);
}

sub printHelp {
	print <<EOS;
Marker - Mark fragments in text
Copyright (C) 2014 Josef 'veloc1ty' Stautner (hello\@veloc1ty.de)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation.

The following arguments exist:
--mark : Define which fragments/strings should be highlighted
--color: Define a custom color

Custom colors:
The perl module Term::ANSIColor is used for coloring. Thus you have to use
their API.
Note: Not every color work in specific shells and emulators.

Valid foreground colors which should always work:

black  red  green  yellow  blue  magenta  cyan  white
bright_black  bright_red      bright_green  bright_yellow
bright_blue   bright_magenta  bright_cyan   bright_white

Valid background colors:

on_black  on_red      on_green  on yellow
on_blue   on_magenta  on_cyan   on_white
on_bright_black  on_bright_red      on_bright_green  on_bright_yellow
on_bright_blue   on_bright_magenta  on_bright_cyan   on_bright_white

See this link for more: https://metacpan.org/pod/Term::ANSIColor

Combining foreground with background example:

--color "red on_white"
--color "bright_white on_bright_black"

EOS

	exit;
}