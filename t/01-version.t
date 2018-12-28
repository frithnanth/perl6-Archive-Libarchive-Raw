#!/usr/bin/env perl6

use Test;
use lib 'lib';
use Archive::Libarchive::Raw;

constant AUTHOR = ?%*ENV<TEST_AUTHOR>;

if AUTHOR {
  is archive_version_number, 3003003, 'version number';
  is archive_version_string, 'libarchive 3.3.3', 'version string';
  is archive_version_details,
    'libarchive 3.3.3 zlib/1.2.11 liblzma/5.2.2 bz2lib/1.0.6 liblz4/1.8.2 libzstd/1.3.5',
    'version details';
  is archive_zlib_version, '1.2.11', 'linked zlib version';
  is archive_liblzma_version, '5.2.2', 'linked liblzma version';
  is archive_bzlib_version, '1.0.6, 6-Sept-2010', 'linked bzlib version';
  is archive_liblz4_version, '1.8.2', 'linked liblz4 version';
  is archive_libzstd_version, '1.3.5', 'linked libzstd version';
}else{
  skip 'version number', 1;
  skip 'version string', 1;
  skip 'version details', 1;
  skip 'linked zlib version', 1;
  skip 'linked liblzma version', 1;
  skip 'linked bzlib version', 1;
  skip 'linked liblz4 version', 1;
}

done-testing;
