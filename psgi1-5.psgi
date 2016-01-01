#!/usr/bin/plackup

use strict;
use warnings;

use Plack::Request;
use HTML::Tiny;

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

  my $h = HTML::Tiny->new;
  my $body = $h->html([
    $h->head($h->title($name)),
    $h->body([
      $h->h1("Welcome $name"),
      $h->p('Here are your details:'),
      $h->table([
        $h->tr([
          $h->td('Name:'),
          $h->td($name),
        ], [
          $h->td('Age:'),
          $h->td($age),
        ], [
          $h->td('Gender:'),
          $h->td($gender),
        ], [
          $h->td('Hobbies:'),
          $h->td($list),
        ]),
      ]),
    ]),
  ]);

  return [ 200, [ 'Content-type' => 'text/html' ], [ $body ] ];
};

