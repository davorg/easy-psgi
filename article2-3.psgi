#!/usr/bin/plackup
use strict;
use warnings;
use Plack::Request;

my $app = sub {

  my $req  = Plack::Request->new(shift);
  my $user = $req->parameters->{user};
  my $who = `finger $user`;

  return [ 200, [ 'Content-type' => 'text/plain' ],
           [ "Here are the results for user $user\n\n",
             $who ] ];
}
