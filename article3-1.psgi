#!/usr/bin/plackup

use strict;
use warnings;
use Plack::Request;
use HTML::Tiny;

my $app = sub {
  my $info = Plack::Request->new(shift)->path_info;
  my @info = split /\//, $info;

  my $h = HTML::Tiny->new;
  my $body = $h->html(
               $h->body([
                 $h->h1('Path Info'),
                 $h->p('Here are the contents of $ENV{PATH_INFO}'),
                 $h->ul([ $h->li(@info) ]),
               ]),
             );

  return [ 200, [ 'Content-type' => 'text/html' ], [ $body ] ];
};
