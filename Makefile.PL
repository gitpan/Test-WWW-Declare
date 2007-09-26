use inc::Module::Install;

name     'Test-WWW-Declare';
all_from 'lib/Test/WWW/Declare.pm';

requires 'Test::WWW::Mechanize';
requires 'Test::Builder';
requires 'Test::More';

build_requires 'HTTP::Server::Simple::CGI';
build_requires 'Test::Tester';

WriteAll;

