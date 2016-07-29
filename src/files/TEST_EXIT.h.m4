changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/TEST_EXIT.h|%}){%||%}dnl
rules_code({%|src/tools/rules_code|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|/*|%}, {%| *|%}){%|
 *
 * Special file: TEST_EXIT.h
 *
 * The TEST_EXIT.h special file is a C header file that defines the
 * TEST_EXIT_ERROR, TEST_EXIT_FAIL, TEST_EXIT_PASS, and TEST_EXIT_SKIP
 * macros to 99, 1, 0, and 77, respectively. These are the exit status
 * values used by GNU Automake for a test suite with no test protocol.
 *
 * For more information, see the GATBPS manual.
 */

#if (!defined(TEST_EXIT_ERROR))
  #define TEST_EXIT_ERROR 99
#endif

#if (!defined(TEST_EXIT_FAIL))
  #define TEST_EXIT_FAIL 1
#endif

#if (!defined(TEST_EXIT_PASS))
  #define TEST_EXIT_PASS 0
#endif

#if (!defined(TEST_EXIT_SKIP))
  #define TEST_EXIT_SKIP 77
#endif

|%}footer_comment({%|/*|%}, {%| *|%}, {%| */|%}){%||%}dnl
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
