#-----------------------------------------------------------------------
# gatbps_quote
#-----------------------------------------------------------------------
#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

gatbps_quote() {

  case ${gatbps_quote_script+x} in '')
    gatbps_quote_script='
      BEGIN {
        q = "'\''";
        printf q;
      }
      {
        if (NR > 1) {
          printf "\n";
        }
        gsub(/'\''/, q "\\" q q);
        printf "%s", $0;
      }
      END {
        print q;
      }
    '
    ${gatbps_readonly?} gatbps_quote_script
  esac

  case $# in 0)
    eval LC_ALL=C "${AWK:-awk}" ' \
      "${gatbps_quote_script?}" \
    ' || exit $?
  ;; *)
    eval LC_ALL=C "${AWK:-awk}" ' \
      "${gatbps_quote_script?}" \
    ' <<gatbps_eof || exit $?
$@
gatbps_eof
  esac

}
