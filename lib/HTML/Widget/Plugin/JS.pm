use strict;
use warnings;

package HTML::Widget::Plugin::JS;
use base qw(HTML::Widget::Plugin);

=head1 NAME

HTML::Widget::Plugin::JS - a JavaScript variable declaration emitter

=head1 VERSION

version 0.003

=cut

our $VERSION = '0.003';

use Data::JavaScript::Anon;

sub provided_widgets { qw(js_var js_vars js_anon) }

sub boolean_args {}
sub attribute_args {}

=head2 js_var

=head2 js_vars

These are two names for the same widget.  Given a hashref, they will produce
JavaScript code to assign the data in the hashref.

In otherwords, this widget:

  $fac->js_vars({
    foo => { a => 1, b => 2 },
    bar => [ 4, 2, 3 ],
  });

...will be rendered something like this:

  var foo = { a: 1, b: 2 };
  var bar = [ 1, 2, 3 ];

=cut

sub js_vars {
  my ($self, $factory, $arg) = @_;
  
  my $str =
    join "\n",
    map  { Data::JavaScript::Anon->var_dump($_ => $arg->{$_}) }
    keys %$arg;

  return $str;
}

BEGIN { *js_var = \&js_vars }

=head2 js_anon

This widget converts a given data structure to an anonymous JavaScript
structure.  This basically just provides a widget factory interface to
Data::JavaScript::Anon.

=cut

sub js_anon {
  my ($self, $factory, $arg) = @_;

  Data::JavaScript::Anon->anon_dump($arg);
}


=head2 AUTHOR

This code was written by Ricardo SIGNES.

=head2 COPYRIGHT

This code is copyright (c) 2008, Ricardo SIGNES.  It is free software,
available under the same terms as perl itself.

=cut

1;
