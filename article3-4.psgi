#!/usr/bin/plackup

use strict;
use warnings;
use Plack::Request;
use Template;

my $app = sub {
  my $req = Plack::Request->new(shift);

  my $name    = $req->parameters->{name};
  my $age     = $req->parameters->{age};
  my $gender  = $req->parameters->{gender};
  my @hobbies = $req->parameters->get_all('hobby');

  my $list;

  if (@hobbies) {
    $list = join ', ', @hobbies;
  } else {
    $list = 'None';
  }

  my $t = Template->new;

  my $body;

  $t->process('form.tt', {
    name    => $name,
    age     => $age,
    gender  => $gender,
    hobbies => $list,
   }, \$body)
    || die $t->error;

  return [ 200, [ 'Content-type' => 'text/html' ], [ $body ] ];
};

