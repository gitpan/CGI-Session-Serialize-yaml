# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl CGI-Session-Serialize-yaml.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More;
BEGIN { plan tests => 2 };
use CGI::Session::Serialize::yaml;

my $data = {
    'foo'   =>  "bar\nbaz",
    'baz'   =>  [ 1, 2, 3 ],
    'eek'   =>  'cat'
};

my $serialized = "---\nbaz:\n  - 1\n  - 2\n  - 3\neek: cat\nfoo: |-\n  bar\n  baz\n";

is_deeply(CGI::Session::Serialize::yaml::thaw(undef, $serialized), $data);
$serialized = CGI::Session::Serialize::yaml::freeze(undef, $data);
is_deeply(CGI::Session::Serialize::yaml::thaw(undef, $serialized), $data);
