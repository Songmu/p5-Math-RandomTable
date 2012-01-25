use strict;
use Test::More;

use Math::RandomTable qw/generate_random_table/;
use Data::Dumper;

my @arr = qw/4 8 5 6 0 7 1 2 9 3/;
my @arr1 = generate_random_table(10, 1);
my @arr2 = generate_random_table(10, 1);
my @arr3 = generate_random_table(10, 2);

is scalar @arr1, 10;
is_deeply(\@arr, \@arr1);
is_deeply(\@arr1, \@arr2);
isnt Dumper(\@arr), Dumper(\@arr3);

done_testing;
