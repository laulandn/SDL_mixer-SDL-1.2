
#ifdef macintosh
# include "string_funcs.h"
#endif


/*#define CMD_MUSIC*/
/* NOTE: For using external command */

#define WAV_MUSIC
#define MOD_MUSIC
#define MID_MUSIC

/*#define MODPLUG_MUSIC*/
/* NOTE: Lib not included in souerce tree? */

/*#define MP3_MUSIC*/
/*#define MP3_MAD_MUSIC*/
/* NOTE: In progress...*/

/* PowerPC only due to limitations for m68k cw6 compiler */
#if powerc
#define OGG_MUSIC
#endif

#define FLAC_MUSIC

#define USE_TIMIDITY_MIDI
#define USE_NATIVE_MIDI


/* For libmpg123, this is just a wild guess, probably wrong... */
#define LFS_ALIAS_BITS 32
#define lfs_alias_t long
#define MPG123_NO_LARGENAME


/* For libflac */
#define WORDS_BIGENDIAN 1
/* NOTE: This has global effects, so not a great idea, but works... */
#define alloca(x) malloc(x)
