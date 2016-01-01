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

  warn join ' / ', @hobbies;

  my $t = Template->new;

  my $body;

  $t->process('form2.tt', {
    name    => $name,
    age     => $age,
    gender  => $gender,
    hobbies => \@hobbies,
   }, \$body)
    || die $t->error;

  return [ 200, [ 'Content-type' => 'text/html' ], [ $body ] ];
};

