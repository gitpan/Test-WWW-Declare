#!perl
use Test::WWW::Declare::Tester tests => 13;
use warnings;
use strict;

my @results = run_tests(
    sub {
        session "check logins" => run {
            flow "visit index good and formy" => check {
                flow "visit index" => check {
                    get "http://localhost:$PORT/";
                    title should equal 'INDEX';
                };

                flow "visit good" => check {
                    click href qr/good/;
                    title should equal 'GOOD';
                };

                flow "visit formy" => check {
                    get "http://localhost:$PORT/formy";
                    title should equal 'FORMY';
                };
            };
        };
    }
);

shift @results; # Test::Tester gives 1-based arrays
is(@results, 4, "had four tests");
ok($results[0]{ok}, "1st test passed");
ok($results[1]{ok}, "2nd test passed");
ok($results[2]{ok}, "3rd test passed");
ok($results[3]{ok}, "4th test passed");

is($results[0]{name}, "visit index");
is($results[1]{name}, "visit good");
is($results[2]{name}, "visit formy");
is($results[3]{name}, "visit index good and formy");

is($results[0]{diag}, '', 'no errors/warnings');
is($results[1]{diag}, '', 'no errors/warnings');
is($results[2]{diag}, '', 'no errors/warnings');
is($results[3]{diag}, '', 'no errors/warnings');

