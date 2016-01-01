#!/usr/bin/plackup

use strict;
use warnings;
use Plack::Request;
use Plack::Response;
use HTML::Tiny;

my $app = sub {
  my $time = Plack::Request->new(shift)->cookies->{time};
  my $time_text;
  if ($time) {
    $time_text = "You last visited this page at $time";
  } else {
    $time_text = "You haven't visited this page before";
  }

  my $res  = Plack::Response->new(200);
  $res->cookies->{time} = {
    value   => scalar localtime,
    expires => '+1y',
  };
  $res->content_type('text/html');

  my $h = HTML::Tiny->new;
  my $body = $h->html([
               $h->head(
                 $h->title('Cookie Test'),
               ),
               $h->body([
                 $h->h1('Cookie Test'),
                 $h->p($time_text),
               ]),
             ]);

  $res->body($body);
  return $res->finalize;
};

