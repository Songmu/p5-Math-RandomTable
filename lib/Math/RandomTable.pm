package Math::RandomTable;
use strict;
use warnings;
our $VERSION = '0.01';

use Math::Random::MT;
use parent 'Exporter';
our @EXPORT_OK = qw/generate_random_table/;

sub generate {
    my $args = ref $_[0] ? shift : {@_};
    my $size    = $args->{size};
    my $seed    = $args->{seed}   || 1;
    my $max     = $args->{max}    || $size;
    my $unique  = $args->{unique} // 1;

    if ($unique) {
        my @arr = 0..$max;
        @arr = _shuffle(\@arr, $seed);
        splice @arr, 0, $size + 1;
    }
    else {
        sub { my ($size, $seed) = @_; my $mt = Math::Random::MT->new($seed); map { $mt->rand } ( 0 .. $size );}->($size, $seed);
    }

}

*Math::RandomTable::generate_random_table = *Math::RandomTable::generate;

# copied from List::Util::PP::shuffle and modified
sub _shuffle {
  my ($aa, $seed)= @_;
  my @a = \(@$aa);
  my $gen = Math::Random::MT->new($seed);
  my $n;
  my $i=@$aa;
  map {
    $n = $gen->rand($i--);
    (${$a[$n]}, $a[$n] = $a[$i])[0];
  } @$aa;
}

1;
__END__

=head1 NAME

Math::RandomTable -

=head1 SYNOPSIS

  use Math::RandomTable;

=head1 DESCRIPTION

Math::RandomTable is

=head1 AUTHOR

Masayuki Matsuki E<lt>y.songmu@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
