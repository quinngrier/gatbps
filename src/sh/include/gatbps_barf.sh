#-----------------------------------------------------------------------
# gatbps_barf
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

gatbps_barf() {

  gatbps_barf_status=1
  case ${GATBPS_BARF_STATUS+x} in ?*)
    case ${GATBPS_BARF_STATUS?} in \
      [0-9] | \
      [1-9][0-9] | \
      1[0-9][0-9] | \
      2[0-4][0-9] | \
      25[0-5] \
    )
      gatbps_barf_status=${GATBPS_BARF_STATUS?}
    ;; *)
      gatbps_warn \
        "Ignoring invalid" \
        "GATBPS_BARF_STATUS:" \
        "\"${GATBPS_BARF_STATUS?}\"." \
      ;
    esac
  esac

  case $# in 0)
    set "Unknown error"
  esac

  gatbps_barf_buffer="$0: Error: $@."

  printf '%s\n' "${gatbps_barf_buffer?}" >&2

  exit ${gatbps_barf_status?}

}
