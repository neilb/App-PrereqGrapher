#!perl

use strict;
use warnings;

use Test::More 0.88 tests => 2;
use File::Compare;

use App::PrereqGrapher;

my $grapher = App::PrereqGrapher->new(format => 'dot', output_file => 'dependencies.dot');
$grapher->generate_graph('Module::Path');
ok(compare('dependencies.dot', 'module-path.dot'), 'Check graph for Module::Path');
ok(unlink('dependencies.dot'), "remove graph after running test");
