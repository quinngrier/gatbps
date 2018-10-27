changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/java-test-wrapper.c.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|/*|%}, {%| *|%}){%|
 *
 * Special file: java-test-wrapper.c
 *
 * For more information, see the GATBPS manual.
 */

/* begin_includes */

#include <src/TEST_EXIT.h>
#include <src/config.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>

/* end_includes */

int (main)(
  void
) {
  if (strcmp(JAVA, "") == 0) {
    return TEST_EXIT_SKIP;
  }
  if (strcmp(JAVAC, "") == 0) {
    return TEST_EXIT_SKIP;
  }
  {
    char command[] = "sh " __FILE__ "h";
    command[sizeof(command) - 3] = 's';
    {
      int const status = system(command);
      if (status == -1) {
        return TEST_EXIT_ERROR;
      }
      return WEXITSTATUS(status);
    }
  }
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
