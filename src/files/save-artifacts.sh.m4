changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/save-artifacts.sh.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/declare_detect_options.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
include({%|src/tools/sh_prelude.m4|%}){%||%}dnl
header_comment({%|#|%}, {%|#|%}){%|
#
# Special file: save-artifacts.sh
#
# For more information, see the GATBPS manual.
#

|%}sh_prelude{%|

|%}declare_detect_options{%|

#
# The style_stdout and style_stderr variables hold the current settings
# for the --style-stdout and --style-stderr options. Each starts off as
# 'never' and is updated (to 'always', 'auto', or 'never') each time an
# appropriate option is found.
#

style_stdout='never'
style_stderr='never'

#
# The isatty1 and isatty2 variables indicate whether standard output and
# standard error are associated with terminals. Each starts off with the
# value 'unknown' and is lazily set to 'yes' or 'no' using the following
# code just before each point where the value is needed.
#
# For the isatty1 variable:
#
#       case "${isatty1}" in
#       #(
#         'unknown')
#           if 'test' '-t' '1'; then
#             isatty1='yes'
#           else
#             isatty1='no'
#           fi
#         ;;
#       esac
#
# For the isatty2 variable:
#
#       case "${isatty2}" in
#       #(
#         'unknown')
#           if 'test' '-t' '2'; then
#             isatty2='yes'
#           else
#             isatty2='no'
#           fi
#         ;;
#       esac
#

isatty1='unknown'
isatty2='unknown'

#
# The following two groups of variables hold ANSI escape sequences for
# bold, underline, and color styling of text written to standard output
# and standard error. Each variable starts off empty so that styling is
# disabled by default. Then, when appropriate, each group is set to the
# appropriate values using the following code.
#
# For standard output:
#
#       fR1='[22m[24m[39m' # stdout style: none
#       fB1='[24m[39m[1m'  # stdout style: bold
#       fI1='[22m[39m[4m'  # stdout style: underline
#       fr1='[22m[24m[31m' # stdout style: red
#       fg1='[22m[24m[32m' # stdout style: green
#       fy1='[22m[24m[33m' # stdout style: yellow
#       fb1='[22m[24m[34m' # stdout style: blue
#       fm1='[22m[24m[35m' # stdout style: magenta
#       fc1='[22m[24m[36m' # stdout style: cyan
#
# For standard error:
#
#       fR2='[22m[24m[39m' # stderr style: none
#       fB2='[24m[39m[1m'  # stderr style: bold
#       fI2='[22m[39m[4m'  # stderr style: underline
#       fr2='[22m[24m[31m' # stderr style: red
#       fg2='[22m[24m[32m' # stderr style: green
#       fy2='[22m[24m[33m' # stderr style: yellow
#       fb2='[22m[24m[34m' # stderr style: blue
#       fm2='[22m[24m[35m' # stderr style: magenta
#       fc2='[22m[24m[36m' # stderr style: cyan
#
# Note that the code contains escape characters, i.e., characters with
# value 0x1B, which do not normally appear in plain text. Text editors
# often have special ways of displaying such characters. In particular,
# some editors may actually interpret the escape sequences or silently
# hide or discard the escape characters.
#
# Although escape sequences offer a wide variety of functionality, the
# variables balance utility and portability. The colors are limited to
# those that should always be legible and accurate, and the styles are
# mutually exclusive. In particular, mixing bold and color is tempting
# but may produce inconsistent results across different systems.
#

fR1='' # stdout style: none
fB1='' # stdout style: bold
fI1='' # stdout style: underline
fr1='' # stdout style: red
fg1='' # stdout style: green
fy1='' # stdout style: yellow
fb1='' # stdout style: blue
fm1='' # stdout style: magenta
fc1='' # stdout style: cyan

fR2='' # stderr style: none
fB2='' # stderr style: bold
fI2='' # stderr style: underline
fr2='' # stderr style: red
fg2='' # stderr style: green
fy2='' # stderr style: yellow
fb2='' # stderr style: blue
fm2='' # stderr style: magenta
fc2='' # stderr style: cyan

#
# For each program P of interest, the P_auto variable holds a command
# that runs the best available version of P. The variable starts off
# empty and is lazily set using the following code just before each
# point where the value is needed.
#
# For the awk program:
#
#       case "${awk_auto}" in
#       #(
#         ?*)
#           ':'
#         ;;
#       #(
#         *)
#           awk_auto=''\''awk'\'''
#           for x in \
#             ''\''gawk'\''' \
#             ''\''mawk'\''' \
#             ''\''nawk'\''' \
#           ; do
#             if 'eval' \
#               "${x}"' '\'''\''' \
#               0</dev/null \
#               1>/dev/null \
#               2>&1 \
#             ; then
#               awk_auto="${x}"
#               'break'
#             fi
#           done
#         ;;
#       esac
#
# For the git program:
#
#       case "${git_auto}" in
#         ?*)
#           ':';
#         ;;
#         *)
#           git_auto=''\''git'\''';
#           for x in \
#           ; do
#             if 'eval' \
#               "${x}"' '\''--version'\''' \
#               0</dev/null \
#               1>/dev/null \
#               2>/dev/null \
#             ; then
#               git_auto="${x}";
#               'break';
#             fi;
#           done;
#         ;;
#       esac;
#
# For the gpg program:
#
#       case "${gpg_auto}" in
#         ?*)
#           ':';
#         ;;
#         *)
#           gpg_auto=''\''gpg'\''';
#           for x in \
#             ''\''gpg1'\''' \
#           ; do
#             if 'eval' \
#               "${x}"' '\''--version'\''' \
#               0</dev/null \
#               1>/dev/null \
#               2>/dev/null \
#             ; then
#               gpg_auto="${x}";
#               'break';
#             fi;
#           done;
#         ;;
#       esac;
#
# For the sed program:
#
#       case "${sed_auto}" in
#       #(
#         ?*)
#           ':'
#         ;;
#       #(
#         *)
#           sed_auto=''\''sed'\'''
#           for x in \
#             ''\''gsed'\''' \
#           ; do
#             if 'eval' \
#               "${x}"' '\'''\''' \
#               0</dev/null \
#               1>/dev/null \
#               2>&1 \
#             ; then
#               sed_auto="${x}"
#               'break'
#             fi
#           done
#         ;;
#       esac
#
# For the sshpass program:
#
#       case "${sshpass_auto}" in
#         ?*)
#           ':';
#         ;;
#         *)
#           sshpass_auto=''\''sshpass'\''';
#           for x in \
#           ; do
#             if 'eval' \
#               "${x}"' '\''-V'\''' \
#               0</dev/null \
#               1>/dev/null \
#               2>/dev/null \
#             ; then
#               sshpass_auto="${x}";
#               'break';
#             fi;
#           done;
#         ;;
#       esac;
#

awk_auto=''
git_auto=''
gpg_auto=''
sed_auto=''
sshpass_auto=''

#
# For each program P of interest, the P variable holds the command that
# will be used to run P. The variable starts off with a value chosen by
# some outside force (such as a configure script) and is updated by the
# P environment variable (in all capital letters) and each instance of
# the --P=V option. If the variable starts off as 'auto', then it is
# immediately updated to the value of the P_auto variable.
#

awk='auto'
git='auto'
gpg='auto'
sed='auto'
sshpass='auto'

case "${awk}" in
  'auto')
    case "${awk_auto}" in
      ?*)
      ;;
      *)
        awk_auto=''\''awk'\'''
        for x in \
          ''\''gawk'\''' \
          ''\''mawk'\''' \
          ''\''nawk'\''' \
        ; do
          if 'eval' \
            "${x}"' '\'''\''' \
            0</dev/null \
            1>/dev/null \
            2>&1 \
          ; then
            awk_auto="${x}"
            'break'
          fi
        done
      ;;
    esac
    awk="${awk_auto}"
  ;;
esac

case "${git}" in
  'auto')
    case "${git_auto}" in
      ?*)
        ':';
      ;;
      *)
        git_auto=''\''git'\''';
        for x in \
        ; do
          if 'eval' \
            "${x}"' '\''--version'\''' \
            0</dev/null \
            1>/dev/null \
            2>/dev/null \
          ; then
            git_auto="${x}";
            'break';
          fi;
        done;
      ;;
    esac;
    git="${git_auto}";
  ;;
esac;

case "${gpg}" in
  'auto')
    case "${gpg_auto}" in
      ?*)
        ':';
      ;;
      *)
        gpg_auto=''\''gpg'\''';
        for x in \
          ''\''gpg1'\''' \
        ; do
          if 'eval' \
            "${x}"' '\''--version'\''' \
            0</dev/null \
            1>/dev/null \
            2>/dev/null \
          ; then
            gpg_auto="${x}";
            'break';
          fi;
        done;
      ;;
    esac;
    gpg="${gpg_auto}";
  ;;
esac;

case "${sed}" in
  'auto')
    case "${sed_auto}" in
      ?*)
      ;;
      *)
        sed_auto=''\''sed'\'''
        for x in \
          ''\''gsed'\''' \
        ; do
          if 'eval' \
            "${x}"' '\'''\''' \
            0</dev/null \
            1>/dev/null \
            2>&1 \
          ; then
            sed_auto="${x}"
            'break'
          fi
        done
      ;;
    esac
    sed="${sed_auto}"
  ;;
esac

case "${sshpass}" in
  'auto')
    case "${sshpass_auto}" in
      ?*)
        ':';
      ;;
      *)
        sshpass_auto=''\''sshpass'\''';
        for x in \
        ; do
          if 'eval' \
            "${x}"' '\''-V'\''' \
            0</dev/null \
            1>/dev/null \
            2>/dev/null \
          ; then
            sshpass_auto="${x}";
            'break';
          fi;
        done;
      ;;
    esac;
    sshpass="${sshpass_auto}";
  ;;
esac;

#
# The following code translates environment variables to arguments as
# described by the man page for this program.
#

case "${STYLE_STDOUT+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--style-stdout='"${STYLE_STDOUT}"
      ;;
      *)
        'set' 'dummy' '--style-stdout='"${STYLE_STDOUT}" "${@}"
      ;;
    esac
    'shift'
  ;;
esac

case "${STYLE_STDERR+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--style-stderr='"${STYLE_STDERR}"
      ;;
      *)
        'set' 'dummy' '--style-stderr='"${STYLE_STDERR}" "${@}"
      ;;
    esac
    'shift'
  ;;
esac

case "${STYLE+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--style='"${STYLE}"
      ;;
      *)
        'set' 'dummy' '--style='"${STYLE}" "${@}"
      ;;
    esac
    'shift'
  ;;
esac

case "${SSHPASS+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--sshpass='"${SSHPASS}";
      ;;
      *)
        'set' 'dummy' '--sshpass='"${SSHPASS}" "${@}";
      ;;
    esac;
    'shift';
  ;;
esac;

case "${SED+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--sed='"${SED}"
      ;;
      *)
        'set' 'dummy' '--sed='"${SED}" "${@}"
      ;;
    esac
    'shift'
  ;;
esac

case "${GPG+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--gpg='"${GPG}";
      ;;
      *)
        'set' 'dummy' '--gpg='"${GPG}" "${@}";
      ;;
    esac;
    'shift';
  ;;
esac;

case "${GIT+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--git='"${GIT}";
      ;;
      *)
        'set' 'dummy' '--git='"${GIT}" "${@}";
      ;;
    esac;
    'shift';
  ;;
esac;

case "${AWK+is_set}" in
  ?*)
    case $# in
      '0')
        'set' 'dummy' '--awk='"${AWK}"
      ;;
      *)
        'set' 'dummy' '--awk='"${AWK}" "${@}"
      ;;
    esac
    'shift'
  ;;
esac

pwd=`
  'pwd';
`;
s="${?}";
case "${s}" in
  '0')
    ':';
  ;;
  *)
    'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}pwd${fR2} failed
${fr2}save-artifacts.sh!${fR2} exit status: ${fB2}${s}${fR2}
EOF2
    exit 1;
  ;;
esac;
'readonly' 'pwd';

copy_ssh_secret_key_file='no';
date_command="sh build-aux/gatbps-gen-date.sh";
git_committer_email='archivist@example.com';
git_committer_name='Archivist';
gpg_passphrase_file='gpg-passphrase-file';
gpg_secret_key_file='gpg-secret-key-file';
leaf_prefix='';
push_attempts='10';
repository='repository';
root_prefix='';
ssh_known_hosts_file='';
ssh_passphrase_file='ssh-passphrase-file';
ssh_secret_key_file='ssh-secret-key-file';
sshpass_prompt='assphrase';
temporary_directory='temporary-directory';
version_command=''\''sh'\'' '\''build-aux/gatbps-gen-version.sh'\''';

copy_ssh_secret_key_file_attempted='no';
copy_ssh_secret_key_file_succeeded='no';
date_command_attempted='no';
date_command_succeeded='no';
exit_status='0';
full_git_clone_directory="${pwd}"'/temporary-directory/git_clone';
full_gpg_import_directory="${pwd}"'/temporary-directory/gpg_import';
full_gpg_passphrase_file="${pwd}"'/gpg-passphrase-file';
full_gpg_secret_key_file="${pwd}"'/gpg-secret-key-file';
full_ssh_known_hosts_file='';
full_ssh_passphrase_file="${pwd}"'/ssh-passphrase-file';
full_ssh_secret_key_file="${pwd}"'/ssh-secret-key-file';
full_ssh_secret_key_file_pointer="${pwd}"'/ssh-secret-key-file';
full_temporary_directory="${pwd}"'/temporary-directory';
git_clone_attempted='no';
git_clone_directory='temporary-directory/git_clone';
git_clone_succeeded='no';
gpg_import_attempted='no';
gpg_import_directory='temporary-directory/gpg_import';
gpg_import_succeeded='no';
gpg_secret_key_fingerprint='';
gpg_wrapper_attempted='no';
gpg_wrapper_succeeded='no';
safe_git_clone_directory='temporary-directory/git_clone';
safe_gpg_import_directory='temporary-directory/gpg_import';
safe_gpg_passphrase_file='gpg-passphrase-file';
safe_gpg_secret_key_file='gpg-secret-key-file';
safe_ssh_passphrase_file='ssh-passphrase-file';
safe_ssh_secret_key_file='ssh-secret-key-file';
safe_temporary_directory='temporary-directory';
version_command_attempted='no';
version_command_succeeded='no';

case $# in
  '0')
    'set' 'dummy'
  ;;
  *)
    'set' 'dummy' "${@}"
  ;;
esac

while ':'; do

  'shift'

  case $# in
    '0')
      'break'
    ;;
  esac

  case "${detect_options}" in
    'yes')

      case "${1}" in

        '--')

          detect_options='no'
          'continue'

        ;;

        '--='*)

          'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--${fR2} forbids a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
          exit 1

        ;;

        '--awk')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--awk${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--awk=${x}" "${@}"

          'continue'

        ;;

        '--awk='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--awk=/awk='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${awk}" in
            'auto')
              case "${awk_auto}" in
                ?*)
                ;;
                *)
                  awk_auto=''\''awk'\'''
                  for x in \
                    ''\''gawk'\''' \
                    ''\''mawk'\''' \
                    ''\''nawk'\''' \
                  ; do
                    if 'eval' \
                      "${x}"' '\'''\''' \
                      0</dev/null \
                      1>/dev/null \
                      2>&1 \
                    ; then
                      awk_auto="${x}"
                      'break'
                    fi
                  done
                ;;
              esac
              awk="${awk_auto}"
            ;;
          esac

          'continue'

        ;;

        '--copy-ssh-secret-key-file')

          'shift';
          'set' 'dummy' '--copy-ssh-secret-key-file=yes' "${@}";
          'continue';

        ;;

        '--copy-ssh-secret-key-file=yes')

          copy_ssh_secret_key_file='yes';
          full_ssh_secret_key_file_pointer="${full_temporary_directory}"'/ssh_secret_key';
          'continue';

        ;;

        '--copy-ssh-secret-key-file='*)

          copy_ssh_secret_key_file='no';
          full_ssh_secret_key_file_pointer="${full_ssh_secret_key_file}";
          'continue';

        ;;

        '--date-command')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--date-command${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--date-command=${x}" "${@}"

          'continue'

        ;;

        '--date-command='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--date-command=/date_command='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          date_command_attempted='no';
          date_command_succeeded='no';

          'continue'

        ;;

        '--git')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--git${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--git=${x}" "${@}"

          'continue'

        ;;

        '--git='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--git=/git='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${git}" in
            'auto')
              case "${git_auto}" in
                ?*)
                  ':';
                ;;
                *)
                  git_auto=''\''git'\''';
                  for x in \
                  ; do
                    if 'eval' \
                      "${x}"' '\''--version'\''' \
                      0</dev/null \
                      1>/dev/null \
                      2>/dev/null \
                    ; then
                      git_auto="${x}";
                      'break';
                    fi;
                  done;
                ;;
              esac;
              git="${git_auto}";
            ;;
          esac;

          'continue'

        ;;

        '--git-committer-email')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--git-committer-email${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--git-committer-email=${x}" "${@}"

          'continue'

        ;;

        '--git-committer-email='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--git-committer-email=/git_committer_email='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          'continue'

        ;;

        '--git-committer-name')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--git-committer-name${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--git-committer-name=${x}" "${@}"

          'continue'

        ;;

        '--git-committer-name='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--git-committer-name=/git_committer_name='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          'continue'

        ;;

        '--gpg')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--gpg${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--gpg=${x}" "${@}"

          'continue'

        ;;

        '--gpg='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--gpg=/gpg='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${gpg}" in
            'auto')
              case "${gpg_auto}" in
                ?*)
                  ':';
                ;;
                *)
                  gpg_auto=''\''gpg'\''';
                  for x in \
                    ''\''gpg1'\''' \
                  ; do
                    if 'eval' \
                      "${x}"' '\''--version'\''' \
                      0</dev/null \
                      1>/dev/null \
                      2>/dev/null \
                    ; then
                      gpg_auto="${x}";
                      'break';
                    fi;
                  done;
                ;;
              esac;
              gpg="${gpg_auto}";
            ;;
          esac;

          gpg_wrapper_attempted='no';
          gpg_wrapper_succeeded='no';

          'continue'

        ;;

        '--gpg-passphrase-file')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--gpg-passphrase-file${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--gpg-passphrase-file=${x}" "${@}"

          'continue'

        ;;

        '--gpg-passphrase-file='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--gpg-passphrase-file=/gpg_passphrase_file='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${gpg_passphrase_file}" in
            '/'*)
              full_gpg_passphrase_file="${gpg_passphrase_file}";
              safe_gpg_passphrase_file="${gpg_passphrase_file}";
            ;;
            *)
              full_gpg_passphrase_file="${pwd}"'/'"${gpg_passphrase_file}";
              safe_gpg_passphrase_file='./'"${gpg_passphrase_file}";
            ;;
          esac;

          'continue'

        ;;

        '--gpg-secret-key-file')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--gpg-secret-key-file${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--gpg-secret-key-file=${x}" "${@}"

          'continue'

        ;;

        '--gpg-secret-key-file='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--gpg-secret-key-file=/gpg_secret_key_file='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${gpg_secret_key_file}" in
            '/'*)
              full_gpg_secret_key_file="${gpg_secret_key_file}";
              safe_gpg_secret_key_file="${gpg_secret_key_file}";
            ;;
            *)
              full_gpg_secret_key_file="${pwd}"'/'"${gpg_secret_key_file}";
              safe_gpg_secret_key_file='./'"${gpg_secret_key_file}";
            ;;
          esac;

          gpg_import_attempted='no';
          gpg_import_succeeded='no';

          'continue'

        ;;

        '--leaf-prefix')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--leaf-prefix${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--leaf-prefix=${x}" "${@}"

          'continue'

        ;;

        '--leaf-prefix='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--leaf-prefix=/leaf_prefix='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${leaf_prefix}" in
            '../'*|*'/../')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} invalid ${fB2}--leaf-prefix${fR2} value: ${fB2}${leaf_prefix}${fR2}
EOF2
              exit 1;
            ;;
          esac;

          'continue'

        ;;

        '--push-attempts')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--push-attempts${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--push-attempts=${x}" "${@}"

          'continue'

        ;;

        '--push-attempts='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--push-attempts=/push_attempts='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${push_attempts}" in
            [1-9]|[1-9][0-9])
              ':';
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} invalid ${fB2}--push-attempts${fR2} value: ${fB2}${push_attempts}${fR2}
EOF2
              exit 1;
            ;;
          esac;

          'continue'

        ;;

        '--repository')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--repository${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--repository=${x}" "${@}"

          'continue'

        ;;

        '--repository='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--repository=/repository='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          git_clone_attempted='no';
          git_clone_succeeded='no';

          'continue'

        ;;

        '--root-prefix')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--root-prefix${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--root-prefix=${x}" "${@}"

          'continue'

        ;;

        '--root-prefix='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--root-prefix=/root_prefix='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${root_prefix}" in
            '../'*|*'/../')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} invalid ${fB2}--root-prefix${fR2} value: ${fB2}${root_prefix}${fR2}
EOF2
              exit 1;
            ;;
          esac;

          'continue'

        ;;

        '--sed')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--sed${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--sed=${x}" "${@}"

          'continue'

        ;;

        '--sed='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--sed=/sed='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${sed}" in
            'auto')
              case "${sed_auto}" in
                ?*)
                ;;
                *)
                  sed_auto=''\''sed'\'''
                  for x in \
                    ''\''gsed'\''' \
                  ; do
                    if 'eval' \
                      "${x}"' '\'''\''' \
                      0</dev/null \
                      1>/dev/null \
                      2>&1 \
                    ; then
                      sed_auto="${x}"
                      'break'
                    fi
                  done
                ;;
              esac
              sed="${sed_auto}"
            ;;
          esac

          'continue'

        ;;

        '--ssh-known-hosts-file')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--ssh-known-hosts-file${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--ssh-known-hosts-file=${x}" "${@}"

          'continue'

        ;;

        '--ssh-known-hosts-file='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--ssh-known-hosts-file=/ssh_known_hosts_file='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${ssh_known_hosts_file}" in
            '')
              full_ssh_known_hosts_file='';
            ;;
            '/'*)
              full_ssh_known_hosts_file="${ssh_known_hosts_file}";
            ;;
            *)
              full_ssh_known_hosts_file="${pwd}"'/'"${ssh_known_hosts_file}";
            ;;
          esac;

          'continue'

        ;;

        '--ssh-passphrase-file')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--ssh-passphrase-file${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--ssh-passphrase-file=${x}" "${@}"

          'continue'

        ;;

        '--ssh-passphrase-file='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--ssh-passphrase-file=/ssh_passphrase_file='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${ssh_passphrase_file}" in
            '/'*)
              full_ssh_passphrase_file="${ssh_passphrase_file}";
              safe_ssh_passphrase_file="${ssh_passphrase_file}";
            ;;
            *)
              full_ssh_passphrase_file="${pwd}"'/'"${ssh_passphrase_file}";
              safe_ssh_passphrase_file='./'"${ssh_passphrase_file}";
            ;;
          esac;

          'continue'

        ;;

        '--ssh-secret-key-file')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--ssh-secret-key-file${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--ssh-secret-key-file=${x}" "${@}"

          'continue'

        ;;

        '--ssh-secret-key-file='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--ssh-secret-key-file=/ssh_secret_key_file='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${ssh_secret_key_file}" in
            '/'*)
              full_ssh_secret_key_file="${ssh_secret_key_file}";
              safe_ssh_secret_key_file="${ssh_secret_key_file}";
            ;;
            *)
              full_ssh_secret_key_file="${pwd}"'/'"${ssh_secret_key_file}";
              safe_ssh_secret_key_file='./'"${ssh_secret_key_file}";
            ;;
          esac;

          copy_ssh_secret_key_file_attempted='no';
          copy_ssh_secret_key_file_succeeded='no';

          'continue'

        ;;

        '--sshpass')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--sshpass${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--sshpass=${x}" "${@}"

          'continue'

        ;;

        '--sshpass='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--sshpass=/sshpass='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          case "${sshpass}" in
            'auto')
              case "${sshpass_auto}" in
                ?*)
                  ':';
                ;;
                *)
                  sshpass_auto=''\''sshpass'\''';
                  for x in \
                  ; do
                    if 'eval' \
                      "${x}"' '\''-V'\''' \
                      0</dev/null \
                      1>/dev/null \
                      2>/dev/null \
                    ; then
                      sshpass_auto="${x}";
                      'break';
                    fi;
                  done;
                ;;
              esac;
              sshpass="${sshpass_auto}";
            ;;
          esac;

          'continue'

        ;;

        '--sshpass-prompt')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--sshpass-prompt${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--sshpass-prompt=${x}" "${@}"

          'continue'

        ;;

        '--sshpass-prompt='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--sshpass-prompt=/sshpass_prompt='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          'continue'

        ;;

        '--temporary-directory')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--temporary-directory${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--temporary-directory=${x}" "${@}"

          'continue'

        ;;

        '--temporary-directory='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--temporary-directory=/temporary_directory='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          git_clone_directory="${temporary_directory}"'/git_clone';
          gpg_import_directory="${temporary_directory}"'/gpg_import';

          case "${temporary_directory}" in
            '/'*)
              full_temporary_directory="${temporary_directory}";
              safe_temporary_directory="${temporary_directory}";
            ;;
            *)
              full_temporary_directory="${pwd}"'/'"${temporary_directory}";
              safe_temporary_directory='./'"${temporary_directory}";
            ;;
          esac;

          case "${git_clone_directory}" in
            '/'*)
              full_git_clone_directory="${git_clone_directory}";
              safe_git_clone_directory="${git_clone_directory}";
            ;;
            *)
              full_git_clone_directory="${pwd}"'/'"${git_clone_directory}";
              safe_git_clone_directory='./'"${git_clone_directory}";
            ;;
          esac;

          case "${gpg_import_directory}" in
            '/'*)
              full_gpg_import_directory="${gpg_import_directory}";
              safe_gpg_import_directory="${gpg_import_directory}";
            ;;
            *)
              full_gpg_import_directory="${pwd}"'/'"${gpg_import_directory}";
              safe_gpg_import_directory='./'"${gpg_import_directory}";
            ;;
          esac;

          copy_ssh_secret_key_file_attempted='no';
          copy_ssh_secret_key_file_succeeded='no';
          git_clone_attempted='no';
          git_clone_succeeded='no';
          gpg_import_attempted='no';
          gpg_import_succeeded='no';
          gpg_wrapper_attempted='no';
          gpg_wrapper_succeeded='no';

          'continue'

        ;;

        '--version-command')

          case $# in
            '1')
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}--version-command${fR2} requires a value
${fr2}save-artifacts.sh!${fR2} try ${fB2}sh save-artifacts.sh --help${fR2} for more information
EOF2
              exit 1
            ;;
          esac

          x="${2}"
          shift
          shift
          set 'x' "--version-command=${x}" "${@}"

          'continue'

        ;;

        '--version-command='*)

          x=`'eval' "${sed}"' "
            s/'\\''/'\\''\\\\\\\\'\\'''\\''/g
            1s/^--version-command=/version_command='\\''/
            \\$s/\\$/'\\''/
          "' <<EOF2
${1}
EOF2
`
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: a command substitution
EOF2
              exit 1
            ;;
          esac
          'eval' "${x}"

          version_command_attempted='no';
          version_command_succeeded='no';

          'continue'

        ;;

        '--'*'='*)

          'eval' "${awk}"' '\''
            {
              if (NR != 1) {
                name = name "\n"
              }
              done = sub(/=.*/, "", $0)
              name = name $0
              if (done) {
                exit
              }
            }
            END {
              printf "'\''"${fr2}"'\''save-artifacts.sh!'\''"${fR2}"'\'' unknown option: '\''"${fB2}"'\''%s'\''"${fR2}"'\''\n", name
              printf "'\''"${fr2}"'\''save-artifacts.sh!'\''"${fR2}"'\'' try '\''"${fB2}"'\''save-artifacts.sh --help'\''"${fR2}"'\'' for more information\n"
            }
          '\''' >&2 <<EOF2
${1}
EOF2
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: standard error
EOF2
            ;;
          esac
          exit 1

        ;;

        '--'*|'-'?)

          'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} unknown option: ${fB2}${1}${fR2}
${fr2}save-artifacts.sh!${fR2} try ${fB2}save-artifacts.sh --help${fR2} for more information
EOF2
          exit 1

        ;;

        '-'?*)

          'eval' "${awk}"' '\''
            {
              name = substr($0 "\n", 1, 2)
              printf "'\''"${fr2}"'\''save-artifacts.sh!'\''"${fR2}"'\'' unknown option: '\''"${fB2}"'\''%s'\''"${fR2}"'\''\n", name
              printf "'\''"${fr2}"'\''save-artifacts.sh!'\''"${fR2}"'\'' try '\''"${fB2}"'\''save-artifacts.sh --help'\''"${fR2}"'\'' for more information\n"
              exit
            }
          '\''' >&2 <<EOF2
${1}
EOF2
          case "${?}" in
            '0')
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fr2}save-artifacts.sh!${fR2} ${fB2}${awk}${fR2} failed while reading from:
${fr2}save-artifacts.sh!${fR2}   1. a here-document
${fr2}save-artifacts.sh!${fR2} and writing to: standard error
EOF2
            ;;
          esac
          exit 1

        ;;

      esac

    ;;
  esac

  case "${gpg_import_attempted}" in
    'no')

      gpg_import_attempted='yes';

      'test' \
        '-f' \
        "${safe_gpg_secret_key_file}" \
        0</dev/null \
      ;
      s="${?}";
      case "${s}" in
        '0')
          ':';
        ;;
        '1')
          'continue';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}test${fR2} failed
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      'rm' \
        '-f' \
        '-r' \
        "${safe_gpg_import_directory}" \
        0</dev/null \
      ;
      s="${?}";
      case "${s}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}rm${fR2} failed while deleting:
${fy2}save-artifacts.sh:${fR2}   1. ${fB2}${gpg_import_directory}${fR2}
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      'mkdir' \
        '-p' \
        "${safe_gpg_import_directory}" \
        0</dev/null \
      ;
      s="${?}";
      case "${s}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}mkdir -p${fR2} failed: ${fB2}${safe_gpg_import_directory}${fR2}
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      'chmod' \
        '700' \
        "${safe_gpg_import_directory}" \
        0</dev/null \
      ;
      case "${?}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}chmod 700${fR2} failed: ${fB2}${safe_gpg_import_directory}${fR2}
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      'eval' '
        GNUPGHOME="${safe_gpg_import_directory}" \
        '"${gpg}"' \
          '\''--batch'\'' \
          '\''--no-tty'\'' \
          '\''--import'\'' \
          "${safe_gpg_secret_key_file}" \
          0</dev/null \
        ;
      ';
      case "${?}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}gpg --import${fR2} failed
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      'eval' '
        GNUPGHOME="${safe_gpg_import_directory}" \
        '"${gpg}"' \
          '\''--batch'\'' \
          '\''--no-tty'\'' \
          '\''--fingerprint'\'' \
          0</dev/null \
          1>"${safe_gpg_import_directory}"'\''/tmp'\'' \
        ;
      ';
      case "${?}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}gpg --fingerprint${fR2} failed
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      gpg_secret_key_fingerprint=`
        'eval' '
          '"${sed}"' \
            '\''-n'\'' \
            '\''
              /fingerprint/{
                s/^.*=//
                s/  *//g
                p
              }
            '\'' \
            0<"${safe_gpg_import_directory}"'\''/tmp'\'' \
          ;
        ';
      `;
      case "${?}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fy2}save-artifacts.sh:${fR2}   1. ${fB2}${safe_gpg_import_directory}/tmp${fR2}
${fy2}save-artifacts.sh:${fR2} and writing to: a command substitution
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      'cat' \
        0<<EOF2 \
        1>"${safe_gpg_import_directory}"'/gpg.conf' \
      ;
passphrase-file gpg-passphrase-file
EOF2
      s="${?}";
      case "${s}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}cat${fR2} failed
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      gpg_import_succeeded='yes';

    ;;
  esac;

  case "${gpg_import_succeeded}" in
    'no')
      'continue';
    ;;
  esac;

  case "${copy_ssh_secret_key_file}" in
    'yes')

      case "${copy_ssh_secret_key_file_attempted}" in
        'no')

          copy_ssh_secret_key_file_attempted='yes';

          'cp' \
            "${full_ssh_secret_key_file}" \
            "${full_ssh_secret_key_file_pointer}" \
            0</dev/null \
          ;
          s="${?}";
          case "${s}" in
            '0')
              ':';
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}cp${fR2} failed
EOF2
              exit_status='1';
              'continue';
            ;;
          esac;

          'chmod' \
            '400' \
            "${full_ssh_secret_key_file_pointer}" \
            0</dev/null \
          ;
          case "${?}" in
            '0')
              ':';
            ;;
            *)
              'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}chmod${fR2} failed
EOF2
              exit_status='1';
              'continue';
            ;;
          esac;

          copy_ssh_secret_key_file_succeeded='yes';

        ;;
      esac;

      case "${copy_ssh_secret_key_file_succeeded}" in
        'no')
          'continue';
        ;;
      esac;

    ;;
  esac;

  case "${ssh_known_hosts_file}" in
    '')
      ssh_known_hosts_argument='StrictHostKeyChecking=no';
    ;;
    *)
      ssh_known_hosts_argument='UserKnownHostsFile='"${full_ssh_known_hosts_file}";
    ;;
  esac;

  case "${git_clone_attempted}" in
    'no')

      git_clone_attempted='yes';

      'rm' \
        '-f' \
        '-r' \
        "${safe_git_clone_directory}" \
        0</dev/null \
      ;
      s="${?}";
      case "${s}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}rm${fR2} failed while deleting:
${fy2}save-artifacts.sh:${fR2}   1. ${fB2}${git_clone_directory}${fR2}
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      'eval' '
        GIT_SSH_COMMAND='\''eval "$sshpass"'\''\'\'''\'' \
          -P "$sshpass_prompt" \
          -f "$full_ssh_passphrase_file" \
          ssh \
          -F /dev/null \
          -o IdentitiesOnly=yes \
          -o PasswordAuthentication=no \
          -o PreferredAuthentications=publickey \
          -o StrictHostKeyChecking=no \
          -o "$ssh_known_hosts_argument" \
          -i "$full_ssh_secret_key_file_pointer" \
        '\''\'\'''\'''\'' \
        full_ssh_passphrase_file="${full_ssh_passphrase_file}" \
        full_ssh_secret_key_file_pointer="${full_ssh_secret_key_file_pointer}" \
        ssh_known_hosts_argument="${ssh_known_hosts_argument}" \
        sshpass="${sshpass}" \
        sshpass_prompt="${sshpass_prompt}" \
        '"${git}"' \
          '\''clone'\'' \
          -- \
          "${repository}" \
          "${safe_git_clone_directory}" \
          0</dev/null \
        ;
      ';
      s="${?}";
      case "${s}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}git clone${fR2} failed while cloning:
${fy2}save-artifacts.sh:${fR2}   ${fB2}${repository}${fR2}
${fy2}save-artifacts.sh:${fR2} into:
${fy2}save-artifacts.sh:${fR2}   ${fB2}${git_clone_directory}${fR2}
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      git_clone_succeeded='yes';

    ;;
  esac;

  case "${git_clone_succeeded}" in
    'no')
      'continue';
    ;;
  esac;

  case "${gpg_wrapper_attempted}" in
    'no')

      gpg_wrapper_attempted='yes';

      'cat' \
        0<<EOF2 \
        1>"${safe_temporary_directory}"'/gpg_wrapper' \
      ;
#! /bin/sh -
${gpg} \\
  '--batch' \\
  '--no-tty' \\
  "\${@}" \\
;
EOF2
      s="${?}";
      case "${s}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}cat${fR2} failed
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      'chmod' \
        '+x' \
        "${safe_temporary_directory}"'/gpg_wrapper' \
        0</dev/null \
      ;
      case "${?}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}chmod${fR2} failed
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      gpg_wrapper_succeeded='yes';

    ;;
  esac;

  case "${gpg_wrapper_succeeded}" in
    'no')
      'continue';
    ;;
  esac;

  case "${date_command_attempted}" in
    'no')

      date_command_attempted='yes';

      date=`
        'eval' '
          '"${date_command}"'
        ';
      `;
      s="${?}";
      case "${s}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}${date_command}${fR2} failed
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      year=`
        'eval' '
          '"${sed}"' \
            '\''
              s/^\(....\).*/\1/
            '\'' \
            0<<EOF2 \
          ;
${date}
EOF2
        ';
      `;
      s="${?}";
      case "${s}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}${sed}${fR2} failed while reading from:
${fy2}save-artifacts.sh:${fR2}   1. a here-document
${fy2}save-artifacts.sh:${fR2} and writing to: a command substitution
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      date_command_succeeded='yes';

    ;;
  esac;

  case "${date_command_succeeded}" in
    'no')
      'continue';
    ;;
  esac;

  case "${version_command_attempted}" in
    'no')

      version_command_attempted='yes';

      version=`
        'eval' '
          '"${version_command}"'
        ';
      `;
      s="${?}";
      case "${s}" in
        '0')
          ':';
        ;;
        *)
          'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}${version_command}${fR2} failed
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
          exit_status='1';
          'continue';
        ;;
      esac;

      version_command_succeeded='yes';

    ;;
  esac;

  case "${version_command_succeeded}" in
    'no')
      'continue';
    ;;
  esac;

  case "${1}" in
    '/'*)
      safe_src="${1}";
    ;;
    *)
      safe_src='./'"${1}";
    ;;
  esac;

  basename_src=`
    'basename' \
      "${safe_src}" \
      0</dev/null \
    ;
  `;
  s="${?}";
  case "${s}" in
    '0')
      ':';
    ;;
    *)
      'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}basename${fR2} failed
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
      exit_status='1';
      'continue';
    ;;
  esac;

  relative_dst='';
  relative_dst="${relative_dst}""${root_prefix}";
  relative_dst="${relative_dst}""${year}";
  relative_dst="${relative_dst}"'/';
  relative_dst="${relative_dst}""${date}";
  relative_dst="${relative_dst}"'-';
  relative_dst="${relative_dst}""${version}";
  relative_dst="${relative_dst}"'/';
  relative_dst="${relative_dst}""${leaf_prefix}";
  relative_dst="${relative_dst}""${basename_src}";

  safe_dst='';
  safe_dst="${safe_dst}""${safe_git_clone_directory}";
  safe_dst="${safe_dst}"'/';
  safe_dst="${safe_dst}""${relative_dst}";

  dst_directory=`
    'dirname' \
      "${safe_dst}" \
      0</dev/null \
    ;
  `;
  s="${?}";
  case "${s}" in
    '0')
      ':';
    ;;
    *)
      'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}dirname${fR2} failed
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
      exit_status='1';
      'continue';
    ;;
  esac;

  case "${dst_directory}" in
    '/'*)
      safe_dst_directory="${dst_directory}";
    ;;
    *)
      safe_dst_directory='./'"${dst_directory}";
    ;;
  esac;

  'test' \
    '-f' \
    "${safe_dst}" \
  ;
  s="${?}";
  case "${s}" in
    '0')
      'continue';
    ;;
    '1')
      ':';
    ;;
    *)
      'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}test${fR2} failed
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
      exit_status='1';
      'continue';
    ;;
  esac;

  'mkdir' \
    '-p' \
    "${safe_dst_directory}" \
    0</dev/null \
  ;
  s="${?}";
  case "${s}" in
    '0')
      ':';
    ;;
    *)
      'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}mkdir -p${fR2} failed: ${fB2}${safe_dst_directory}${fR2}
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
      exit_status='1';
      'continue';
    ;;
  esac;

  'cp' \
    "${safe_src}" \
    "${safe_dst}" \
    0</dev/null \
  ;
  s="${?}";
  case "${s}" in
    '0')
      ':';
    ;;
    *)
      'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}cp${fR2} failed
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
      exit_status='1';
      'continue';
    ;;
  esac;

  'eval' '
    GNUPGHOME="${safe_gpg_import_directory}" \
    '"${gpg}"' \
      '\''--batch'\'' \
      '\''--no-options'\'' \
      '\''--no-tty'\'' \
      '\''--output'\'' \
      "${safe_dst}"'\''.sig'\'' \
      '\''--passphrase-file'\'' \
      "${safe_gpg_passphrase_file}" \
      '\''--detach-sign'\'' \
      "${safe_dst}" \
      0</dev/null \
    ;
  ';
  case "${?}" in
    '0')
      ':';
    ;;
    *)
      'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}gpg --detach-sign${fR2} failed
EOF2
      exit_status='1';
      'continue';
    ;;
  esac;

  'rm' \
    '-f' \
    "${safe_git_clone_directory}"'/gpg-passphrase-file' \
    0</dev/null \
  ;
  s="${?}";
  case "${s}" in
    '0')
      ':';
    ;;
    *)
      'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}rm${fR2} failed while deleting:
${fy2}save-artifacts.sh:${fR2}   1. ${fB2}${git_clone_directory}/gpg-passphrase-file${fR2}
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
      exit_status='1';
      'continue';
    ;;
  esac;

  'eval' '
    GIT_DIR="${safe_git_clone_directory}"'/.git' \
    GIT_WORK_TREE="${safe_git_clone_directory}" \
    '"${git}"' \
      add \
      --all \
      0</dev/null \
    ;
  ';
  s="${?}";
  case "${s}" in
    '0')
      ':';
    ;;
    *)
      'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}git add${fR2} failed
EOF2
      exit_status='1';
      'continue';
    ;;
  esac;

  'ln' \
    '-s' \
    "${full_gpg_passphrase_file}" \
    "${safe_git_clone_directory}"'/gpg-passphrase-file' \
    0</dev/null \
  ;
  s="${?}";
  case "${s}" in
    '0')
      ':';
    ;;
    *)
      'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}ln${fR2} failed
EOF2
      exit_status='1';
      'continue';
    ;;
  esac;

  (
    'cd' \
      "${safe_git_clone_directory}" \
      0</dev/null \
    && 'eval' '
      GNUPGHOME="${full_gpg_import_directory}" \
      '"${git}"' \
        '\''-c'\'' \
        '\''gpg.program='\''"${full_temporary_directory}"'\''/gpg_wrapper'\'' \
        '\''-c'\'' \
        '\''user.email='\''"${git_committer_email}" \
        '\''-c'\'' \
        '\''user.name='\''"${git_committer_name}" \
        '\''commit'\'' \
        '\''--gpg-sign=0x'\''"${gpg_secret_key_fingerprint}" \
        '\''--message=Add '\''"${relative_dst}" \
        0</dev/null \
      ;
    ';
  )
  s="${?}";
  case "${s}" in
    '0')
      ':';
    ;;
    *)
      'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}git commit${fR2} failed
EOF2
      exit_status='1';
      'continue';
    ;;
  esac;

  attempt_index='0';

  while ':'; do

    'eval' '
      GIT_DIR="${safe_git_clone_directory}"'/.git' \
      GIT_SSH_COMMAND='\''eval "${sshpass}"'\''\'\'''\'' -P"${sshpass_prompt}" -f"${full_ssh_passphrase_file}" ssh -o "${ssh_known_hosts_argument}" -i "${full_ssh_secret_key_file_pointer}"'\''\'\'''\'''\'' \
      GIT_WORK_TREE="${safe_git_clone_directory}" \
      full_ssh_passphrase_file="${full_ssh_passphrase_file}" \
      full_ssh_secret_key_file_pointer="${full_ssh_secret_key_file_pointer}" \
      ssh_known_hosts_argument="${ssh_known_hosts_argument}" \
      sshpass="${sshpass}" \
      sshpass_prompt="${sshpass_prompt}" \
      '"${git}"' \
        '\''push'\'' \
        '\''origin'\'' \
        '\''master:master'\'' \
        0</dev/null \
      ;
    ';
    s="${?}";
    case "${s}" in
      '0')
        'break';
      ;;
    esac;

    attempt_index=$((${attempt_index} + 1));

    'test' \
      "${attempt_index}" \
      '-lt' \
      "${push_attempts}" \
      0</dev/null \
    ;
    s="${?}";
    case "${s}" in
      '0')
        ':';
      ;;
      '1')
        'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ran out of attempts
EOF2
        exit_status='1';
        'continue' '2';
      ;;
      *)
        'cat' 0<<EOF2 1>&2;
${fy2}save-artifacts.sh:${fR2} ${fB2}test${fR2} failed
${fy2}save-artifacts.sh:${fR2} exit status: ${fB2}${s}${fR2}
EOF2
        exit_status='1';
        'continue' '2';
      ;;
    esac;

    sleep 5

    eval '
      \
        GIT_DIR=$safe_git_clone_directory/.git \
        GIT_SSH_COMMAND='\'' \
          $sshpass \
            -P "$sshpass_prompt" \
            -f "$full_ssh_passphrase_file" \
            ssh \
            -i "$full_ssh_secret_key_file_pointer" \
            -o "$ssh_known_hosts_argument" \
        '\'' \
        GIT_WORK_TREE=$safe_git_clone_directory \
        full_ssh_passphrase_file=$full_ssh_passphrase_file \
        full_ssh_secret_key_file_pointer=$full_ssh_secret_key_file_pointer \
        ssh_known_hosts_argument=$ssh_known_hosts_argument \
        sshpass=$sshpass \
        sshpass_prompt=$sshpass_prompt \
      '"$git"' \
        -c "gpg.program=$full_temporary_directory/gpg_wrapper" \
        -c "user.email=$git_committer_email" \
        -c "user.name=$git_committer_name" \
        pull --no-edit origin master \
      ;
    ' || {
      exit_status=1
      continue 2
    }

  done

done

exit $exit_status

|%}footer_comment({%|#|%}, {%|#|%}, {%|#|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
