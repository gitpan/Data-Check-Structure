#!perl

use 5.010;
use strict;
use warnings;

use Test::More 0.98;

use Data::Check::Structure qw(
                                 is_aos is_aoa is_aoaos is_aoh
                                 is_aohos is_hos
                         );

subtest is_aos => sub {
    ok(  is_aos([]) );
    ok(  is_aos(['a', 'b']) );
    ok( !is_aos(['a', []]) );
    ok(  is_aos([1,2,3, []], {max=>3}) );
};

subtest is_aoa => sub {
    ok(  is_aoa([]) );
    ok(  is_aoa([[1], [2]]) );
    ok( !is_aoa([[1], 'a']) );
    ok(  is_aoa([[1],[],[], 'a'], {max=>3}) );
};

subtest is_aoaos => sub {
    ok(  is_aoaos([]) );
    ok(  is_aoaos([[1], [2]]) );
    ok( !is_aoaos([[1], [{}]]) );
    ok(  is_aoaos([[1],[],[], [{}]], {max=>3}) );
};

subtest is_aoh => sub {
    ok(  is_aoh([]) );
    ok(  is_aoh([{}, {a=>1}]) );
    ok( !is_aoh([{}, 'a']) );
    ok(  is_aoh([{},{},{a=>1}, 'a'], {max=>3}) );
};

subtest is_aohos => sub {
    ok(  is_aohos([]) );
    ok(  is_aohos([{a=>1}, {}]) );
    ok( !is_aohos([{a=>1}, {b=>[]}]) );
    ok(  is_aohos([{a=>1},{},{}, {b=>[]}], {max=>3}) );
};

subtest is_hos => sub {
    ok(  is_hos({}) );
    ok(  is_hos({a=>1, b=>2}) );
    ok( !is_hos({a=>1, b=>[]}) );
    #ok(  is_hos({a=>1, b=>2, c=>3, d=>[]}, {max=>3}) ); # depends on hash key random ordering
};

DONE_TESTING:
done_testing;
