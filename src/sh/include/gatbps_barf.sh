#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

#-----------------------------------------------------------------------
# gatbps_barf
#-----------------------------------------------------------------------

gatbps_barf() {

  case $# in 0)

    printf '%s\n' "$0: Error: Unknown error." >&2

  ;; 1)

    printf '%s\n' "$0: Error: ${1?}" >&2

  ;; *)

    printf '%s' "$0: Error: ${1?}" >&2
    shift
    printf ' %s' "$@" >&2
    echo >&2

  esac

  exit 1

}
