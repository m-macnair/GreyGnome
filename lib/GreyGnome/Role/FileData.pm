# ABSTRACT : Role for file processing
package GreyGnome::Role::FileData;
our $VERSION = 'v0.0.3';

##~ DIGEST : e7ca0bf1e252ec98fb57822c7244bfbf
use strict;

use 5.006;
use warnings;

use Moo::Role;
with qw/

/;

sub ml_of_file {
	my ( $self, $file, $round ) = @_;
	my $output = `admesh "$file" 2>&1`;
	if ( $output =~ /.*Volume\s*:\s*([\d\.eE+-]+)/ ) {
		my $vol = $1;
		my $ml  = $vol / 1000;
		$ml = $round ? ceil( $ml ) : sprintf( "%.2f", $ml );
		return $ml;
	} else {
		die "Volume not found for file [$file]: $output $/";
	}
}

=head1 AUTHOR
	mmacnair, C<< <mmacnair at cpan.org> >>
=head1 BUGS
	TODO Bugs
=head1 SUPPORT
	TODO Support
=head1 ACKNOWLEDGEMENTS
	TODO
=head1 COPYRIGHT
 	Copyright 2026 mmacnair.
=head1 LICENSE
	TODO
=cut

1;
