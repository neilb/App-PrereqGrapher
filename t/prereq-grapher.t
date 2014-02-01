#!perl

use strict;
use warnings;

use Test::More 0.88 tests => 2;
use FindBin 0.05;
use File::Spec::Functions;
use Devel::FindPerl qw(find_perl_interpreter);
use File::Compare;

my $PERL    = find_perl_interpreter() || die "can't find perl!\n";
my $GRAPHER = catfile( $FindBin::Bin, updir(), qw(bin prereq-grapher) );

system("'$PERL' '$GRAPHER' -o depends.dot -dot Module::Path");
ok(compare('depends.dot', 'module-path.dot'), 'Check graph for Module::Path');
chmod(0600, 'depends.dot');
ok(unlink('depends.dot'), "remove graph after running test");
