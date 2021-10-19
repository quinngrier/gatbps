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
# gatbps_unknown_opt
#-----------------------------------------------------------------------

gatbps_unknown_opt() {

  case $# in 1)
    :
  ;; *)
    gatbps_barf \
      "gatbps_unknown_opt(): Exactly one argument must be given." \
    ;
  esac

  case ${1?} in --*)

    printf '%s' "$0: Unknown option: " >&2

    sed '
      /=/ {
        s/=.*//
        q
      }
    ' <<gatbps_unknown_opt_eof >&2
${1?}
gatbps_unknown_opt_eof

    exit 1

  ;; -?*)

    printf '%s: Unknown option: %.2s\n' "$0" "${1?}" >&2

    exit 1

  esac

}
