# ABSTRACT : Role to combine all foreign roles used by the project
package GreyGnome::Role::Foreign;
our $VERSION = 'v0.0.3';

##~ DIGEST : 77d4740962c94e6a68a64bdb262d71c2
use strict;

use 5.006;
use warnings;

use Moo::Role;
with qw/
  Moo::GenericRole::DB
  Moo::GenericRole::DB::Abstract
  Moo::GenericRole::DB::SQLite

  Moo::Task::FileDB::Role::DB
  Moo::Task::FileDB::Role::Core

  /;

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
