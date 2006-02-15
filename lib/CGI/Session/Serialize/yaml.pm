package CGI::Session::Serialize::yaml;

use strict;
use CGI::Session::ErrorHandler;
use YAML ();

our $SYCK = eval "use YAML::Syck (); 1;";

$CGI::Session::Serialize::yaml::VERSION = '1.0';
@CGI::Session::Serialize::yaml::ISA     = ( "CGI::Session::ErrorHandler" );

sub freeze {
    my ($self, $data) = @_;
    if($SYCK) {
        return YAML::Syck::Dump($data);
    } else {
        return YAML::Dump($data);
    }
}


sub thaw {
    my ($self, $string) = @_;
    if($SYCK) {
        return (YAML::Syck::Load($string))[0];
    } else {
        return (YAML::Load($string))[0];
    }
}

1;

__END__;

=pod

=head1 NAME

CGI::Session::Serialize::yaml - serializer for CGI::Session

=head1 DESCRIPTION

This library can be used by CGI::Session to serialize session data. Uses
L<YAML|YAML>, or the faster C implementation, L<YAML::Syck|YAML::Syck>
if it is available. YAML serializers exist not just for Perl but also other
dynamic languages, such as PHP, Python, and Ruby, so storing session data
in this format makes it easy to share session data across different languages.

=head1 METHODS

=over 4

=item freeze($class, \%hash)

Receives two arguments. First is the class name, the second is the data to be serialized. Should return serialized string on success, undef on failure. Error message should be set using C<set_error()|CGI::Session::ErrorHandler/"set_error()">

=item thaw($class, $string)

Received two arguments. First is the class name, second is the I<YAML> data string. Should return thawed data structure on success, undef on failure. Error message should be set using C<set_error()|CGI::Session::ErrorHandler/"set_error()">

=back

=head1 LICENSE

Copyright 2006 Tyler "Crackerjack" MacDonald <japh@crackerjack.net>

This is free software; You may distribute it under the same terms as perl
itself.

=head1 SEE ALSO

L<CGI::Session>, L<YAML>, L<YAML::Syck>.

=cut
