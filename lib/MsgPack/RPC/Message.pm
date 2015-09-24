package MsgPack::RPC::Message;
our $AUTHORITY = 'cpan:YANICK';
# ABSTRACT: a MessagePack-RPC notification
$MsgPack::RPC::Message::VERSION = '0.1.0';

use Moose;
extends 'Beam::Event';

has args => (
   traits => [ 'Array' ],
   is => 'ro',
   default => sub { [] },
   handles => {
      all_args => 'elements',
   },
);


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

MsgPack::RPC::Message - a MessagePack-RPC notification

=head1 VERSION

version 0.1.0

=head1 SYNOPSIS

    use MsgPack::RPC;

    my $rpc = MsgPack::RPC->new( io => '127.0.0.1:6543' );

    $rpc->emit( some_notification => 'MsgPack::RPC::Message', args => [ 1..5 ] );

=head1 DESCRIPTION

C<MsgPack::RPC::Message> extends the L<Beam::Event> class, and encapsulates a notification received by 
the L<MsgPack::RPC> object.  Requests are encapsulated by the sub-class L<MsgPack::RPC::Message::Request>.

=head1 METHODS

=head2 new( args => $args )

The constructor accepts a single argument, C<args>, which is the struct 
holding the arguments of the notification itself.

=head1 SEE ALSO

=over

=item L<MsgPack::RPC::Message::Request> - subclass for requests.

=back

=head1 AUTHOR

Yanick Champoux <yanick@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Yanick Champoux.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
