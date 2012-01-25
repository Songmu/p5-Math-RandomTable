use inc::Module::Install;
name 'Math-RandomTable';
all_from 'lib/Math/RandomTable.pm';

requires 'Math::Random::MT';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
