[![Actions Status](https://github.com/frithnanth/perl6-Archive-Libarchive-Raw/workflows/test/badge.svg)](https://github.com/frithnanth/perl6-Archive-Libarchive-Raw/actions)

NAME
====

Archive::Libarchive::Raw - A simple interface to libarchive

SYNOPSIS
========

```raku
use Archive::Libarchive::Raw;
use Archive::Libarchive::Constants;

sub MAIN(:$file! where { .IO.f // die "file '$file' not found" })
{
  my archive $a = archive_read_new();
  archive_read_support_filter_all($a);
  archive_read_support_format_all($a);
  archive_read_open_filename($a, $file, 10240) == ARCHIVE_OK or die 'Unable to open archive';
  my archive_entry $entry .= new;
  while archive_read_next_header($a, $entry) == ARCHIVE_OK {
    my $name = archive_entry_pathname($entry);
    say $name;
    archive_read_data_skip($a);
  }
  archive_read_free($a) == ARCHIVE_OK or die 'Unable to free internal data structure';
}
```

For more examples see the *example* directory.

DESCRIPTION
===========

**Archive::Libarchive::Raw** is a set of simple bindings to libarchive using NativeCall.

As the Libarchive site ([http://www.libarchive.org/](http://www.libarchive.org/)) states, its implementation is able to:

  * Read a variety of formats, including tar, pax, cpio, zip, xar, lha, ar, cab, mtree, rar, and ISO images.

  * Write tar, pax, cpio, zip, xar, ar, ISO, mtree, and shar archives.

  * Handle automatically archives compressed with gzip, bzip2, lzip, xz, lzma, or compress.

For more details on libarchive see [https://github.com/libarchive/libarchive/wiki/ManualPages](https://github.com/libarchive/libarchive/wiki/ManualPages).

Prerequisites
=============

This module requires the libarchive library to be installed. Please follow the instructions below based on your platform:

Debian Linux
------------

    sudo apt-get install libarchive13

Windows
-------

The compiled version of the library can be downloaded here: [https://www.libarchive.org/downloads/](https://www.libarchive.org/downloads/)

Installation
============

    $ zef install Archive::Libarchive::Raw

Note
====

This module relies on a C library which might not be present in one's installation, so it's not a substitute for a pure Raku module.

This is a raw interface to the functions provided by the C library; any program that uses this module might need to use NativeCall. If you wish to use a higher level interface, please take a look at Archive::Libarchive.

Author
======

Fernando Santagata

Contributions
=============

Many thanks to Curt Tilmes for implementing a bunch of calls to libarchive, and providing tests.

License
=======

The Artistic License 2.0

