#!/usr/bin/perl -w

use strict;
use warnings;
use Data::Dumper;
use Term::ReadKey;
use IOTAlib;

$| = 1;

my $keypair = IOTAlib::getkeypair('udosmcmdj9djfzhshxzsfwvynnx99pblvkdfmnsnsbahhwz9dzhs9zdf',0);

print Dumper($keypair);

my $address = IOTAlib::key2address($keypair->{'key'});

print Dumper($address);

my $sign = IOTAlib::sign('HALLO9IOTA9WORLD', $keypair->{'key'});

print Dumper($sign);

$address = IOTAlib::sign2address($sign->{'data'}, $sign->{'signature'});

print Dumper($address);

