#!perl

use Test::More tests => 15;
use Test::Exception;

use ok 'Locale::CLDR';

my $locale = Locale::CLDR->new(language => 'en');
is("$locale", 'en', 'Set Language explicitly');

$locale = Locale::CLDR->new('en');
is("$locale", 'en', 'Set Language implicitly');

my $locale = Locale::CLDR->new(language => 'en', region => 'gb');
is("$locale", 'en_GB', 'Set Language and Region explicitly');

$locale = Locale::CLDR->new('en-gb');
is("$locale", 'en_GB', 'Set Language and Region implicitly');

my $locale = Locale::CLDR->new(language => 'en', script => 'latn');
is("$locale", 'en_Latn', 'Set Language and Script explicitly');

$locale = Locale::CLDR->new('en-latn');
is("$locale", 'en_Latn', 'Set Language and Script implicitly');

my $locale = Locale::CLDR->new(language => 'en', region => 'gb', script => 'latn');
is("$locale", 'en_Latn_GB', 'Set Language, Region and Script explicitly');

$locale = Locale::CLDR->new('en-latn-gb');
is("$locale", 'en_Latn_GB', 'Set Language, Region and Script implicitly');

my $locale = Locale::CLDR->new(language => 'en', variant => 'BOKMAL');
is("$locale", 'en_BOKMAL', 'Set Language and Variant from string explicitly');

$locale = Locale::CLDR->new('en_BOKMAL');
is("$locale", 'en_BOKMAL', 'Set Language and variant implicitly');

$locale = Locale::CLDR->new('en_latn_gb_BOKMAL');
is("$locale", 'en_Latn_GB_BOKMAL', 'Set Language, Region, Script and variant implicitly');

throws_ok { $locale = Locale::CLDR->new('wibble') } qr/Invalid language/, "Caught invalid language";
throws_ok { $locale = Locale::CLDR->new('en_wi') } qr/Invalid teritory/, "Caught invalid teritory";
throws_ok { $locale = Locale::CLDR->new('en_wibb') } qr/Invalid script/, "Caught invalid script";
