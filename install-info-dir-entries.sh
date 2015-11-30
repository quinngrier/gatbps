DESTDIR="${1}"
infodir="${2}"

case "${infodir}" in
#(
  ?*)
    :
  ;;
#(
  *)
    exit '0'
  ;;
esac

cat <<EOF
 install-info \\
   "--align=51" \\
   "--calign=49" \\
   "--description=Generate basic package files." \\
   "--dir-file=${DESTDIR}${infodir}/dir" \\
   "--info-file=${DESTDIR}${infodir}/gatbps.info" \\
   "--name=* gatbps: (gatbps)Invoking gatbps." \\
   "--section=Individual utilities"
EOF

 install-info \
   "--align=51" \
   "--calign=49" \
   "--description=Generate basic package files." \
   "--dir-file=${DESTDIR}${infodir}/dir" \
   "--info-file=${DESTDIR}${infodir}/gatbps.info" \
   "--name=* gatbps: (gatbps)Invoking gatbps." \
   "--section=Individual utilities"

exit '0'

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
