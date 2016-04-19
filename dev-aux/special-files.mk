all:

## begin_rules

.PHONY: all

all:
	gatbps CC0-1.0.txt
	gatbps build-aux/docbook.am
	gatbps build-aux/plaintext.am
	gatbps build-aux/texinfo.css
	gatbps dev-aux/CC0-1.0-commit.txt
	gatbps dev-aux/CC0-1.0-file.txt
	gatbps dev-aux/Makefile.am.vim
	gatbps doc/texi/indent.texi

## end_rules

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
