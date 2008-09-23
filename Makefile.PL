use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'HTML::Widget::Plugin::JS',
    AUTHOR              => 'Ricardo Signes <rjbs@cpan.org>',
    VERSION_FROM        => 'lib/HTML/Widget/Plugin/JS.pm',
    ABSTRACT_FROM       => 'lib/HTML/Widget/Plugin/JS.pm',
    (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More'    => 0,
        'Data::JavaScript::Anon' => 0,
        'HTML::Widget::Factory'  => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'HTML-Widget-Plugin-JS-* cover_db' },
);
