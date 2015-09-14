use strict;
use warnings;

use Test::More tests => 2;
use Test::Deep;

use MsgPack::Encoder;
use MsgPack::Type::Ext;

sub encode {
    [ map { ord } split '', MsgPack::Encoder->new(struct => shift) ]
};

sub cmp_encode(@){
    my( $struct, $wanna, $comment ) = @_;
    $struct = encode($struct);
    cmp_deeply( $struct => $wanna, $comment )
        or diag explain $struct;
}

cmp_encode 15 => [ 15 ], "number 15";

cmp_encode( MsgPack::Type::Ext->new( type => 5, data => chr(13) ) => [ 0xd4, 5, 13 ], "fixext1" );

