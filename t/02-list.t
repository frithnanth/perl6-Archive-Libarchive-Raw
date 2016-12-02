#!/usr/bin/env perl6

use Test;
use lib 'lib';
use Archive::Libarchive::Raw;

my archive $a = archive_read_new();
ok {defined $a}, 'initialization';
# from file
is archive_read_support_filter_all($a), ARCHIVE_OK, 'use any compression filter';
is archive_read_support_format_all($a), ARCHIVE_OK, 'use any file format';
my $path = $*PROGRAM-NAME.subst(/ <-[/]>+$/, '');
my $file = $path ~ "testdata.tar.gz";
is archive_read_open_filename($a, $file, 10240), ARCHIVE_OK, 'read from file';
my archive_entry $entry .= new;
ok {defined $entry}, 'create entry object';
is archive_read_next_header($a, $entry), ARCHIVE_OK, 'read header entry from file';
is archive_entry_pathname($entry), 'datafile1', 'read file name';
is archive_read_data_skip($a), ARCHIVE_OK, 'skip file data';
is archive_read_free($a), ARCHIVE_OK, 'free internal data structures';
# from memory
my archive $a2 = archive_read_new();
my $buffer = slurp $file, :bin;
is archive_read_support_compression_gzip($a2), ARCHIVE_OK, 'use gzip compression';
is archive_read_support_format_tar($a2), ARCHIVE_OK, 'use tar file format';
is archive_read_open_memory($a2, $buffer, $file.IO.s), ARCHIVE_OK, 'read from memory';
is archive_read_next_header($a2, $entry), ARCHIVE_OK, 'read header entry from memory';
archive_read_free($a2);

done-testing;
