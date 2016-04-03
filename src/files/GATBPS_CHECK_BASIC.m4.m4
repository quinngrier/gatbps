changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|dnl|%}, {%|dnl|%}){%|
dnl
dnl Special file: GATBPS_CHECK_BASIC.m4
dnl
dnl For more information, see the GATBPS manual.
dnl
AC_DEFUN([GATBPS_CHECK_BASIC], [{ :

  #
  # The following variable starts off as 'yes' and is updated to 'no' in
  # the AC_CACHE_CHECK code below, which only runs if the cache variable
  # is not cached.
  #

  $2_was_cached='yes'

  AC_CACHE_CHECK(
    [for $1],
    [gatbps_cv_$2],
    [{ :

      #
      # This is the AC_CACHE_CHECK code that only runs if the cache
      # variable is not cached.
      #

      $2_was_cached='no'

      gatbps_x='yes'
      { :m4_foreach_w(
        [gatbps_var],
        [$4],
        [
        { :
          case "$[]{gatbps_var}" in
          #(
            'yes'|'no'|'1'|'0')
              :
            ;;
          #(
            *)
              AC_MSG_RESULT([])
              AC_MSG_ERROR(
                [invalid \$[]{gatbps_var} value: $[]{gatbps_var}],
                [1])
            ;;
          esac
          gatbps_x="$[]{gatbps_x}$[]{gatbps_var}"
        }])
      }
      case "$[]{gatbps_x}" in
      #(
        *'no'*|*'0'*)
          gatbps_cv_$2='no'
        ;;
      #(
        *)
          $3
        ;;
      esac
    }])

  #
  # The cache variable is appropriately set to 'yes' or 'no' by the
  # above AC_CACHE_CHECK code when it is not cached, but the user can
  # still mistakenly set it to an invalid value when editing the cache.
  # The following case statement catches this mistake.
  #

  case "$[]{gatbps_cv_$2}" in
  #(
    'yes'|'no')
      :
    ;;
  #(
    *)
      AC_MSG_ERROR([invalid \$[]{gatbps_cv_$2} value: $[]{gatbps_cv_$2}], [1])
    ;;
  esac

  case "$[]{gatbps_cv_$2}" in
  #(
    'yes')
      AC_DEFINE([$2], [1], [Define to 1 if you have $1 or 0 if not.])
    ;;
  #(
    'no')
      AC_DEFINE([$2], [0], [Define to 1 if you have $1 or 0 if not.])
    ;;
  esac

  case "$[]{gatbps_cv_$2}" in
  #(
    'yes')
      $2='1'
    ;;
  #(
    'no')
      $2='0'
    ;;
  esac
  AC_SUBST([$2])

  AM_CONDITIONAL([$2], [(
    case "$[]{gatbps_cv_$2}" in
    #(
      'yes')
        exit 0
      ;;
    #(
      'no')
        exit 1
      ;;
    esac
  )])

}])dnl
|%}footer_comment({%|dnl|%}, {%|dnl|%}, {%|dnl|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
