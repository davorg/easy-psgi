Easy PSGI Programming
=====================

Some really simple sample PSGI programs that are written simply to
demonstrate that you don't need use web frameworks to move your code
from CGI to PSGI.

The sample programs are based on the code in 
[a series of three articles on CGI programming](http://perlhacks.com/articles/cgi-programming/)
that I wrote for Linux Format back in 2000.

**Note:** I'm not saying that I think this is the best way of writing
web programs in Perl. I am saying that this is a reasonably easy way to
port old CGI programs to PSGI.

**Note2:** It's also worth pointing out that if you have a pile of old CGI
programs that you want to move to PSGI as quickly and as painlessly as
possible, then you should look at
[CGI::Emulate::PSGI](https://metacpan.org/pod/CGI::Emulate::PSGI) or
[CGI::PSGI](https://metacpan.org/pod/CGI::PSGI).
