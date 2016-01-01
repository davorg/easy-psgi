#!/usr/bin/plackup

use strict;
use warnings;

use HTML::Tiny;

my $app = sub {
  my $now = localtime;
  my $title = 'Time';
  my $h = HTML::Tiny->new;
  my $body = $h->html([
    $h->head( $h->title($title) ),
    $h->body([
      $h->h1($title),
      $h->p("The time is $now"),
    ]),
  ]);

  return [
    200,
    [ 'Content-type' => 'text/html' ],
    [ $body ],
  ];
};

