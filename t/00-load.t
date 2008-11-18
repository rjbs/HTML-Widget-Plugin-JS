use strict;
use warnings;
use Test::More tests => 1;

use HTML::Widget::Factory;

my $factory = HTML::Widget::Factory->new;

is(
  $factory->js_var({ a => [ 1, 2, 3 ], b => { x => 10 } }),
  $factory->js_vars({ a => [ 1, 2, 3 ], b => { x => 10 } }),
  "js_vars and js_var are equiv",
);
