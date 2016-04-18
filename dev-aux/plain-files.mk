all: INSTALL

## begin_rules

.PHONY: all

INSTALL: INSTALL.bot
INSTALL: INSTALL.texi
INSTALL: doc/texi/Building-and-Installation.texi
	gatbps INSTALL

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
