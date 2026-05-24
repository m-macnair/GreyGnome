# ABSTRACT : Model for Things GreyGnome Does
package GreyGnome::Role::Model::Full;
our $VERSION = 'v0.0.3';

##~ DIGEST : a2af89ceac962a512055c14dfcca5b36
use strict;

use 5.006;
use warnings;

use Moo::Role;
with qw/
  GreyGnome::Role::Foreign
  /;

sub _get_file_id {
	my ( $self, $argv ) = @_;

	my $path    = $self->abs_path( $argv->{path} );
	my $file_id = $self->get_file_id( $path );
	return {ok => 1, file_id => $file_id, path => $path, args => $argv};
}

sub _set_file_id_ml {
	my ( $self, $argv ) = @_;

	my $row = $self->select_insert_href(
		'file_dimensions',
		{
			file_id => $argv->{file_id},
		}
	);

	$self->update( 'file_dimensions', {ml => $argv->{ml}}, {file_id => $argv->{file_id}} );

	return {ok => 1, row => $row, args => $argv};
}

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
