use v6;

unit module Archive::Libarchive::Raw:ver<0.1.2>:auth<zef:FRITH>;

use NativeCall;

constant LIB = $*DISTRO.is-win
                ?? %?RESOURCES<libarchive.dll>.absolute
                !! ('archive', v13);

class archive       is repr('CPointer') is export { * } # libarchive private struct
class archive_entry is repr('CPointer') is export { * } # libarchive private struct

sub archive_version_number(--> int32) is native(LIB) is export { * }
sub archive_version_string(--> Str) is native(LIB) is export { * }
sub archive_version_details(--> Str) is native(LIB) is export { * }
sub archive_zlib_version(--> Str) is native(LIB) is export { * }
sub archive_liblzma_version(--> Str) is native(LIB) is export { * }
sub archive_bzlib_version(--> Str) is native(LIB) is export { * }
sub archive_liblz4_version(--> Str) is native(LIB) is export { * }
sub archive_libzstd_version(--> Str) is native(LIB) is export { * }

sub archive_read_new(--> archive) is native(LIB) is export { * }

sub archive_read_disk_new(--> archive) is native(LIB) is export { * }
sub archive_read_disk_set_standard_lookup(archive --> int32) is native(LIB) is export { * }
sub archive_read_disk_entry_from_file(archive, archive_entry, int32, Pointer --> int32) is native(LIB) is export { * }
sub archive_read_disk_set_symlink_physical(archive --> int32) is native(LIB) is export { * }
sub archive_read_disk_set_symlink_logical(archive --> int32) is native(LIB) is export { * }

sub archive_error_string(archive $archive --> Str) is native(LIB) is export { * }
sub archive_errno(archive $archive --> int32) is native(LIB) is export { * }
sub archive_clear_error(archive $archive) is native(LIB) is export { * }
sub archive_set_error(archive, int32, Str) is native(LIB) is export { * }

sub archive_read_support_filter_all(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_bzip2(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_compress(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_gzip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_grzip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_lrzip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_lz4(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_lzip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_lzma(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_lzop(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_none(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_rpm(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_uu(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_xz(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_zstd(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_program(archive $archive, Str $command --> int32) is native(LIB) is export { * }
sub archive_read_support_filter_program_signature(archive $archive, Str $cmd, Buf $match, size_t $length --> int32)
  is native(LIB) is export { * }
sub archive_read_append_filter(archive $archive, int32 $filter --> int32) is native(LIB) is export { * }
sub archive_read_append_filter_program(archive $archive, Str $prg --> int32) is native(LIB) is export { * }
sub archive_read_append_filter_program_signature(archive $archive, Str $cmd, Buf $match, size_t $length --> int32)
  is native(LIB) is export { * }

sub archive_read_support_format_all(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_7zip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_ar(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_by_code(archive $archive, int32 $code --> int32) is native(LIB) is export { * }
sub archive_read_support_format_cab(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_cpio(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_empty(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_gnutar(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_iso9660(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_lha(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_mtree(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_rar(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_raw(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_tar(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_warc(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_xar(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_zip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_zip_streamable(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_support_format_zip_seekable(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_set_format(archive $archive, int32 $format --> int32) is native(LIB) is export { * }
sub archive_read_set_options(archive, Str --> int32) is native(LIB) is export { * }
sub archive_format_name(archive $archive --> Str) is native(LIB) is export { * }
sub archive_format(archive $archive --> int32) is native(LIB) is export { * }
sub archive_filter_name(archive $archive, int32 --> Str) is native(LIB) is export { * }
sub archive_filter_count(archive $archive, int32 --> int32) is native(LIB) is export { * }
sub archive_compression_name(archive $archive --> Str) is native(LIB) is export { * }

sub archive_read_add_passphrase(archive, Str --> int32) is native(LIB) is export { * }

sub archive_read_open_filename(archive $archive, Str $filename, size_t $block-size --> int32) is native(LIB) is export { * }
sub archive_read_open_memory(archive $archive, Buf $data, size_t $size --> int32) is native(LIB) is export { * }

sub archive_read_open(archive, int64,
                      &open (archive, int64 --> int32),
                      &read (archive, int64, CArray[Pointer] --> size_t),
                      &close (archive, int64 --> int32)
                      --> int32) is native(LIB) is export { * }

sub archive_read_next_header(archive $archive, archive_entry $entry is rw --> int32) is native(LIB) is export { * }
sub archive_read_next_header2(archive $archive, archive_entry $entry --> int32) is native(LIB) is export { * }
sub archive_read_data_skip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_file_count(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_finish(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_free(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_close(archive $archive --> int32) is native(LIB) is export { * }
sub archive_read_data_block(archive $archive, Pointer[void] $buff is rw, size_t $size is rw, int64 $offset is rw --> int32)
  is native(LIB) is export { * }
sub archive_read_data(archive $archive, Blob $buff, size_t $len --> size_t) is native(LIB) is export { * }
sub archive_read_extract(archive $archive, archive_entry $entry, int32 $flags --> int32) is native(LIB) is export { * }

sub archive_write_new(--> archive) is native(LIB) is export { * }
sub archive_write_disk_new(--> archive) is native(LIB) is export { * }
sub archive_write_disk_set_options(archive $archive, int32 $flags --> int32) is native(LIB) is export { * }
sub archive_write_disk_set_standard_lookup(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_header(archive $archive, archive_entry $entry --> int32) is native(LIB) is export { * }
sub archive_write_close(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_free(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_data(archive $archive, Buf $data, size_t $size --> size_t) is native(LIB) is export { * }
sub archive_write_data_block(archive $archive, Pointer[void] $buff, size_t $size, int64 $offset --> int32) is native(LIB) is export { * }
sub archive_write_finish_entry(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_fail(archive $archive --> int32) is native(LIB) is export { * }

sub archive_write_open(archive, int64,
                       &open (archive, int64 --> int32),
                       &write (archive, int64, CArray[uint8], size_t --> size_t),
                       &close (archive, int64 --> int32) --> int32)
    is native(LIB) is export { * }

sub archive_write_open_fd(archive $archive, int32 $_fd --> int32) is native(LIB) is export { * }
sub archive_write_open_filename(archive $archive, Str $_file --> int32) is native(LIB) is export { * }
sub archive_write_open_filename_w(archive $archive, Str $_file --> int32) is native(LIB) is export { * }
sub archive_write_open_memory(archive $archive, Pointer[void] $_buffer, size_t $_buffSize, size_t $_used is rw --> int32)
  is native(LIB) is export { * }

sub archive_write_add_filter(archive $archive, int32 $filter_code --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_by_name(archive $archive, Str $name --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_b64encode(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_bzip2(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_compress(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_grzip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_gzip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_lrzip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_lz4(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_lzip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_lzma(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_lzop(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_none(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_program(archive $archive, Str $cmd --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_uuencode(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_xz(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_add_filter_zstd(archive $archive --> int32) is native(LIB) is export { * }

sub archive_write_set_format(archive $archive, int32 $format_code --> int32) is native(LIB) is export { * }
sub archive_write_set_format_by_name(archive $archive, Str $name --> int32) is native(LIB) is export { * }
sub archive_write_set_format_7zip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_ar_bsd(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_ar_svr4(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_cpio(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_cpio_newc(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_gnutar(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_iso9660(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_mtree(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_mtree_classic(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_pax(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_pax_restricted(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_raw(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_shar(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_shar_dump(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_ustar(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_v7tar(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_warc(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_xar(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_zip(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_set_format_filter_by_ext(archive $archive, Str $filename --> int32) is native(LIB) is export { * }
sub archive_write_set_format_filter_by_ext_def(archive $archive, Str $filename, Str $def_ext --> int32) is native(LIB) is export { * }
sub archive_write_set_options(archive $archive, Str $options --> int32) is native(LIB) is export { * }

sub archive_write_set_bytes_per_block(archive, int32 --> int32) is native(LIB) is export { * }
sub archive_write_set_bytes_in_last_block(archive, int32 --> int32) is native(LIB) is export { * }

sub archive_write_set_passphrase(archive, Str --> int32) is native(LIB) is export { * }

sub archive_write_zip_set_compression_deflate(archive $archive --> int32) is native(LIB) is export { * }
sub archive_write_zip_set_compression_store(archive $archive --> int32) is native(LIB) is export { * }

sub archive_entry_new(--> archive_entry) is native(LIB) is export { * }
sub archive_entry_pathname(archive_entry $archive_entry --> Str) is native(LIB) is export { * }
sub archive_entry_size(archive_entry $archive_entry --> int64) is native(LIB) is export { * }
sub archive_entry_uid(archive_entry $archive_entry --> int64) is native(LIB) is export { * }
sub archive_entry_gid(archive_entry $archive_entry --> int64) is native(LIB) is export { * }
sub archive_entry_set_atime(archive_entry $archive_entry, int64, int64) is native(LIB) is export { * }
sub archive_entry_unset_atime(archive_entry $archive_entry) is native(LIB) is export { * }
sub archive_entry_atime(archive_entry $archive_entry --> int64) is native(LIB) is export { * }
sub archive_entry_set_birthtime(archive_entry $archive_entry, int64, int64) is native(LIB) is export { * }
sub archive_entry_unset_birthtime(archive_entry $archive_entry) is native(LIB) is export { * }
sub archive_entry_birthtime(archive_entry --> int64) is native(LIB) is export { * }
sub archive_entry_set_ctime(archive_entry $archive_entry, int64, int64) is native(LIB) is export { * }
sub archive_entry_unset_ctime(archive_entry $archive_entry) is native(LIB) is export { * }
sub archive_entry_ctime(archive_entry --> int64) is native(LIB) is export { * }
sub archive_entry_set_dev(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_devmajor(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_devminor(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_filetype(archive_entry $archive_entry, uint32) is native(LIB) is export { * }
sub archive_entry_filetype(archive_entry $archive_entry --> uint32) is native(LIB) is export { * }
sub archive_entry_set_fflags(archive_entry $archive_entry, int64, int64) is native(LIB) is export { * }
sub archive_entry_copy_fflags_text(archive_entry $archive_entry, Str --> Str) is native(LIB) is export { * }
sub archive_entry_copy_fflags_text_w(archive_entry $archive_entry, Str --> Str) is native(LIB) is export { * }
sub archive_entry_fflags_text(archive_entry $archive_entry --> Str) is native(LIB) is export { * }
sub archive_entry_set_gid(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_gname(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_set_gname_utf8(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_gname(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_gname_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_gname(archive_entry $archive_entry --> Str) is native(LIB) is export { * }
sub archive_entry_update_gname_utf8(archive_entry $archive_entry, Str --> int32) is native(LIB) is export { * }
sub archive_entry_set_hardlink(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_set_hardlink_utf8(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_hardlink(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_hardlink_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_update_hardlink_utf8(archive_entry $archive_entry, Str --> int32) is native(LIB) is export { * }
sub archive_entry_set_ino(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_ino64(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_link(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_set_link_utf8(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_link(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_link_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_update_link_utf8(archive_entry $archive_entry, Str --> int32) is native(LIB) is export { * }
sub archive_entry_set_mode(archive_entry $archive_entry, int32) is native(LIB) is export { * }
sub archive_entry_mode(archive_entry --> int32) is native(LIB) is export { * }
sub archive_entry_strmode(archive_entry $archive_entry --> Str) is native(LIB) is export { * }
sub archive_entry_set_mtime(archive_entry $archive_entry, int64, int64) is native(LIB) is export { * }
sub archive_entry_unset_mtime(archive_entry $archive_entry) is native(LIB) is export { * }
sub archive_entry_mtime(archive_entry --> int64) is native(LIB) is export { * }
sub archive_entry_set_nlink(archive_entry $archive_entry, uint32) is native(LIB) is export { * }
sub archive_entry_set_pathname(archive_entry $archive_entry, Str $filename) is native(LIB) is export { * }
sub archive_entry_set_pathname_utf8(archive_entry $archive_entry, Str $filename) is native(LIB) is export { * }
sub archive_entry_copy_pathname(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_pathname_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_update_pathname_utf8(archive_entry $archive_entry, Str --> int32) is native(LIB) is export { * }
sub archive_entry_set_perm(archive_entry $archive_entry, int32) is native(LIB) is export { * }
sub archive_entry_perm(archive_entry $archive_entry --> int32) is native(LIB) is export { * }
sub archive_entry_set_rdev(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_rdevmajor(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_rdevminor(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_size(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_unset_size(archive_entry $archive_entry) is native(LIB) is export { * }
sub archive_entry_copy_sourcepath(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_sourcepath_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_sourcepath(archive_entry --> Str) is native(LIB) is export { * }
sub archive_entry_set_symlink(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_set_symlink_utf8(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_symlink(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_symlink_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_update_symlink_utf8(archive_entry $archive_entry, Str --> int32) is native(LIB) is export { * }
sub archive_entry_symlink(archive_entry --> Str) is native(LIB) is export { * }
sub archive_entry_set_uid(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_uname(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_set_uname_utf8(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_uname(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_uname_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_update_uname_utf8(archive_entry $archive_entry, Str --> int32) is native(LIB) is export { * }
sub archive_entry_uname(archive_entry $archive_entry --> Str) is native(LIB) is export { * }
sub archive_entry_set_is_data_encrypted(archive_entry $archive_entry, int8 $is_encrypted) is native(LIB) is export { * }
sub archive_entry_set_is_metadata_encrypted(archive_entry $archive_entry, int8 $is_encrypted) is native(LIB) is export { * }
sub archive_entry_copy_mac_metadata(archive_entry $archive_entry, Pointer[void], size_t) is native(LIB) is export { * }
sub archive_entry_free(archive_entry $archive_entry) is native(LIB) is export { * }
sub archive_entry_clone(archive_entry --> archive_entry) is native(LIB) is export { * }

=begin pod

=head1 NAME

Archive::Libarchive::Raw - A simple interface to libarchive

=head1 SYNOPSIS
=begin code :lang<raku>

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

=end code

For more examples see the I<example> directory.

=head1 DESCRIPTION

B<Archive::Libarchive::Raw> is a set of simple bindings to libarchive using NativeCall.

As the Libarchive site (L<http://www.libarchive.org/>) states, its implementation is able to:

=item Read a variety of formats, including tar, pax, cpio, zip, xar, lha, ar, cab, mtree, rar, and ISO images.
=item Write tar, pax, cpio, zip, xar, ar, ISO, mtree, and shar archives.
=item Handle automatically archives compressed with gzip, bzip2, lzip, xz, lzma, or compress.

For more details on libarchive see L<https://github.com/libarchive/libarchive/wiki/ManualPages>.

=head1 Prerequisites

This module requires the libarchive library to be installed. Please follow the
instructions below based on your platform:

=head2 Debian Linux

=begin code
sudo apt-get install libarchive13
=end code

=head2 Windows

The compiled version of the library can be downloaded here: L<https://www.libarchive.org/downloads/>

=head1 Installation

=begin code
$ zef install Archive::Libarchive::Raw
=end code

=head1 Note

This module relies on a C library which might not be present in one's installation, so it's not a substitute
for a pure Raku module.

This is a raw interface to the functions provided by the C library; any program that uses this module might
need to use NativeCall. If you wish to use a higher level interface, please take a look at Archive::Libarchive.

=head1 Author

Fernando Santagata

=head1 Contributions

Many thanks to Curt Tilmes for implementing a bunch of calls to libarchive, and providing tests.

=head1 License

The Artistic License 2.0

=end pod
