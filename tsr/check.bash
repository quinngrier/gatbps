# TODO 1: make this into a portable shell script
# TODO 2: make this into a GATBPS special file

set -euo pipefail

for x in */*.tsr; do

  y=$(echo $x | sed 's/.*\([0-9a-f]\{40\}\).*/\1/')

  s=0
  stderr=$(
    openssl ts \
      -verify \
      -digest $y \
      -in $x \
      -CApath certs \
      -untrusted <(cat certs/*.pem) \
      2>&1 \
      >/dev/null \
    ;
  ) || s=$?

  case $s in
    0)
    ;;
    *)
      cat <<EOF >&2

FAILED: $x
$stderr
EOF
    ;;
  esac

done

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
