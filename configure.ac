AC_INIT([GATBPS],
        m4_esyscmd_s([sh VERSION.sh])m4_assert(m4_sysval == 0),
        [quinn.grier@gmail.com],
        [gatbps],
        [https://github.com/quinngrier/gatbps])

m4_define([AC_PACKAGE_DATE],
          m4_esyscmd_s([sh DATE.sh])m4_assert(m4_sysval == 0))
AC_SUBST([PACKAGE_DATE], 'AC_PACKAGE_DATE')
AC_DEFINE([PACKAGE_DATE], "AC_PACKAGE_DATE")

AC_COPYRIGHT(
[Some parts of this configure script belong to GATBPS.
The authors of these parts have waived all copyright and
related or neighboring rights to the extent permitted by
law as described by the CC0 1.0 Universal Public Domain
Dedication. You should have received a copy of the full
dedication along with this script, typically as a file
named <CC0-1.0.txt>. If not, it may be available at
<https://creativecommons.org/publicdomain/zero/1.0/>.])

AC_SYS_INTERPRETER
AS_IF([test "$interpval" = yes], [],
      [AC_MSG_WARN([installed shell scripts may not work properly])])

AM_INIT_AUTOMAKE([-Wall -Werror info-in-builddir])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT

dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
