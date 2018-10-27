changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/TestExit.java.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|/*|%}, {%| *|%}){%|
 *
 * Special file: TestExit.java
 *
 * For more information, see the GATBPS manual.
 */

/**
 * @file
 */

package tests;

public final class TestExit
{

public static final int ERROR = 99;

public static final int FAIL = 1;

public static final int PASS = 0;

public static final int SKIP = 77;

private TestExit() {}

}
|%}footer_comment({%|/*|%}, {%| *|%}, {%| */|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
