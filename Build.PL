use File::Spec;
use Module::Build;

# ./t/sessiondata is needed for testing.

mkdir(File::Spec->catfile('t', 'sessiondata'));

Module::Build -> new
(
	module_name    => 'CGI::Session::Serialize::yaml',
	license        => 'artistic',
	dist_abstract  => "Add YAML and YAML::Syck support to CGI::Session's serializers",
	dist_author    => 'Ron Savage <ron@savage.net.au>',
	build_requires =>
	{
		Test::More => 0,
		Test::Pod  => 0,
	},
	requires =>
	{
		CGI::Session => '4.20',
		File::Spec   => 0,
	},
) -> create_build_script();
