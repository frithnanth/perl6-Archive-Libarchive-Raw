use v6;
unit module Archive::Libarchive::Raw:ver<0.0.1>;

use NativeCall;

constant LIB = %*ENV<PERL6_LIBARCHIVE_LIB> || 'libarchive.so';

constant ARCHIVE_OK                                       is export = 0;
constant ARCHIVE_EOF                                      is export = 1;
constant ARCHIVE_RETRY                                    is export = 0xFFFFFFF6;
constant ARCHIVE_WARN                                     is export = 0xFFFFFFEC;
constant ARCHIVE_FAILED                                   is export = 0xFFFFFFE7;
constant ARCHIVE_FATAL                                    is export = 0xFFFFFFE2;
constant ARCHIVE_FILTER_NONE                              is export = 0;
constant ARCHIVE_FILTER_GZIP                              is export = 1;
constant ARCHIVE_FILTER_BZIP2                             is export = 2;
constant ARCHIVE_FILTER_COMPRESS                          is export = 3;
constant ARCHIVE_FILTER_PROGRAM                           is export = 4;
constant ARCHIVE_FILTER_LZMA                              is export = 5;
constant ARCHIVE_FILTER_XZ                                is export = 6;
constant ARCHIVE_FILTER_UU                                is export = 7;
constant ARCHIVE_FILTER_RPM                               is export = 8;
constant ARCHIVE_FILTER_LZIP                              is export = 9;
constant ARCHIVE_FILTER_LRZIP                             is export = 10;
constant ARCHIVE_FILTER_LZOP                              is export = 11;
constant ARCHIVE_FILTER_GRZIP                             is export = 12;
constant ARCHIVE_FILTER_LZ4                               is export = 13;
constant ARCHIVE_COMPRESSION_NONE                         is export = ARCHIVE_FILTER_NONE;
constant ARCHIVE_COMPRESSION_GZIP                         is export = ARCHIVE_FILTER_GZIP;
constant ARCHIVE_COMPRESSION_BZIP2                        is export = ARCHIVE_FILTER_BZIP2;
constant ARCHIVE_COMPRESSION_COMPRESS                     is export = ARCHIVE_FILTER_COMPRESS;
constant ARCHIVE_COMPRESSION_PROGRAM                      is export = ARCHIVE_FILTER_PROGRAM;
constant ARCHIVE_COMPRESSION_LZMA                         is export = ARCHIVE_FILTER_LZMA;
constant ARCHIVE_COMPRESSION_XZ                           is export = ARCHIVE_FILTER_XZ;
constant ARCHIVE_COMPRESSION_UU                           is export = ARCHIVE_FILTER_UU;
constant ARCHIVE_COMPRESSION_RPM                          is export = ARCHIVE_FILTER_RPM;
constant ARCHIVE_COMPRESSION_LZIP                         is export = ARCHIVE_FILTER_LZIP;
constant ARCHIVE_COMPRESSION_LRZIP                        is export = ARCHIVE_FILTER_LRZIP;
constant ARCHIVE_FORMAT_BASE_MASK                         is export = 0xff0000;
constant ARCHIVE_FORMAT_CPIO                              is export = 0x10000;
constant ARCHIVE_FORMAT_CPIO_POSIX                        is export = (ARCHIVE_FORMAT_CPIO +| 1);
constant ARCHIVE_FORMAT_CPIO_BIN_LE                       is export = (ARCHIVE_FORMAT_CPIO +| 2);
constant ARCHIVE_FORMAT_CPIO_BIN_BE                       is export = (ARCHIVE_FORMAT_CPIO +| 3);
constant ARCHIVE_FORMAT_CPIO_SVR4_NOCRC                   is export = (ARCHIVE_FORMAT_CPIO +| 4);
constant ARCHIVE_FORMAT_CPIO_SVR4_CRC                     is export = (ARCHIVE_FORMAT_CPIO +| 5);
constant ARCHIVE_FORMAT_CPIO_AFIO_LARGE                   is export = (ARCHIVE_FORMAT_CPIO +| 6);
constant ARCHIVE_FORMAT_SHAR                              is export = 0x20000;
constant ARCHIVE_FORMAT_SHAR_BASE                         is export = (ARCHIVE_FORMAT_SHAR +| 1);
constant ARCHIVE_FORMAT_SHAR_DUMP                         is export = (ARCHIVE_FORMAT_SHAR +| 2);
constant ARCHIVE_FORMAT_TAR                               is export = 0x30000;
constant ARCHIVE_FORMAT_TAR_USTAR                         is export = (ARCHIVE_FORMAT_TAR +| 1);
constant ARCHIVE_FORMAT_TAR_PAX_INTERCHANGE               is export = (ARCHIVE_FORMAT_TAR +| 2);
constant ARCHIVE_FORMAT_TAR_PAX_RESTRICTED                is export = (ARCHIVE_FORMAT_TAR +| 3);
constant ARCHIVE_FORMAT_TAR_GNUTAR                        is export = (ARCHIVE_FORMAT_TAR +| 4);
constant ARCHIVE_FORMAT_ISO9660                           is export = 0x40000;
constant ARCHIVE_FORMAT_ISO9660_ROCKRIDGE                 is export = (ARCHIVE_FORMAT_ISO9660 +| 1);
constant ARCHIVE_FORMAT_ZIP                               is export = 0x50000;
constant ARCHIVE_FORMAT_EMPTY                             is export = 0x60000;
constant ARCHIVE_FORMAT_AR                                is export = 0x70000;
constant ARCHIVE_FORMAT_AR_GNU                            is export = (ARCHIVE_FORMAT_AR +| 1);
constant ARCHIVE_FORMAT_AR_BSD                            is export = (ARCHIVE_FORMAT_AR +| 2);
constant ARCHIVE_FORMAT_MTREE                             is export = 0x80000;
constant ARCHIVE_FORMAT_RAW                               is export = 0x90000;
constant ARCHIVE_FORMAT_XAR                               is export = 0xA0000;
constant ARCHIVE_FORMAT_LHA                               is export = 0xB0000;
constant ARCHIVE_FORMAT_CAB                               is export = 0xC0000;
constant ARCHIVE_FORMAT_RAR                               is export = 0xD0000;
constant ARCHIVE_FORMAT_7ZIP                              is export = 0xE0000;
constant ARCHIVE_FORMAT_WARC                              is export = 0xF0000;
constant ARCHIVE_READ_FORMAT_CAPS_NONE                    is export = 0;
constant ARCHIVE_READ_FORMAT_CAPS_ENCRYPT_DATA            is export = 1;
constant ARCHIVE_READ_FORMAT_CAPS_ENCRYPT_METADATA        is export = 2;
constant ARCHIVE_READ_FORMAT_ENCRYPTION_UNSUPPORTED       is export = 0xFFFFFFFFE;
constant ARCHIVE_READ_FORMAT_ENCRYPTION_DONT_KNOW         is export = 0xFFFFFFFFF;
constant ARCHIVE_EXTRACT_OWNER                            is export = 0x0001;
constant ARCHIVE_EXTRACT_PERM                             is export = 0x0002;
constant ARCHIVE_EXTRACT_TIME                             is export = 0x0004;
constant ARCHIVE_EXTRACT_NO_OVERWRITE                     is export = 0x0008;
constant ARCHIVE_EXTRACT_UNLINK                           is export = 0x0010;
constant ARCHIVE_EXTRACT_ACL                              is export = 0x0020;
constant ARCHIVE_EXTRACT_FFLAGS                           is export = 0x0040;
constant ARCHIVE_EXTRACT_XATTR                            is export = 0x0080;
constant ARCHIVE_EXTRACT_SECURE_SYMLINKS                  is export = 0x0100;
constant ARCHIVE_EXTRACT_SECURE_NODOTDOT                  is export = 0x0200;
constant ARCHIVE_EXTRACT_NO_AUTODIR                       is export = 0x0400;
constant ARCHIVE_EXTRACT_NO_OVERWRITE_NEWER               is export = 0x0800;
constant ARCHIVE_EXTRACT_SPARSE                           is export = 0x1000;
constant ARCHIVE_EXTRACT_MAC_METADATA                     is export = 0x2000;
constant ARCHIVE_EXTRACT_NO_HFS_COMPRESSION               is export = 0x4000;
constant ARCHIVE_EXTRACT_HFS_COMPRESSION_FORCED           is export = 0x8000;
constant ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS           is export = 0x10000;
constant ARCHIVE_EXTRACT_CLEAR_NOCHANGE_FFLAGS            is export = 0x20000;
constant AE_IFMT                                          is export = 0o170000;
constant AE_IFREG                                         is export = 0o100000;
constant AE_IFLNK                                         is export = 0o120000;
constant AE_IFSOCK                                        is export = 0o140000;
constant AE_IFCHR                                         is export = 0o020000;
constant AE_IFBLK                                         is export = 0o060000;
constant AE_IFDIR                                         is export = 0o040000;
constant AE_IFIFO                                         is export = 0o010000;

class archive       is repr('CPointer') is export { * } # libarchive private struct
class archive_entry is repr('CPointer') is export { * } # libarchive private struct

sub archive_version_number(--> int64) is native(LIB) is export { * }
sub archive_version_string(--> Str) is native(LIB) is export { * }
sub archive_version_details(--> Str) is native(LIB) is export { * }
sub archive_zlib_version(--> Str) is native(LIB) is export { * }
sub archive_liblzma_version(--> Str) is native(LIB) is export { * }
sub archive_bzlib_version(--> Str) is native(LIB) is export { * }
sub archive_liblz4_version(--> Str) is native(LIB) is export { * }

sub archive_read_new(--> archive) is native(LIB) is export { * }

sub archive_error_string(archive $archive --> Str) is native(LIB) is export { * }
sub archive_errno(archive $archive --> int64) is native(LIB) is export { * }
sub archive_clear_error(archive $archive) is native(LIB) is export { * }

sub archive_read_support_filter_all(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_bzip2(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_compress(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_gzip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_grzip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_lrzip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_lz4(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_lzip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_lzma(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_lzop(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_none(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_rpm(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_uu(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_xz(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_program(archive $archive, Str $command --> int64) is native(LIB) is export { * }
sub archive_read_support_filter_program_signature(archive $archive, Str $cmd, Buf $match, size_t $length --> int64)
  is native(LIB) is export { * }
sub archive_read_append_filter(archive $archive, int64 $filter --> int64) is native(LIB) is export { * }
sub archive_read_append_filter_program(archive $archive, Str $prg --> int64) is native(LIB) is export { * }
sub archive_read_append_filter_program_signature(archive $archive, Str $cmd, Buf $match, size_t $length --> int64)
  is native(LIB) is export { * }

sub archive_read_support_format_all(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_7zip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_ar(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_by_code(archive $archive, int64 $code --> int64) is native(LIB) is export { * }
sub archive_read_support_format_cab(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_cpio(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_empty(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_gnutar(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_iso9660(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_lha(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_mtree(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_rar(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_raw(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_tar(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_warc(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_xar(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_zip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_zip_streamable(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_support_format_zip_seekable(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_set_format(archive $archive, int64 $format --> int64) is native(LIB) is export { * }
sub archive_format_name(archive $archive --> Str) is native(LIB) is export { * }
sub archive_format(archive $archive --> int64) is native(LIB) is export { * }

sub archive_read_open_filename(archive $archive, Str $filename, size_t $block-size --> int64) is native(LIB) is export { * }
sub archive_read_open_memory(archive $archive, Buf $data, size_t $size --> int64) is native(LIB) is export { * }
sub archive_read_next_header(archive $archive, archive_entry $entry is rw --> int64) is native(LIB) is export { * }
sub archive_read_data_skip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_file_count(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_finish(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_free(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_close(archive $archive --> int64) is native(LIB) is export { * }
sub archive_read_data_block(archive $archive, Pointer[void] $buff is rw, size_t $size is rw, int64 $offset is rw --> int64)
  is native(LIB) is export { * }

sub archive_write_new(--> archive) is native(LIB) is export { * }
sub archive_write_disk_new(--> archive) is native(LIB) is export { * }
sub archive_write_disk_set_options(archive $archive, int64 $flags --> int64) is native(LIB) is export { * }
sub archive_write_disk_set_standard_lookup(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_header(archive $archive, archive_entry $entry --> int64) is native(LIB) is export { * }
sub archive_write_close(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_free(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_data(archive $archive, Buf $data, size_t $size --> size_t) is native(LIB) is export { * }
sub archive_write_data_block(archive $archive, Pointer[void] $buff, size_t $size, int64 $offset --> int64)
  is native(LIB) is export { * }
sub archive_write_finish_entry(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_fail(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_open_fd(archive $archive, int64 $_fd --> int64) is native(LIB) is export { * }
sub archive_write_open_filename(archive $archive, Str $_file --> int64) is native(LIB) is export { * }
sub archive_write_open_filename_w(archive $archive, Str $_file --> int64) is native(LIB) is export { * }
sub archive_write_open_memory(archive $archive, Pointer[void] $_buffer, size_t $_buffSize, size_t $_used is rw --> int64)
  is native(LIB) is export { * }

sub archive_write_add_filter(archive $archive, int64 $filter_code --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_by_name(archive $archive, Str $name --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_b64encode(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_bzip2(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_compress(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_grzip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_gzip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_lrzip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_lz4(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_lzip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_lzma(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_lzop(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_none(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_program(archive $archive, Str $cmd --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_uuencode(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_add_filter_xz(archive $archive --> int64) is native(LIB) is export { * }

sub archive_write_set_format(archive $archive, int64 $format_code --> int64) is native(LIB) is export { * }
sub archive_write_set_format_by_name(archive $archive, Str $name --> int64) is native(LIB) is export { * }
sub archive_write_set_format_7zip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_ar_bsd(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_ar_svr4(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_cpio(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_cpio_newc(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_gnutar(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_iso9660(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_mtree(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_mtree_classic(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_pax(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_pax_restricted(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_raw(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_shar(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_shar_dump(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_ustar(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_v7tar(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_warc(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_xar(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_zip(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_set_format_filter_by_ext(archive $archive, Str $filename --> int64) is native(LIB) is export { * }
sub archive_write_set_format_filter_by_ext_def(archive $archive, Str $filename, Str $def_ext --> int64)
  is native(LIB) is export { * }

sub archive_write_zip_set_compression_deflate(archive $archive --> int64) is native(LIB) is export { * }
sub archive_write_zip_set_compression_store(archive $archive --> int64) is native(LIB) is export { * }

sub archive_entry_new(--> archive_entry) is native(LIB) is export { * }

sub archive_entry_pathname(archive_entry $archive_entry --> Str) is native(LIB) is export { * }
sub archive_entry_size(archive_entry $archive_entry --> int64) is native(LIB) is export { * }
sub archive_entry_set_atime(archive_entry $archive_entry, int64, int64) is native(LIB) is export { * }
sub archive_entry_unset_atime(archive_entry $archive_entry) is native(LIB) is export { * }
sub archive_entry_set_birthtime(archive_entry $archive_entry, int64, int64) is native(LIB) is export { * }
sub archive_entry_unset_birthtime(archive_entry $archive_entry) is native(LIB) is export { * }
sub archive_entry_set_ctime(archive_entry $archive_entry, int64, int64) is native(LIB) is export { * }
sub archive_entry_unset_ctime(archive_entry $archive_entry) is native(LIB) is export { * }
sub archive_entry_set_dev(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_devmajor(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_devminor(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_filetype(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_fflags(archive_entry $archive_entry, int64, int64) is native(LIB) is export { * }
sub archive_entry_copy_fflags_text(archive_entry $archive_entry, Str --> Str) is native(LIB) is export { * }
sub archive_entry_copy_fflags_text_w(archive_entry $archive_entry, Str --> Str) is native(LIB) is export { * }
sub archive_entry_set_gid(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_gname(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_set_gname_utf8(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_gname(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_gname_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_update_gname_utf8(archive_entry $archive_entry, Str --> int64) is native(LIB) is export { * }
sub archive_entry_set_hardlink(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_set_hardlink_utf8(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_hardlink(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_hardlink_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_update_hardlink_utf8(archive_entry $archive_entry, Str --> int64) is native(LIB) is export { * }
sub archive_entry_set_ino(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_ino64(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_link(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_set_link_utf8(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_link(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_link_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_update_link_utf8(archive_entry $archive_entry, Str --> int64) is native(LIB) is export { * }
sub archive_entry_set_mode(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_mtime(archive_entry $archive_entry, int64, int64) is native(LIB) is export { * }
sub archive_entry_unset_mtime(archive_entry $archive_entry) is native(LIB) is export { * }
sub archive_entry_set_nlink(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_pathname(archive_entry $archive_entry, Str $filename) is native(LIB) is export { * }
sub archive_entry_set_pathname_utf8(archive_entry $archive_entry, Str $filename) is native(LIB) is export { * }
sub archive_entry_copy_pathname(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_pathname_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_update_pathname_utf8(archive_entry $archive_entry, Str --> int64) is native(LIB) is export { * }
sub archive_entry_set_perm(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_rdev(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_rdevmajor(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_rdevminor(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_size(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_unset_size(archive_entry $archive_entry) is native(LIB) is export { * }
sub archive_entry_copy_sourcepath(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_sourcepath_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_set_symlink(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_set_symlink_utf8(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_symlink(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_symlink_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_update_symlink_utf8(archive_entry $archive_entry, Str --> int64) is native(LIB) is export { * }
sub archive_entry_set_uid(archive_entry $archive_entry, int64) is native(LIB) is export { * }
sub archive_entry_set_uname(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_set_uname_utf8(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_uname(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_copy_uname_w(archive_entry $archive_entry, Str) is native(LIB) is export { * }
sub archive_entry_update_uname_utf8(archive_entry $archive_entry, Str --> int64) is native(LIB) is export { * }
sub archive_entry_set_is_data_encrypted(archive_entry $archive_entry, int8 $is_encrypted) is native(LIB) is export { * }
sub archive_entry_set_is_metadata_encrypted(archive_entry $archive_entry, int8 $is_encrypted) is native(LIB) is export { * }
sub archive_entry_copy_mac_metadata(archive_entry $archive_entry, Pointer[void], size_t) is native(LIB) is export { * }
sub archive_entry_free(archive_entry $archive_entry) is native(LIB) is export { * }

=begin pod

=head1 NAME

Archive::Libarchive::Raw - A simple interface to libarchive

=head1 SYNOPSIS
=begin code

use v6;

use Archive::Libarchive::Raw;

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

The module looks for a library called libarchive.so, or whatever it finds in
the environment variable B<PERL6_LIBARCHIVE_LIB> (provided that the library one
chooses uses the same API).

=head1 Installation

To install it using Panda (a module management tool):

=begin code
$ panda update
$ panda install Archive::Libarchive::Raw
=end code

To install it using zef (a module management tool):

=begin code
$ zef update
$ zef install Archive::Libarchive::Raw
=end code

=head1 Testing

To run the tests:

=begin code
$ prove -e "perl6 -Ilib"
=end code

or

=begin code
$ prove6
=end code

=head1 Author

Fernando Santagata

=head1 License

The Artistic License 2.0

=end pod
