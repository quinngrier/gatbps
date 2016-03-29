changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CHECK_LIB.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_CHECK_LIB], [{ :

  GATBPS_CHECK_BASIC(
    [$1],
    [$2],
    [{ :
      gatbps_save_LIBS="$[]{LIBS}"
      LIBS='$3'" $[]{LIBS}"
      AC_LANG_PUSH([C])
      AC_LINK_IFELSE(
        [AC_LANG_PROGRAM([], [])],
        [gatbps_cv_$2='yes'],
        [gatbps_cv_$2='no'])
      AC_LANG_POP([C])
      LIBS="$[]{gatbps_save_LIBS}"
    }],
    [$4])

}])dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl|%}
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
