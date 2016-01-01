#!/usr/bin/plackup
use strict;
use warnings;
use Plack::Request;

$ENV{PATH} = '/bin:/usr/bin:/usr/local/bin';

my $app = sub {
  my $req  = Plack::Request->new(shift);
  my $user = $req->parameters->{user};

  if ($user =~ /^(\w+)$/) {
    $user = $1;
  } else {
    die "Invalid user: $user\n";
  }

  my $who = `finger $user`;

  return [ 200, [ 'Content-type' => 'text/plain' ],
           [ "Here are the results for user $user\n\n",
             $who ] ];
};
