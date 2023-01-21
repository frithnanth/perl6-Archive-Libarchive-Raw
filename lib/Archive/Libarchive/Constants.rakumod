use v6;

unit module Archive::Libarchive::Constants:ver<0.1.3>:auth<zef:FRITH>;

constant ARCHIVE_OK                                       is export = 0;
constant ARCHIVE_EOF                                      is export = 1;
constant ARCHIVE_RETRY                                    is export = -10;
constant ARCHIVE_WARN                                     is export = -20;
constant ARCHIVE_FAILED                                   is export = -25;
constant ARCHIVE_FATAL                                    is export = -30;
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

