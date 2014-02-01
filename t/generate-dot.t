#!perl

use strict;
use warnings;

use Test::More 0.88 tests => 4;
use File::Compare;

use App::PrereqGrapher;
my $grapher;

$grapher = App::PrereqGrapher->new(format => 'dot', output_file => 'depends.dot');
$grapher->generate_graph('Module::Path');
ok(compare('depends.dot', 'module-path.dot'), 'Check graph for Module::Path');
chmod(0600, 'depends.dot');
ok(unlink('depends.dot'), "remove graph after running test");

$grapher = App::PrereqGrapher->new(depth => 2, format => 'dot', output_file => 'depends.dot');
$grapher->generate_graph('Module::Path');
ok(compare('depends.dot', 'module-path-depth-2.dot'), 'Check graph for Module::Path to depth 2');
chmod(0600, 'depends.dot');
ok(unlink('depends.dot'), "remove graph after running test");

