#pragma once

#if defined(__cplusplus)

  extern "C" int _stricmp(const char *s1, const char *s2);
  extern "C" int _strnicmp(const char *s1, const char *s2, int n);
  extern "C" char* _strdup(const char *s);

#else

  extern int _stricmp(const char *s1, const char *s2);
  extern int _strnicmp(const char *s1, const char *s2, int n);
  extern char* _strdup(const char *s);

#endif

#define strcasecmp(a,b)  _stricmp(a,b)
#define strncasecmp(a,b,c) _strnicmp(a,b,c)
#define strdup(a)          _strdup(a)
