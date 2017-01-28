
use v6.*;

use NativeCall;

class Archive::LibArchive {

    constant LIB = [ 'archive', v13 ];

    class Archive is repr('CPointer') {
        sub archive_read_new() is native(LIB) returns Archive { * }

        multi method new() returns Archive {
            archive_read_new();
        }
    }
    class ArchiveEntry is repr('CPointer') {
    }


# == /usr/include/archive.h ==

#-From /usr/include/archive.h:153
# * the library version (which may not be the same if you're using a
# * dynamically-linked version of the library).  Of course, if the
# * header and library are very different, you should expect some
# * strangeness.  Don't do that.
# */
#__LA_DECL int		archive_version_number(void);
    sub archive_version_number() is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:160
#/*
# * Textual name/version of the library, useful for version displays.
# */
##define	ARCHIVE_VERSION_ONLY_STRING "3.2.2"
##define	ARCHIVE_VERSION_STRING "libarchive " ARCHIVE_VERSION_ONLY_STRING
#__LA_DECL const char *	archive_version_string(void);
    sub archive_version_string() is native(LIB) returns Str { * }

#-From /usr/include/archive.h:169
#/*
# * Detailed textual name/version of the library and its dependencies.
# * This has the form:
# *    "libarchive x.y.z zlib/a.b.c liblzma/d.e.f ... etc ..."
# * the list of libraries described here will vary depending on how
# * libarchive was compiled.
# */
#__LA_DECL const char *	archive_version_details(void);
    sub archive_version_details() is native(LIB) returns Str { * }

#-From /usr/include/archive.h:176
#/*
# * Returns NULL if libarchive was compiled without the associated library.
# * Otherwise, returns the version number that libarchive was compiled
# * against.
# */
#__LA_DECL const char *  archive_zlib_version(void);
    sub archive_zlib_version() is native(LIB) returns Str { * }

#-From /usr/include/archive.h:177
#__LA_DECL const char *  archive_liblzma_version(void);
    sub archive_liblzma_version() is native(LIB) returns Str { * }

#-From /usr/include/archive.h:178
#__LA_DECL const char *  archive_bzlib_version(void);
    sub archive_bzlib_version() is native(LIB) returns Str { * }

#-From /usr/include/archive.h:179
#__LA_DECL const char *  archive_liblz4_version(void);
    sub archive_liblz4_version() is native(LIB) returns Str { * }

#-From /usr/include/archive.h:378
#/*-
# * Basic outline for reading an archive:
# *   1) Ask archive_read_new for an archive reader object.
# *   2) Update any global properties as appropriate.
# *      In particular, you'll certainly want to call appropriate
# *      archive_read_support_XXX functions.
# *   3) Call archive_read_open_XXX to open the archive
# *   4) Repeatedly call archive_read_next_header to get information about
# *      successive archive entries.  Call archive_read_data to extract
# *      data for entries of interest.
# *   5) Call archive_read_finish to end processing.
# */
#__LA_DECL struct archive	*archive_read_new(void);

#-From /usr/include/archive.h:389
##if ARCHIVE_VERSION_NUMBER < 4000000
#__LA_DECL int archive_read_support_compression_all(struct archive *)
    sub archive_read_support_compression_all(Archive)  is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:391
#__LA_DECL int archive_read_support_compression_bzip2(struct archive *)
    sub archive_read_support_compression_bzip2(Archive) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:393
#__LA_DECL int archive_read_support_compression_compress(struct archive *)
    sub archive_read_support_compression_compress(Archive) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:395
#__LA_DECL int archive_read_support_compression_gzip(struct archive *)
    sub archive_read_support_compression_gzip(Archive) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:397
#__LA_DECL int archive_read_support_compression_lzip(struct archive *)
    sub archive_read_support_compression_lzip(Archive) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:399
#__LA_DECL int archive_read_support_compression_lzma(struct archive *)
    sub archive_read_support_compression_lzma(Archive) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:401
#__LA_DECL int archive_read_support_compression_none(struct archive *)
    sub archive_read_support_compression_none(Archive) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:403
#__LA_DECL int archive_read_support_compression_program(struct archive *,
sub archive_read_support_compression_program(Archive, Str $command ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:405
#__LA_DECL int archive_read_support_compression_program_signature
sub archive_read_support_compression_program_signature(Archive                        # archive*
                                                      ,Str                            # const char*
                                                      ,Pointer                        # const void*
                                                      ,size_t                         # Typedef<size_t>->|long unsigned int|
                                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:409
#__LA_DECL int archive_read_support_compression_rpm(struct archive *)
sub archive_read_support_compression_rpm(Archive
                                         ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:411
#__LA_DECL int archive_read_support_compression_uu(struct archive *)
sub archive_read_support_compression_uu(Archive
                                        ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:413
#__LA_DECL int archive_read_support_compression_xz(struct archive *)
sub archive_read_support_compression_xz(Archive
                                        ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:417
#__LA_DECL int archive_read_support_filter_all(struct archive *);
sub archive_read_support_filter_all(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:418
#__LA_DECL int archive_read_support_filter_bzip2(struct archive *);
sub archive_read_support_filter_bzip2(Archive
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:419
#__LA_DECL int archive_read_support_filter_compress(struct archive *);
sub archive_read_support_filter_compress(Archive
                                         ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:420
#__LA_DECL int archive_read_support_filter_gzip(struct archive *);
sub archive_read_support_filter_gzip(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:421
#__LA_DECL int archive_read_support_filter_grzip(struct archive *);
sub archive_read_support_filter_grzip(Archive
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:422
#__LA_DECL int archive_read_support_filter_lrzip(struct archive *);
sub archive_read_support_filter_lrzip(Archive
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:423
#__LA_DECL int archive_read_support_filter_lz4(struct archive *);
sub archive_read_support_filter_lz4(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:424
#__LA_DECL int archive_read_support_filter_lzip(struct archive *);
sub archive_read_support_filter_lzip(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:425
#__LA_DECL int archive_read_support_filter_lzma(struct archive *);
sub archive_read_support_filter_lzma(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:426
#__LA_DECL int archive_read_support_filter_lzop(struct archive *);
sub archive_read_support_filter_lzop(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:427
#__LA_DECL int archive_read_support_filter_none(struct archive *);
sub archive_read_support_filter_none(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:428
#__LA_DECL int archive_read_support_filter_program(struct archive *,
sub archive_read_support_filter_program(Archive, Str $command) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:430
#__LA_DECL int archive_read_support_filter_program_signature
sub archive_read_support_filter_program_signature(Archive                        # archive*
                                                 ,Str                            # const char*
                                                 ,Pointer                        # const void*
                                                 ,size_t                         # Typedef<size_t>->|long unsigned int|
                                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:433
#__LA_DECL int archive_read_support_filter_rpm(struct archive *);
sub archive_read_support_filter_rpm(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:434
#__LA_DECL int archive_read_support_filter_uu(struct archive *);
sub archive_read_support_filter_uu(Archive
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:435
#__LA_DECL int archive_read_support_filter_xz(struct archive *);
sub archive_read_support_filter_xz(Archive
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:437
#__LA_DECL int archive_read_support_format_7zip(struct archive *);
sub archive_read_support_format_7zip(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:438
#__LA_DECL int archive_read_support_format_all(struct archive *);
sub archive_read_support_format_all(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:439
#__LA_DECL int archive_read_support_format_ar(struct archive *);
sub archive_read_support_format_ar(Archive
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:440
#__LA_DECL int archive_read_support_format_by_code(struct archive *, int);
sub archive_read_support_format_by_code(Archive, int32) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:441
#__LA_DECL int archive_read_support_format_cab(struct archive *);
sub archive_read_support_format_cab(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:442
#__LA_DECL int archive_read_support_format_cpio(struct archive *);
sub archive_read_support_format_cpio(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:443
#__LA_DECL int archive_read_support_format_empty(struct archive *);
sub archive_read_support_format_empty(Archive
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:444
#__LA_DECL int archive_read_support_format_gnutar(struct archive *);
sub archive_read_support_format_gnutar(Archive
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:445
#__LA_DECL int archive_read_support_format_iso9660(struct archive *);
sub archive_read_support_format_iso9660(Archive
                                        ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:446
#__LA_DECL int archive_read_support_format_lha(struct archive *);
sub archive_read_support_format_lha(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:447
#__LA_DECL int archive_read_support_format_mtree(struct archive *);
sub archive_read_support_format_mtree(Archive
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:448
#__LA_DECL int archive_read_support_format_rar(struct archive *);
sub archive_read_support_format_rar(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:449
#__LA_DECL int archive_read_support_format_raw(struct archive *);
sub archive_read_support_format_raw(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:450
#__LA_DECL int archive_read_support_format_tar(struct archive *);
sub archive_read_support_format_tar(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:451
#__LA_DECL int archive_read_support_format_warc(struct archive *);
sub archive_read_support_format_warc(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:452
#__LA_DECL int archive_read_support_format_xar(struct archive *);
sub archive_read_support_format_xar(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:455
#/* archive_read_support_format_zip() enables both streamable and seekable
# * zip readers. */
#__LA_DECL int archive_read_support_format_zip(struct archive *);
sub archive_read_support_format_zip(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:459
#/* Reads Zip archives as stream from beginning to end.  Doesn't
# * correctly handle SFX ZIP files or ZIP archives that have been modified
# * in-place. */
#__LA_DECL int archive_read_support_format_zip_streamable(struct archive *);
sub archive_read_support_format_zip_streamable(Archive
                                               ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:461
#__LA_DECL int archive_read_support_format_zip_seekable(struct archive *);
sub archive_read_support_format_zip_seekable(Archive
                                             ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:467
#/* Functions to manually set the format and filters to be used. This is
# * useful to bypass the bidding process when the format and filters to use
# * is known in advance.
# */
#__LA_DECL int archive_read_set_format(struct archive *, int);
sub archive_read_set_format(Archive, int32) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:468
#__LA_DECL int archive_read_append_filter(struct archive *, int);
sub archive_read_append_filter(Archive, int32) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:469
#__LA_DECL int archive_read_append_filter_program(struct archive *,
sub archive_read_append_filter_program(Archive, Str) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:471
#__LA_DECL int archive_read_append_filter_program_signature
sub archive_read_append_filter_program_signature(Archive
                                                ,Str                            # const char*
                                                ,Pointer                        # const void*
                                                ,size_t                         # Typedef<size_t>->|long unsigned int|
                                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:475
#/* Set various callbacks. */
#__LA_DECL int archive_read_set_open_callback(struct archive *,
sub archive_read_set_open_callback(Archive
                                  ,&callback ( Archive, Pointer) 
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:477
#__LA_DECL int archive_read_set_read_callback(struct archive *,
sub archive_read_set_read_callback(Archive
                                  , &callback # Pointer[NYI(F:Typedef<la_ssize_t>->|Typedef<ssize_t>->|Typedef<ssize_t>->|long int||| ( archive*, void*, const void**))] # Typedef<archive_read_callback>->|F:Typedef<la_ssize_t>->|Typedef<ssize_t>->|Typedef<ssize_t>->|long int||| ( archive*, void*, const void**)|*
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:479
#__LA_DECL int archive_read_set_seek_callback(struct archive *,
sub archive_read_set_seek_callback(Archive
                                  , &callback # Pointer[NYI(F:Typedef<la_int64>->|Typedef<int64>->|long int|| ( archive*, void*, Typedef<la_int64>->|Typedef<int64>->|long int||, int))] # Typedef<archive_seek_callback>->|F:Typedef<la_int64>->|Typedef<int64>->|long int|| ( archive*, void*, Typedef<la_int64>->|Typedef<int64>->|long int||, int)|*
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:481
#__LA_DECL int archive_read_set_skip_callback(struct archive *,
sub archive_read_set_skip_callback(Archive
                                  , &callback # Pointer[NYI(F:Typedef<la_int64>->|Typedef<int64>->|long int|| ( archive*, void*, Typedef<la_int64>->|Typedef<int64>->|long int||))] # Typedef<archive_skip_callback>->|F:Typedef<la_int64>->|Typedef<int64>->|long int|| ( archive*, void*, Typedef<la_int64>->|Typedef<int64>->|long int||)|*
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:483
#__LA_DECL int archive_read_set_close_callback(struct archive *,
sub archive_read_set_close_callback(Archive
                                   , &callback # Pointer[NYI(F:int ( archive*, void*))] # Typedef<archive_close_callback>->|F:int ( archive*, void*)|*
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:486
#/* Callback used to switch between one data object to the next */
#__LA_DECL int archive_read_set_switch_callback(struct archive *,
sub archive_read_set_switch_callback(Archive
                                    ,&callback #Pointer[NYI(F:int ( archive*, void*, void*))] # Typedef<archive_switch_callback>->|F:int ( archive*, void*, void*)|*
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:490
#/* This sets the first data object. */
#__LA_DECL int archive_read_set_callback_data(struct archive *, void *);
sub archive_read_set_callback_data(Archive
                                  ,Pointer                        # void*
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:492
#/* This sets data object at specified index */
#__LA_DECL int archive_read_set_callback_data2(struct archive *, void *,
sub archive_read_set_callback_data2(Archive
                                   ,Pointer                        # void*
                                   ,uint32                         # unsigned int
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:495
#/* This adds a data object at the specified index. */
#__LA_DECL int archive_read_add_callback_data(struct archive *, void *,
sub archive_read_add_callback_data(Archive
                                  ,Pointer                        # void*
                                  ,uint32                         # unsigned int
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:498
#/* This appends a data object to the end of list */
#__LA_DECL int archive_read_append_callback_data(struct archive *, void *);
sub archive_read_append_callback_data(Archive
                                     ,Pointer                        # void*
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:500
#/* This prepends a data object to the beginning of list */
#__LA_DECL int archive_read_prepend_callback_data(struct archive *, void *);
sub archive_read_prepend_callback_data(Archive
                                      ,Pointer                        # void*
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:503
#/* Opening freezes the callbacks. */
#__LA_DECL int archive_read_open1(struct archive *);
sub archive_read_open1(Archive
                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:506
#/* Convenience wrappers around the above. */
#__LA_DECL int archive_read_open(struct archive *, void *_client_data,
sub archive_read_open(Archive
                     ,Pointer                       $_client_data # void*
                     ,&open_callback #Pointer[NYI(F:int ( archive*, void*))] # Typedef<archive_open_callback>->|F:int ( archive*, void*)|*
                     ,&read_callback #Pointer[NYI(F:Typedef<la_ssize_t>->|Typedef<ssize_t>->|Typedef<ssize_t>->|long int||| ( archive*, void*, const void**))] # Typedef<archive_read_callback>->|F:Typedef<la_ssize_t>->|Typedef<ssize_t>->|Typedef<ssize_t>->|long int||| ( archive*, void*, const void**)|*
                     ,&close_callback # Pointer[NYI(F:int ( archive*, void*))] # Typedef<archive_close_callback>->|F:int ( archive*, void*)|*
                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:509
#__LA_DECL int archive_read_open2(struct archive *, void *_client_data,
sub archive_read_open2(Archive
                      ,Pointer                       $_client_data # void*
                      ,&open_callback # Pointer[NYI(F:int ( archive*, void*))] # Typedef<archive_open_callback>->|F:int ( archive*, void*)|*
                      ,&read_callback # Pointer[NYI(F:Typedef<la_ssize_t>->|Typedef<ssize_t>->|Typedef<ssize_t>->|long int||| ( archive*, void*, const void**))] # Typedef<archive_read_callback>->|F:Typedef<la_ssize_t>->|Typedef<ssize_t>->|Typedef<ssize_t>->|long int||| ( archive*, void*, const void**)|*
                      ,&skip_callback # Pointer[NYI(F:Typedef<la_int64>->|Typedef<int64>->|long int|| ( archive*, void*, Typedef<la_int64>->|Typedef<int64>->|long int||))] # Typedef<archive_skip_callback>->|F:Typedef<la_int64>->|Typedef<int64>->|long int|| ( archive*, void*, Typedef<la_int64>->|Typedef<int64>->|long int||)|*
                      ,&close_callback #Pointer[NYI(F:int ( archive*, void*))] # Typedef<archive_close_callback>->|F:int ( archive*, void*)|*
                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:519
#/*
# * A variety of shortcuts that invoke archive_read_open() with
# * canned callbacks suitable for common situations.  The ones that
# * accept a block size handle tape blocking correctly.
# */
#/* Use this if you know the filename.  Note: NULL indicates stdin. */
#__LA_DECL int archive_read_open_filename(struct archive *,
sub archive_read_open_filename(Archive
                              ,Str                           $_filename # const char*
                              ,size_t                        $_block_size # Typedef<size_t>->|long unsigned int|
                               ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:523
#/* Use this for reading multivolume files by filenames.
# * NOTE: Must be NULL terminated. Sorting is NOT done. */
#__LA_DECL int archive_read_open_filenames(struct archive *,
sub archive_read_open_filenames(Archive
                               ,Pointer[Str]                  $_filenames # const char**
                               ,size_t                        $_block_size # Typedef<size_t>->|long unsigned int|
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:525
#__LA_DECL int archive_read_open_filename_w(struct archive *,
sub archive_read_open_filename_w(Archive
                                ,Str              $_filename # const Typedef<wchar_t>->|int|*
                                ,size_t                        $_block_size # Typedef<size_t>->|long unsigned int|
                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:528
#/* archive_read_open_file() is a deprecated synonym for ..._open_filename(). */
#__LA_DECL int archive_read_open_file(struct archive *,
sub archive_read_open_file(Archive
                          ,Str                           $_filename # const char*
                          ,size_t                        $_block_size # Typedef<size_t>->|long unsigned int|
                           ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:531
#/* Read an archive that's stored in memory. */
#__LA_DECL int archive_read_open_memory(struct archive *,
sub archive_read_open_memory(Archive
                            ,Pointer                       $buff # const void*
                            ,size_t                        $size # Typedef<size_t>->|long unsigned int|
                             ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:534
#/* A more involved version that is only used for internal testing. */
#__LA_DECL int archive_read_open_memory2(struct archive *a, const void *buff,
sub archive_read_open_memory2(Archive                       $a # archive*
                             ,Pointer                       $buff # const void*
                             ,size_t                        $size # Typedef<size_t>->|long unsigned int|
                             ,size_t                        $read_size # Typedef<size_t>->|long unsigned int|
                              ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:537
#/* Read an archive that's already open, using the file descriptor. */
#__LA_DECL int archive_read_open_fd(struct archive *, int _fd,
sub archive_read_open_fd(Archive
                        ,int32                         $_fd # int
                        ,size_t                        $_block_size # Typedef<size_t>->|long unsigned int|
                         ) is native(LIB) returns int32 { * }

=begin NYI
#-From /usr/include/archive.h:541
#/* Read an archive that's already open, using a FILE *. */
#/* Note: DO NOT use this with tape drives. */
#__LA_DECL int archive_read_open_FILE(struct archive *, FILE *_file);
sub archive_read_open_FILE(Archive
                          ,FILE                          $_file # Typedef<FILE>->|FILE|*
                           ) is native(LIB) returns int32 { * }
=end NYI

#-From /usr/include/archive.h:544
#/* Parses and returns next entry header. */
#__LA_DECL int archive_read_next_header(struct archive *,
sub archive_read_next_header(Archive
                            ,Pointer[ArchiveEntry]         # archive_entry**
                             ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:548
#/* Parses and returns next entry header using the archive_entry passed in */
#__LA_DECL int archive_read_next_header2(struct archive *,
sub archive_read_next_header2(Archive
                             ,ArchiveEntry                  # archive_entry*
                              ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:555
#/*
# * Retrieve the byte offset in UNCOMPRESSED data where last-read
# * header started.
# */
#__LA_DECL la_int64		 archive_read_header_position(struct archive *);
sub archive_read_header_position(Archive
                                 ) is native(LIB) returns int64 { * }

#-From /usr/include/archive.h:575
#/*
# * Returns 1 if the archive contains at least one encrypted entry.
# * If the archive format not support encryption at all
# * ARCHIVE_READ_FORMAT_ENCRYPTION_UNSUPPORTED is returned.
# * If for any other reason (e.g. not enough data read so far)
# * we cannot say whether there are encrypted entries, then
# * ARCHIVE_READ_FORMAT_ENCRYPTION_DONT_KNOW is returned.
# * In general, this function will return values below zero when the
# * reader is uncertain or totally uncapable of encryption support.
# * When this function returns 0 you can be sure that the reader
# * supports encryption detection but no encrypted entries have
# * been found yet.
# *
# * NOTE: If the metadata/header of an archive is also encrypted, you
# * cannot rely on the number of encrypted entries. That is why this
# * function does not return the number of encrypted entries but#
# * just shows that there are some.
# */
#__LA_DECL int	archive_read_has_encrypted_entries(struct archive *);
sub archive_read_has_encrypted_entries(Archive
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:581
#/*
# * Returns a bitmask of capabilities that are supported by the archive format reader.
# * If the reader has no special capabilities, ARCHIVE_READ_FORMAT_CAPS_NONE is returned.
# */
#__LA_DECL int		 archive_read_format_capabilities(struct archive *);
sub archive_read_format_capabilities(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:584
#/* Read data from the body of an entry.  Similar to read(2). */
#__LA_DECL la_ssize_t		 archive_read_data(struct archive *,
sub archive_read_data(Archive
                     ,Pointer                        # void*
                     ,size_t                         # Typedef<size_t>->|long unsigned int|
                      ) is native(LIB) returns ssize_t { * }

#-From /usr/include/archive.h:588
#/* Seek within the body of an entry.  Similar to lseek(2). */
#__LA_DECL la_int64 archive_seek_data(struct archive *, la_int64, int);
sub archive_seek_data(Archive
                     ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                     ,int32                          # int
                      ) is native(LIB) returns int64 { * }

#-From /usr/include/archive.h:596
#/*
# * A zero-copy version of archive_read_data that also exposes the file offset
# * of each returned block.  Note that the client has no way to specify
# * the desired size of the block.  The API does guarantee that offsets will
# * be strictly increasing and that returned blocks will not overlap.
# */
#__LA_DECL int archive_read_data_block(struct archive *a,
sub archive_read_data_block(Archive                       $a # archive*
                           ,Pointer[Pointer]              $buff # const void**
                           ,Pointer[size_t]               $size # Typedef<size_t>->|long unsigned int|*
                           ,Pointer[int64]              $offset # Typedef<la_int64>->|Typedef<int64>->|long int||*
                            ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:605
#/*-
# * Some convenience functions that are built on archive_read_data:
# *  'skip': skips entire entry
# *  'into_buffer': writes data into memory buffer that you provide
# *  'into_fd': writes data to specified filedes
# */
#__LA_DECL int archive_read_data_skip(struct archive *);
sub archive_read_data_skip(Archive
                           ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:606
#__LA_DECL int archive_read_data_into_fd(struct archive *, int fd);
sub archive_read_data_into_fd(Archive
                             ,int32                         $fd # int
                              ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:612
#/*
# * Set read options.
# */
#/* Apply option to the format only. */
#__LA_DECL int archive_read_set_format_option(struct archive *_a,
sub archive_read_set_format_option(Archive                       $_a # archive*
                                  ,Str                           $m # const char*
                                  ,Str                           $o # const char*
                                  ,Str                           $v # const char*
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:616
#/* Apply option to the filter only. */
#__LA_DECL int archive_read_set_filter_option(struct archive *_a,
sub archive_read_set_filter_option(Archive                       $_a # archive*
                                  ,Str                           $m # const char*
                                  ,Str                           $o # const char*
                                  ,Str                           $v # const char*
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:620
#/* Apply option to both the format and the filter. */
#__LA_DECL int archive_read_set_option(struct archive *_a,
sub archive_read_set_option(Archive                       $_a # archive*
                           ,Str                           $m # const char*
                           ,Str                           $o # const char*
                           ,Str                           $v # const char*
                            ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:624
#/* Apply option string to both the format and the filter. */
#__LA_DECL int archive_read_set_options(struct archive *_a,
sub archive_read_set_options(Archive                       $_a # archive*
                            ,Str                           $opts # const char*
                             ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:630
#/*
# * Add a decryption passphrase.
# */
#__LA_DECL int archive_read_add_passphrase(struct archive *, const char *);
sub archive_read_add_passphrase(Archive
                               ,Str                            # const char*
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:631
#__LA_DECL int archive_read_set_passphrase_callback(struct archive *,
sub archive_read_set_passphrase_callback(Archive
                                        ,Pointer                       $client_data # void*
                                        ,&callback # Pointer[NYI(F:const char* ( archive*, void*))] # Typedef<archive_passphrase_callback>->|F:const char* ( archive*, void*)|*
                                         ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:692
#__LA_DECL int archive_read_extract(struct archive *, struct archive_entry *,
sub archive_read_extract(Archive
                        ,ArchiveEntry                  # archive_entry*
                        ,int32                         $flags # int
                         ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:694
#__LA_DECL int archive_read_extract2(struct archive *, struct archive_entry *,
sub archive_read_extract2(Archive
                         ,ArchiveEntry                  # archive_entry*
                         ,Archive
                          ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:696
#__LA_DECL void	 archive_read_extract_set_progress_callback(struct archive *,
sub archive_read_extract_set_progress_callback(Archive
                                              ,&_progress_func (Pointer) # F:void ( void*)*
                                              ,Pointer                       $_user_data # void*
                                               ) is native(LIB)  { * }

#-From /usr/include/archive.h:701
#/* Record the dev/ino of a file that will not be written.  This is
# * generally set to the dev/ino of the archive being read. */
#__LA_DECL void		archive_read_extract_set_skip_file(struct archive *,
sub archive_read_extract_set_skip_file(Archive
                                      ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                                      ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                                       ) is native(LIB)  { * }

#-From /usr/include/archive.h:705
#/* Close the file and release most resources. */
#__LA_DECL int		 archive_read_close(struct archive *);
sub archive_read_close(Archive
                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:708
#/* Release all resources and destroy the object. */
#/* Note that archive_read_free will call archive_read_close for you. */
#__LA_DECL int		 archive_read_free(struct archive *);
sub archive_read_free(Archive
                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:711
##if ARCHIVE_VERSION_NUMBER < 4000000
#/* Synonym for archive_read_free() for backwards compatibility. */
#__LA_DECL int		 archive_read_finish(struct archive *) __LA_DEPRECATED;
sub archive_read_finish(Archive
                        ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:729
#/*-
# * To create an archive:
# *   1) Ask archive_write_new for an archive writer object.
# *   2) Set any global properties.  In particular, you should set
# *      the compression and format to use.
# *   3) Call archive_write_open to open the file (most people
# *       will use archive_write_open_file or archive_write_open_fd,
# *       which provide convenient canned I/O callbacks for you).
# *   4) For each entry:
# *      - construct an appropriate struct archive_entry structure
# *      - archive_write_header to write the header
# *      - archive_write_data to write the entry data
# *   5) archive_write_close to close the output
# *   6) archive_write_free to cleanup the writer and release resources
# */
#__LA_DECL struct archive	*archive_write_new(void);
sub archive_write_new(
                      ) is native(LIB) returns Archive { * }

#-From /usr/include/archive.h:730
#__LA_DECL int archive_write_set_bytes_per_block(struct archive *,
sub archive_write_set_bytes_per_block(Archive
                                     ,int32                         $bytes_per_block # int
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:732
#__LA_DECL int archive_write_get_bytes_per_block(struct archive *);
sub archive_write_get_bytes_per_block(Archive
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:734
#__LA_DECL int archive_write_set_bytes_in_last_block(struct archive *,
sub archive_write_set_bytes_in_last_block(Archive
                                         ,int32                         $bytes_in_last_block # int
                                          ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:736
#__LA_DECL int archive_write_get_bytes_in_last_block(struct archive *);
sub archive_write_get_bytes_in_last_block(Archive
                                          ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:740
#/* The dev/ino of a file that won't be archived.  This is used
# * to avoid recursively adding an archive to itself. */
#__LA_DECL int archive_write_set_skip_file(struct archive *,
sub archive_write_set_skip_file(Archive
                               ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                               ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:744
##if ARCHIVE_VERSION_NUMBER < 4000000
#__LA_DECL int archive_write_set_compression_bzip2(struct archive *)
sub archive_write_set_compression_bzip2(Archive
                                        ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:746
#__LA_DECL int archive_write_set_compression_compress(struct archive *)
sub archive_write_set_compression_compress(Archive
                                           ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:748
#__LA_DECL int archive_write_set_compression_gzip(struct archive *)
sub archive_write_set_compression_gzip(Archive
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:750
#__LA_DECL int archive_write_set_compression_lzip(struct archive *)
sub archive_write_set_compression_lzip(Archive
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:752
#__LA_DECL int archive_write_set_compression_lzma(struct archive *)
sub archive_write_set_compression_lzma(Archive
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:754
#__LA_DECL int archive_write_set_compression_none(struct archive *)
sub archive_write_set_compression_none(Archive
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:756
#__LA_DECL int archive_write_set_compression_program(struct archive *,
sub archive_write_set_compression_program(Archive
                                         ,Str                           $cmd # const char*
                                          ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:758
#__LA_DECL int archive_write_set_compression_xz(struct archive *)
sub archive_write_set_compression_xz(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:763
#/* A convenience function to set the filter based on the code. */
#__LA_DECL int archive_write_add_filter(struct archive *, int filter_code);
sub archive_write_add_filter(Archive
                            ,int32                         $filter_code # int
                             ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:764
#__LA_DECL int archive_write_add_filter_by_name(struct archive *,
sub archive_write_add_filter_by_name(Archive
                                    ,Str                           $name # const char*
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:766
#__LA_DECL int archive_write_add_filter_b64encode(struct archive *);
sub archive_write_add_filter_b64encode(Archive
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:767
#__LA_DECL int archive_write_add_filter_bzip2(struct archive *);
sub archive_write_add_filter_bzip2(Archive
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:768
#__LA_DECL int archive_write_add_filter_compress(struct archive *);
sub archive_write_add_filter_compress(Archive
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:769
#__LA_DECL int archive_write_add_filter_grzip(struct archive *);
sub archive_write_add_filter_grzip(Archive
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:770
#__LA_DECL int archive_write_add_filter_gzip(struct archive *);
sub archive_write_add_filter_gzip(Archive
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:771
#__LA_DECL int archive_write_add_filter_lrzip(struct archive *);
sub archive_write_add_filter_lrzip(Archive
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:772
#__LA_DECL int archive_write_add_filter_lz4(struct archive *);
sub archive_write_add_filter_lz4(Archive
                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:773
#__LA_DECL int archive_write_add_filter_lzip(struct archive *);
sub archive_write_add_filter_lzip(Archive
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:774
#__LA_DECL int archive_write_add_filter_lzma(struct archive *);
sub archive_write_add_filter_lzma(Archive
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:775
#__LA_DECL int archive_write_add_filter_lzop(struct archive *);
sub archive_write_add_filter_lzop(Archive
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:776
#__LA_DECL int archive_write_add_filter_none(struct archive *);
sub archive_write_add_filter_none(Archive
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:777
#__LA_DECL int archive_write_add_filter_program(struct archive *,
sub archive_write_add_filter_program(Archive
                                    ,Str                           $cmd # const char*
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:779
#__LA_DECL int archive_write_add_filter_uuencode(struct archive *);
sub archive_write_add_filter_uuencode(Archive
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:780
#__LA_DECL int archive_write_add_filter_xz(struct archive *);
sub archive_write_add_filter_xz(Archive
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:784
#/* A convenience function to set the format based on the code or name. */
#__LA_DECL int archive_write_set_format(struct archive *, int format_code);
sub archive_write_set_format(Archive
                            ,int32                         $format_code # int
                             ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:785
#__LA_DECL int archive_write_set_format_by_name(struct archive *,
sub archive_write_set_format_by_name(Archive
                                    ,Str                           $name # const char*
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:788
#/* To minimize link pollution, use one or more of the following. */
#__LA_DECL int archive_write_set_format_7zip(struct archive *);
sub archive_write_set_format_7zip(Archive
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:789
#__LA_DECL int archive_write_set_format_ar_bsd(struct archive *);
sub archive_write_set_format_ar_bsd(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:790
#__LA_DECL int archive_write_set_format_ar_svr4(struct archive *);
sub archive_write_set_format_ar_svr4(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:791
#__LA_DECL int archive_write_set_format_cpio(struct archive *);
sub archive_write_set_format_cpio(Archive
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:792
#__LA_DECL int archive_write_set_format_cpio_newc(struct archive *);
sub archive_write_set_format_cpio_newc(Archive
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:793
#__LA_DECL int archive_write_set_format_gnutar(struct archive *);
sub archive_write_set_format_gnutar(Archive
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:794
#__LA_DECL int archive_write_set_format_iso9660(struct archive *);
sub archive_write_set_format_iso9660(Archive
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:795
#__LA_DECL int archive_write_set_format_mtree(struct archive *);
sub archive_write_set_format_mtree(Archive
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:796
#__LA_DECL int archive_write_set_format_mtree_classic(struct archive *);
sub archive_write_set_format_mtree_classic(Archive
                                           ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:798
#__LA_DECL int archive_write_set_format_pax(struct archive *);
sub archive_write_set_format_pax(Archive
                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:799
#__LA_DECL int archive_write_set_format_pax_restricted(struct archive *);
sub archive_write_set_format_pax_restricted(Archive
                                            ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:800
#__LA_DECL int archive_write_set_format_raw(struct archive *);
sub archive_write_set_format_raw(Archive
                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:801
#__LA_DECL int archive_write_set_format_shar(struct archive *);
sub archive_write_set_format_shar(Archive
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:802
#__LA_DECL int archive_write_set_format_shar_dump(struct archive *);
sub archive_write_set_format_shar_dump(Archive
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:803
#__LA_DECL int archive_write_set_format_ustar(struct archive *);
sub archive_write_set_format_ustar(Archive
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:804
#__LA_DECL int archive_write_set_format_v7tar(struct archive *);
sub archive_write_set_format_v7tar(Archive
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:805
#__LA_DECL int archive_write_set_format_warc(struct archive *);
sub archive_write_set_format_warc(Archive
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:806
#__LA_DECL int archive_write_set_format_xar(struct archive *);
sub archive_write_set_format_xar(Archive
                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:807
#__LA_DECL int archive_write_set_format_zip(struct archive *);
sub archive_write_set_format_zip(Archive
                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:808
#__LA_DECL int archive_write_set_format_filter_by_ext(struct archive *a, const char *filename);
sub archive_write_set_format_filter_by_ext(Archive                       $a # archive*
                                          ,Str                           $filename # const char*
                                           ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:809
#__LA_DECL int archive_write_set_format_filter_by_ext_def(struct archive *a, const char *filename, const char * def_ext);
sub archive_write_set_format_filter_by_ext_def(Archive                       $a # archive*
                                              ,Str                           $filename # const char*
                                              ,Str                           $def_ext # const char*
                                               ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:810
#__LA_DECL int archive_write_zip_set_compression_deflate(struct archive *);
sub archive_write_zip_set_compression_deflate(Archive
                                              ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:811
#__LA_DECL int archive_write_zip_set_compression_store(struct archive *);
sub archive_write_zip_set_compression_store(Archive
                                            ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:812
#__LA_DECL int archive_write_open(struct archive *, void *,
sub archive_write_open(Archive
                      ,Pointer                        # void*
                      ,&open_callback #Pointer[NYI(F:int ( archive*, void*))] # Typedef<archive_open_callback>->|F:int ( archive*, void*)|*
                      ,&write_callback #Pointer[NYI(F:Typedef<la_ssize_t>->|Typedef<ssize_t>->|Typedef<ssize_t>->|long int||| ( archive*, void*, const void*, Typedef<size_t>->|long unsigned int|))] # Typedef<archive_write_callback>->|F:Typedef<la_ssize_t>->|Typedef<ssize_t>->|Typedef<ssize_t>->|long int||| ( archive*, void*, const void*, Typedef<size_t>->|long unsigned int|)|*
                      ,&close_callback #Pointer[NYI(F:int ( archive*, void*))] # Typedef<archive_close_callback>->|F:int ( archive*, void*)|*
                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:815
#__LA_DECL int archive_write_open_fd(struct archive *, int _fd);
sub archive_write_open_fd(Archive
                         ,int32                         $_fd # int
                          ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:816
#__LA_DECL int archive_write_open_filename(struct archive *, const char *_file);
sub archive_write_open_filename(Archive
                               ,Str                           $_file # const char*
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:817
#__LA_DECL int archive_write_open_filename_w(struct archive *,
sub archive_write_open_filename_w(Archive
                                 ,Str              $_file # const Typedef<wchar_t>->|int|*
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:820
#/* A deprecated synonym for archive_write_open_filename() */
#__LA_DECL int archive_write_open_file(struct archive *, const char *_file)
sub archive_write_open_file(Archive
                           ,Str                           $_file # const char*
                            ) is native(LIB) returns int32 { * }

=begin NYI
#-From /usr/include/archive.h:822
#__LA_DECL int archive_write_open_FILE(struct archive *, FILE *);
sub archive_write_open_FILE(Archive
                           ,FILE                           # Typedef<FILE>->|FILE|*
                            ) is native(LIB) returns int32 { * }
=end NYI

#-From /usr/include/archive.h:825
#/* _buffSize is the size of the buffer, _used refers to a variable that
# * will be updated after each write into the buffer. */
#__LA_DECL int archive_write_open_memory(struct archive *,
sub archive_write_open_memory(Archive
                             ,Pointer                       $_buffer # void*
                             ,size_t                        $_buffSize # Typedef<size_t>->|long unsigned int|
                             ,Pointer[size_t]               $_used # Typedef<size_t>->|long unsigned int|*
                              ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:832
#/*
# * Note that the library will truncate writes beyond the size provided
# * to archive_write_header or pad if the provided data is short.
# */
#__LA_DECL int archive_write_header(struct archive *,
sub archive_write_header(Archive
                        ,ArchiveEntry                  # archive_entry*
                         ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:834
#__LA_DECL la_ssize_t	archive_write_data(struct archive *,
sub archive_write_data(Archive
                      ,Pointer                        # const void*
                      ,size_t                         # Typedef<size_t>->|long unsigned int|
                       ) is native(LIB) returns ssize_t { * }

#-From /usr/include/archive.h:838
#/* This interface is currently only available for archive_write_disk handles.  */
#__LA_DECL la_ssize_t	 archive_write_data_block(struct archive *,
sub archive_write_data_block(Archive
                            ,Pointer                        # const void*
                            ,size_t                         # Typedef<size_t>->|long unsigned int|
                            ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                             ) is native(LIB) returns ssize_t { * }

#-From /usr/include/archive.h:841
#__LA_DECL int		 archive_write_finish_entry(struct archive *);
sub archive_write_finish_entry(Archive
                               ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:842
#__LA_DECL int		 archive_write_close(struct archive *);
sub archive_write_close(Archive
                        ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:846
#/* Marks the archive as FATAL so that a subsequent free() operation
# * won't try to close() cleanly.  Provides a fast abort capability
# * when the client discovers that things have gone wrong. */
#__LA_DECL int            archive_write_fail(struct archive *);
sub archive_write_fail(Archive
                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:849
#/* This can fail if the archive wasn't already closed, in which case
# * archive_write_free() will implicitly call archive_write_close(). */
#__LA_DECL int		 archive_write_free(struct archive *);
sub archive_write_free(Archive
                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:852
##if ARCHIVE_VERSION_NUMBER < 4000000
#/* Synonym for archive_write_free() for backwards compatibility. */
#__LA_DECL int		 archive_write_finish(struct archive *) __LA_DEPRECATED;
sub archive_write_finish(Archive
                         ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:859
#/*
# * Set write options.
# */
#/* Apply option to the format only. */
#__LA_DECL int archive_write_set_format_option(struct archive *_a,
sub archive_write_set_format_option(Archive                       $_a # archive*
                                   ,Str                           $m # const char*
                                   ,Str                           $o # const char*
                                   ,Str                           $v # const char*
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:863
#/* Apply option to the filter only. */
#__LA_DECL int archive_write_set_filter_option(struct archive *_a,
sub archive_write_set_filter_option(Archive                       $_a # archive*
                                   ,Str                           $m # const char*
                                   ,Str                           $o # const char*
                                   ,Str                           $v # const char*
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:867
#/* Apply option to both the format and the filter. */
#__LA_DECL int archive_write_set_option(struct archive *_a,
sub archive_write_set_option(Archive                       $_a # archive*
                            ,Str                           $m # const char*
                            ,Str                           $o # const char*
                            ,Str                           $v # const char*
                             ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:871
#/* Apply option string to both the format and the filter. */
#__LA_DECL int archive_write_set_options(struct archive *_a,
sub archive_write_set_options(Archive                       $_a # archive*
                             ,Str                           $opts # const char*
                              ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:877
#/*
# * Set a encryption passphrase.
# */
#__LA_DECL int archive_write_set_passphrase(struct archive *_a, const char *p);
sub archive_write_set_passphrase(Archive                       $_a # archive*
                                ,Str                           $p # const char*
                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:878
#__LA_DECL int archive_write_set_passphrase_callback(struct archive *,
sub archive_write_set_passphrase_callback(Archive
                                         ,Pointer                       $client_data # void*
                                         ,&callback # Pointer[NYI(F:const char* ( archive*, void*))] # Typedef<archive_passphrase_callback>->|F:const char* ( archive*, void*)|*
                                          ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:897
#/*-
# * ARCHIVE_WRITE_DISK API
# *
# * To create objects on disk:
# *   1) Ask archive_write_disk_new for a new archive_write_disk object.
# *   2) Set any global properties.  In particular, you probably
# *      want to set the options.
# *   3) For each entry:
# *      - construct an appropriate struct archive_entry structure
# *      - archive_write_header to create the file/dir/etc on disk
# *      - archive_write_data to write the entry data
# *   4) archive_write_free to cleanup the writer and release resources
# *
# * In particular, you can use this in conjunction with archive_read()
# * to pull entries out of an archive and create them on disk.
# */
#__LA_DECL struct archive	*archive_write_disk_new(void);
sub archive_write_disk_new(
                           ) is native(LIB) returns Archive { * }

#-From /usr/include/archive.h:899
#/* This file will not be overwritten. */
#__LA_DECL int archive_write_disk_set_skip_file(struct archive *,
sub archive_write_disk_set_skip_file(Archive
                                    ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                                    ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:903
#/* Set flags to control how the next item gets created.
# * This accepts a bitmask of ARCHIVE_EXTRACT_XXX flags defined above. */
#__LA_DECL int		 archive_write_disk_set_options(struct archive *,
sub archive_write_disk_set_options(Archive
                                  ,int32                         $flags # int
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:922
# * are probably also appropriate for applications that are doing
# * same-system backup and restore.
# */
#/*
# * The "standard" lookup functions use common system calls to lookup
# * the uname/gname, falling back to the uid/gid if the names can't be
# * found.  They cache lookups and are reasonably fast, but can be very
# * large, so they are not used unless you ask for them.  In
# * particular, these match the specifications of POSIX "pax" and old
# * POSIX "tar".
# */
#__LA_DECL int	 archive_write_disk_set_standard_lookup(struct archive *);
sub archive_write_disk_set_standard_lookup(Archive
                                           ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:928
#/*
# * If neither the default (naive) nor the standard (big) functions suit
# * your needs, you can write your own and register them.  Be sure to
# * include a cleanup function if you have allocated private data.
# */
#__LA_DECL int archive_write_disk_set_group_lookup(struct archive *,
sub archive_write_disk_set_group_lookup(Archive
                                       ,Pointer                        # void*
                                       ,& (Pointer, Str, int64 --> int64) # F:Typedef<la_int64>->|Typedef<int64>->|long int|| ( void*, const char*, Typedef<la_int64>->|Typedef<int64>->|long int||)*
                                       ,& (Pointer) # F:void ( void*)*
                                        ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:932
#__LA_DECL int archive_write_disk_set_user_lookup(struct archive *,
sub archive_write_disk_set_user_lookup(Archive
                                      ,Pointer                        # void*
                                      ,& (Pointer, Str, int64 --> int64) # F:Typedef<la_int64>->|Typedef<int64>->|long int|| ( void*, const char*, Typedef<la_int64>->|Typedef<int64>->|long int||)*
                                      ,& (Pointer) # F:void ( void*)*
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:936
#__LA_DECL la_int64 archive_write_disk_gid(struct archive *, const char *, la_int64);
sub archive_write_disk_gid(Archive
                          ,Str                            # const char*
                          ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                           ) is native(LIB) returns int64 { * }

#-From /usr/include/archive.h:937
#__LA_DECL la_int64 archive_write_disk_uid(struct archive *, const char *, la_int64);
sub archive_write_disk_uid(Archive
                          ,Str                            # const char*
                          ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                           ) is native(LIB) returns int64 { * }

#-From /usr/include/archive.h:944
#/*
# * ARCHIVE_READ_DISK API
# *
# * This is still evolving and somewhat experimental.
# */
#__LA_DECL struct archive *archive_read_disk_new(void);
sub archive_read_disk_new(
                          ) is native(LIB) returns Archive { * }

#-From /usr/include/archive.h:948
#/* The names for symlink modes here correspond to an old BSD
# * command-line argument convention: -L, -P, -H */
#/* Follow all symlinks. */
#__LA_DECL int archive_read_disk_set_symlink_logical(struct archive *);
sub archive_read_disk_set_symlink_logical(Archive
                                          ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:950
#/* Follow no symlinks. */
#__LA_DECL int archive_read_disk_set_symlink_physical(struct archive *);
sub archive_read_disk_set_symlink_physical(Archive
                                           ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:952
#/* Follow symlink initially, then not. */
#__LA_DECL int archive_read_disk_set_symlink_hybrid(struct archive *);
sub archive_read_disk_set_symlink_hybrid(Archive
                                         ) is native(LIB) returns int32 { * }

=begin NYI
#-From /usr/include/archive.h:954
#/* TODO: Handle Linux stat32/stat64 ugliness. <sigh> */
#__LA_DECL int archive_read_disk_entry_from_file(struct archive *,
sub archive_read_disk_entry_from_file(Archive
                                     ,ArchiveEntry                  # archive_entry*
                                     ,int32                          # int
                                     ,stat                           # const stat*
                                      ) is native(LIB) returns int32 { * }
=end NYI

#-From /usr/include/archive.h:958
#/* Look up gname for gid or uname for uid. */
#/* Default implementations are very, very stupid. */
#__LA_DECL const char *archive_read_disk_gname(struct archive *, la_int64);
sub archive_read_disk_gname(Archive
                           ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                            ) is native(LIB) returns Str { * }

#-From /usr/include/archive.h:959
#__LA_DECL const char *archive_read_disk_uname(struct archive *, la_int64);
sub archive_read_disk_uname(Archive
                           ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                            ) is native(LIB) returns Str { * }

#-From /usr/include/archive.h:962
#/* "Standard" implementation uses getpwuid_r, getgrgid_r and caches the
# * results for performance. */
#__LA_DECL int	archive_read_disk_set_standard_lookup(struct archive *);
sub archive_read_disk_set_standard_lookup(Archive
                                          ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:964
#/* You can install your own lookups if you like. */
#__LA_DECL int	archive_read_disk_set_gname_lookup(struct archive *,
sub archive_read_disk_set_gname_lookup(Archive
                                      ,Pointer                        # void*
                                      ,& (Pointer, int64 --> Str) # F:const char* ( void*, Typedef<la_int64>->|Typedef<int64>->|long int||)*
                                      ,& (Pointer) # F:void ( void*)*
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:968
#__LA_DECL int	archive_read_disk_set_uname_lookup(struct archive *,
sub archive_read_disk_set_uname_lookup(Archive
                                      ,Pointer                        # void*
                                      ,& (Pointer, int64 --> Str) # F:const char* ( void*, Typedef<la_int64>->|Typedef<int64>->|long int||)*
                                      ,& (Pointer) # F:void ( void*)*
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:973
#/* Start traversal. */
#__LA_DECL int	archive_read_disk_open(struct archive *, const char *);
sub archive_read_disk_open(Archive
                          ,Str                            # const char*
                           ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:974
#__LA_DECL int	archive_read_disk_open_w(struct archive *, const wchar_t *);
sub archive_read_disk_open_w(Archive
                            ,Str               # const Typedef<wchar_t>->|int|*
                             ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:982
#/*
# * Request that current entry be visited.  If you invoke it on every
# * directory, you'll get a physical traversal.  This is ignored if the
# * current entry isn't a directory or a link to a directory.  So, if
# * you invoke this on every returned path, you'll get a full logical
# * traversal.
# */
#__LA_DECL int	archive_read_disk_descend(struct archive *);
sub archive_read_disk_descend(Archive
                              ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:983
#__LA_DECL int	archive_read_disk_can_descend(struct archive *);
sub archive_read_disk_can_descend(Archive
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:984
#__LA_DECL int	archive_read_disk_current_filesystem(struct archive *);
sub archive_read_disk_current_filesystem(Archive
                                         ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:985
#__LA_DECL int	archive_read_disk_current_filesystem_is_synthetic(struct archive *);
sub archive_read_disk_current_filesystem_is_synthetic(Archive
                                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:986
#__LA_DECL int	archive_read_disk_current_filesystem_is_remote(struct archive *);
sub archive_read_disk_current_filesystem_is_remote(Archive
                                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:988
#/* Request that the access time of the entry visited by travesal be restored. */
#__LA_DECL int  archive_read_disk_set_atime_restored(struct archive *);
sub archive_read_disk_set_atime_restored(Archive
                                         ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1005
#__LA_DECL int  archive_read_disk_set_behavior(struct archive *,
sub archive_read_disk_set_behavior(Archive
                                  ,int32                         $flags # int
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1014
#/*
# * Set archive_match object that will be used in archive_read_disk to
# * know whether an entry should be skipped. The callback function
# * _excluded_func will be invoked when an entry is skipped by the result
# * of archive_match.
# */
#__LA_DECL int	archive_read_disk_set_matching(struct archive *,
sub archive_read_disk_set_matching(Archive
                                  ,Archive                       $_matching # archive*
                                  ,&_excluded_func (Archive, Pointer, ArchiveEntry) # F:void ( archive*, void*, archive_entry*)*
                                  ,Pointer                       $_client_data # void*
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1018
#__LA_DECL int	archive_read_disk_set_metadata_filter_callback(struct archive *,
sub archive_read_disk_set_metadata_filter_callback(Archive
                                                  ,&_metadata_filter_func (Archive, Pointer, ArchiveEntry --> int32) # F:int ( archive*, void*, archive_entry*)*
                                                  ,Pointer                       $_client_data # void*
                                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1024
# * This calls archive_read_free() or archive_write_free() as needed. */
#__LA_DECL int	archive_free(struct archive *);
sub archive_free(Archive
                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1035
#/* Number of filters in the current filter pipeline. */
#/* Filter #0 is the one closest to the format, -1 is a synonym for the
# * last filter, which is always the pseudo-filter that wraps the
# * client callbacks. */
#__LA_DECL int		 archive_filter_count(struct archive *);
sub archive_filter_count(Archive
                         ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1036
#__LA_DECL la_int64	 archive_filter_bytes(struct archive *, int);
sub archive_filter_bytes(Archive
                        ,int32                          # int
                         ) is native(LIB) returns int64 { * }

#-From /usr/include/archive.h:1037
#__LA_DECL int		 archive_filter_code(struct archive *, int);
sub archive_filter_code(Archive
                       ,int32                          # int
                        ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1038
#__LA_DECL const char *	 archive_filter_name(struct archive *, int);
sub archive_filter_name(Archive
                       ,int32                          # int
                        ) is native(LIB) returns Str { * }

#-From /usr/include/archive.h:1044
#__LA_DECL la_int64	 archive_position_compressed(struct archive *)
sub archive_position_compressed(Archive
                                ) is native(LIB) returns int64 { * }

#-From /usr/include/archive.h:1047
#__LA_DECL la_int64	 archive_position_uncompressed(struct archive *)
sub archive_position_uncompressed(Archive
                                  ) is native(LIB) returns int64 { * }

#-From /usr/include/archive.h:1050
#__LA_DECL const char	*archive_compression_name(struct archive *)
sub archive_compression_name(Archive
                             ) is native(LIB) returns Str { * }

#-From /usr/include/archive.h:1053
#__LA_DECL int		 archive_compression(struct archive *)
sub archive_compression(Archive
                        ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1057
#__LA_DECL int		 archive_errno(struct archive *);
sub archive_errno(Archive
                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1058
#__LA_DECL const char	*archive_error_string(struct archive *);
sub archive_error_string(Archive
                         ) is native(LIB) returns Str { * }

#-From /usr/include/archive.h:1059
#__LA_DECL const char	*archive_format_name(struct archive *);
sub archive_format_name(Archive
                        ) is native(LIB) returns Str { * }

#-From /usr/include/archive.h:1060
#__LA_DECL int		 archive_format(struct archive *);
sub archive_format(Archive
                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1061
#__LA_DECL void		 archive_clear_error(struct archive *);
sub archive_clear_error(Archive
                        ) is native(LIB)  { * }

#-From /usr/include/archive.h:1062
#__LA_DECL void		 archive_set_error(struct archive *, int _err,
sub archive_set_error(Archive
                     ,int32                         $_err # int
                     ,Str                           $fmt # const char*
                      ) is native(LIB)  { * }

#-From /usr/include/archive.h:1064
#__LA_DECL void		 archive_copy_error(struct archive *dest,
sub archive_copy_error(Archive                       $dest # archive*
                      ,Archive                       $src # archive*
                       ) is native(LIB)  { * }

#-From /usr/include/archive.h:1066
#__LA_DECL int		 archive_file_count(struct archive *);
sub archive_file_count(Archive
                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1071
#/*
# * ARCHIVE_MATCH API
# */
#__LA_DECL struct archive *archive_match_new(void);
sub archive_match_new(
                      ) is native(LIB) returns Archive { * }

#-From /usr/include/archive.h:1072
#__LA_DECL int	archive_match_free(struct archive *);
sub archive_match_free(Archive
                       ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1080
#/*
# * Test if archive_entry is excluded.
# * This is a convenience function. This is the same as calling all
# * archive_match_path_excluded, archive_match_time_excluded
# * and archive_match_owner_excluded.
# */
#__LA_DECL int	archive_match_excluded(struct archive *,
sub archive_match_excluded(Archive
                          ,ArchiveEntry                  # archive_entry*
                           ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1086
#/*
# * Test if pathname is excluded. The conditions are set by following functions.
# */
#__LA_DECL int	archive_match_path_excluded(struct archive *,
sub archive_match_path_excluded(Archive
                               ,ArchiveEntry                  # archive_entry*
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1089
#/* Add exclusion pathname pattern. */
#__LA_DECL int	archive_match_exclude_pattern(struct archive *, const char *);
sub archive_match_exclude_pattern(Archive
                                 ,Str                            # const char*
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1090
#__LA_DECL int	archive_match_exclude_pattern_w(struct archive *,
sub archive_match_exclude_pattern_w(Archive
                                   ,Str               # const Typedef<wchar_t>->|int|*
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1093
#/* Add exclusion pathname pattern from file. */
#__LA_DECL int	archive_match_exclude_pattern_from_file(struct archive *,
sub archive_match_exclude_pattern_from_file(Archive
                                           ,Str                            # const char*
                                           ,int32                         $_nullSeparator # int
                                            ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1095
#__LA_DECL int	archive_match_exclude_pattern_from_file_w(struct archive *,
sub archive_match_exclude_pattern_from_file_w(Archive
                                             ,Str               # const Typedef<wchar_t>->|int|*
                                             ,int32                         $_nullSeparator # int
                                              ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1098
#/* Add inclusion pathname pattern. */
#__LA_DECL int	archive_match_include_pattern(struct archive *, const char *);
sub archive_match_include_pattern(Archive
                                 ,Str                            # const char*
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1099
#__LA_DECL int	archive_match_include_pattern_w(struct archive *,
sub archive_match_include_pattern_w(Archive
                                   ,Str               # const Typedef<wchar_t>->|int|*
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1102
#/* Add inclusion pathname pattern from file. */
#__LA_DECL int	archive_match_include_pattern_from_file(struct archive *,
sub archive_match_include_pattern_from_file(Archive
                                           ,Str                            # const char*
                                           ,int32                         $_nullSeparator # int
                                            ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1104
#__LA_DECL int	archive_match_include_pattern_from_file_w(struct archive *,
sub archive_match_include_pattern_from_file_w(Archive
                                             ,Str               # const Typedef<wchar_t>->|int|*
                                             ,int32                         $_nullSeparator # int
                                              ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1110
#/*
# * How to get statistic information for inclusion patterns.
# */
#/* Return the amount number of unmatched inclusion patterns. */
#__LA_DECL int	archive_match_path_unmatched_inclusions(struct archive *);
sub archive_match_path_unmatched_inclusions(Archive
                                            ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1113
#/* Return the pattern of unmatched inclusion with ARCHIVE_OK.
# * Return ARCHIVE_EOF if there is no inclusion pattern. */
#__LA_DECL int	archive_match_path_unmatched_inclusions_next(
sub archive_match_path_unmatched_inclusions_next(Archive
                                                ,Pointer[Str]                   # const char**
                                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1115
#__LA_DECL int	archive_match_path_unmatched_inclusions_next_w(
sub archive_match_path_unmatched_inclusions_next_w(Archive
                                                  ,Pointer[Str]      # const Typedef<wchar_t>->|int|**
                                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1122
#/*
# * Test if a file is excluded by its time stamp.
# * The conditions are set by following functions.
# */
#__LA_DECL int	archive_match_time_excluded(struct archive *,
sub archive_match_time_excluded(Archive
                               ,ArchiveEntry                  # archive_entry*
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1140
#/*
# * Flags to tell a matching type of time stamps. These are used for
# * following functinos.
# */
#/* Time flag: mtime to be tested. */
##define ARCHIVE_MATCH_MTIME	(0x0100)
#/* Time flag: ctime to be tested. */
##define ARCHIVE_MATCH_CTIME	(0x0200)
#/* Comparison flag: Match the time if it is newer than. */
##define ARCHIVE_MATCH_NEWER	(0x0001)
#/* Comparison flag: Match the time if it is older than. */
##define ARCHIVE_MATCH_OLDER	(0x0002)
#/* Comparison flag: Match the time if it is equal to. */
##define ARCHIVE_MATCH_EQUAL	(0x0010)
#/* Set inclusion time. */
#__LA_DECL int	archive_match_include_time(struct archive *, int _flag,
sub archive_match_include_time(Archive
                              ,int32                         $_flag # int
                              ,long                      $_sec # Typedef<time_t>->|Typedef<__time_t>->|long int||
                              ,long                          $_nsec # long int
                               ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1143
#/* Set inclusion time by a date string. */
#__LA_DECL int	archive_match_include_date(struct archive *, int _flag,
sub archive_match_include_date(Archive
                              ,int32                         $_flag # int
                              ,Str                           $_datestr # const char*
                               ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1145
#__LA_DECL int	archive_match_include_date_w(struct archive *, int _flag,
sub archive_match_include_date_w(Archive
                                ,int32                         $_flag # int
                                ,Str              $_datestr # const Typedef<wchar_t>->|int|*
                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1148
#/* Set inclusion time by a particluar file. */
#__LA_DECL int	archive_match_include_file_time(struct archive *,
sub archive_match_include_file_time(Archive
                                   ,int32                         $_flag # int
                                   ,Str                           $_pathname # const char*
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1150
#__LA_DECL int	archive_match_include_file_time_w(struct archive *,
sub archive_match_include_file_time_w(Archive
                                     ,int32                         $_flag # int
                                     ,Str              $_pathname # const Typedef<wchar_t>->|int|*
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1153
#/* Add exclusion entry. */
#__LA_DECL int	archive_match_exclude_entry(struct archive *,
sub archive_match_exclude_entry(Archive
                               ,int32                         $_flag # int
                               ,ArchiveEntry                  # archive_entry*
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1160
#/*
# * Test if a file is excluded by its uid ,gid, uname or gname.
# * The conditions are set by following functions.
# */
#__LA_DECL int	archive_match_owner_excluded(struct archive *,
sub archive_match_owner_excluded(Archive
                                ,ArchiveEntry                  # archive_entry*
                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1163
#/* Add inclusion uid, gid, uname and gname. */
#__LA_DECL int	archive_match_include_uid(struct archive *, la_int64);
sub archive_match_include_uid(Archive
                             ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                              ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1164
#__LA_DECL int	archive_match_include_gid(struct archive *, la_int64);
sub archive_match_include_gid(Archive
                             ,int64                        # Typedef<la_int64>->|Typedef<int64>->|long int||
                              ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1165
#__LA_DECL int	archive_match_include_uname(struct archive *, const char *);
sub archive_match_include_uname(Archive
                               ,Str                            # const char*
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1166
#__LA_DECL int	archive_match_include_uname_w(struct archive *,
sub archive_match_include_uname_w(Archive
                                 ,Str               # const Typedef<wchar_t>->|int|*
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1168
#__LA_DECL int	archive_match_include_gname(struct archive *, const char *);
sub archive_match_include_gname(Archive
                               ,Str                            # const char*
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1169
#__LA_DECL int	archive_match_include_gname_w(struct archive *,
sub archive_match_include_gname_w(Archive
                                 ,Str               # const Typedef<wchar_t>->|int|*
                                  ) is native(LIB) returns int32 { * }

#-From /usr/include/archive.h:1174
#/* Utility functions */
#/* Convenience function to sort a NULL terminated list of strings */
#__LA_DECL int archive_utility_string_sort(char **);
sub archive_utility_string_sort(Pointer[Str]  # char**
                                ) is native(LIB) returns int32 { * }


}

# vim: expandtab shiftwidth=4 ft=perl6
