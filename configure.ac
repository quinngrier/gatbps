AC_INIT([GATBPS],
        m4_esyscmd_s([sh VERSION.sh])m4_assert(m4_sysval == 0),
        [quinn.grier@gmail.com],
        [gatbps],
        [https://github.com/quinngrier/gatbps])

m4_include([CC0-1.0-AC-COPYRIGHT.ac])
m4_include([DATE.ac])

AC_CONFIG_SRCDIR([gatbps.in])

AC_SYS_INTERPRETER
AS_CASE(["$interpval"], [no],
        [AC_MSG_WARN([the gatbps script may not run properly])])

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
