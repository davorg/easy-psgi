#!/usr/bin/plackup

use strict;
use warnings;
use Plack::Request;
use Plack::Response;
use HTML::Tiny;

my $app = sub {
  my $name;
  my $logged;

  my $req = Plack::Request->new(shift);
  my $res = Plack::Response->new(200);

  if ($req->parameters->{login}) {
    $logged = 1;
    $name = $req->parameters->{name};
    $res->cookies->{name} = {
      value   => $name,
      expires => '+1y',
    };
  } elsif ($req->parameters->{logout}) {
    $logged = 0;
    $name = 'Guest';
    $res->cookies->{name} = {
      value   => '',
      expires => '-1d',
    };
  } else {
    $logged = defined $req->cookies->{name};
    $name = $req->cookies->{name} || 'Guest';
  }

  $name =~ s/</&lt/g;

  my $h = HTML::Tiny->new;

  my $form;
  if ($logged) {
    $form = $h->p(
      $h->input({ type => 'submit', name => 'logout', value => 'logout' }),
    );
  } else {
    $form = $h->p([
      $h->p('Enter your name: ' . $h->input({ name => 'name' })),
      $h->input({ type => 'submit', name => 'login', value => 'Set name' }),
   ]); 
  }

  my $body = $h->html([
    $h->h1('Cookies'),
    $h->p('This is a cookie test page'),
    $h->p([ 'Hello ', $h->b($name) ]),
    $h->form($form),
  ]);

  $res->body($body);

  return $res->finalize;
};

