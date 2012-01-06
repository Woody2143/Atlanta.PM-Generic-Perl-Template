#!/usr/bin/perl 

use strict;
use warnings;
use GetOpt::Long;
use Pod::Usage;
use Carp qw/croak cluck confess carp/;
use File::Temp;

## For testing
use Data::Dumper;
$Data::Dumper::Useqq=1; ## Escape metachars (WARNING: Turns off XS))
$| = 1;                 ## Don't buffer

## Docs go here--really

my $default_file = '';
push @ARGV, $default_file unless @ARGV;

GetOptions(
    "length=i" => \(my $length = 24),
    "file=s"   => \(my $data = 'file.dat'),
    "verbose"  => \(my $verbose),
);

my $temp_fh = File::Temp->new({
    DIR    => '/tmp',
    UNLINK => 1,
    SUFFIX => '.foo',
});

__END__
