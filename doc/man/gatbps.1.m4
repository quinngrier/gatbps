changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|doc/man/gatbps.1.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/AWK_DEFAULT_TROFF.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_DATE_TROFF.m4|%}){%||%}dnl
include({%|src/tools/PACKAGE_VERSION.m4|%}){%||%}dnl
include({%|src/tools/SED_DEFAULT_TROFF.m4|%}){%||%}dnl
include({%|src/tools/TEXI2ANY_DEFAULT_TROFF.m4|%}){%||%}dnl
{%|.de nohy
.nh
\\$1
.hy
..
.de TPZ
.PD 0
.TP
.PD
..
.de IPEZ
.PD 0
.IP ""
.PD
..
.hy
.TH "gatbps" "1" "|%}PACKAGE_DATE_TROFF{%|" "GATBPS |%}PACKAGE_VERSION{%|"
.SH "NAME"
.LP
\fBgatbps\fR \- generate basic files for software packages
.SH "SYNOPSIS"
.LP
.nf
\fBgatbps\fR\ [<\fIargument\fR>]...
.fi
.SH "DESCRIPTION"
.LP
.nohy "\fBgatbps\fR"
generates basic files for software packages.
The arguments are processed one at a time, in order.
Each argument is classified either as an operand or (roughly) as an
option.
Each operand generates a file, and each option changes the overall
behavior of the program.
Each operand is classified by its file name as either special or plain.
There is a fixed list of special files, and any other file is plain.
Each special file is fixed in content, with examples including copyright
texts and scripts to be used with the build system.
Each plain file is generated as the plain text output of a corresponding
Texinfo file, which is useful for writing files like
.nohy "\fBREADME\fR"
and
.nohy "\fBINSTALL\fR."
.SH "OPTIONS"
.LP
Each option has one or more names, and each name is either long or
short.
Each long name consists of two
.nohy "\fB\-\fR\c"
\~characters
followed by zero or more characters except the
.nohy "\fB=\fR\c"
\~character,
and each short name consists of one
.nohy "\fB\-\fR\c"
\~character
followed by one character except the
.nohy "\fB\-\fR\c"
\~character.
Each option either requires, permits, or forbids a value.
.LP
Let
.nohy "\fB\-\-\fIL\fR"
and\~\c
.nohy "\fB\-\fIS\fR"
be long and short names for an option, and let
.nohy "\fIV\fR"
be a value.
If the option requires a value, then it may be written as either
.nohy "\fB\-\-\fIL\fB=\fIV\fR,"
.nohy "\fB\-\-\fIL\ V\fR,"
.nohy "\fB\-\fISV\fR,"
or\~\c
.nohy "\fB\-\fIS\ V\fR."
If the option permits a value, then it may be written as either
.nohy "\fB\-\-\fIL\fB=\fIV\fR,"
.nohy "\fB\-\-\fIL\fR,"
.nohy "\fB\-\fISV\fR,"
or\~\c
.nohy "\fB\-\fIS\fR."
If the option forbids a value, then it may be written as either
.nohy "\fB\-\-\fIL\fR"
or\~\c
.nohy "\fB\-\fIS\fR,"
and in the latter case it may be combined with an immediately following
option or combination of options by deleting the
.nohy "\fB\-\fIS\fR\c"
\~argument
and inserting the
.nohy "\fIS\fR\c"
\~character
into the following argument just after the leading
.nohy "\fB\-\fR\c"
\~character.
For example,
.nohy "\fB\-\fIS\ \fB\-\fIK\fR"
and\~\c
.nohy "\fB\-\fIS\ \fB\-\-\fIK\fR"
may be written as
.nohy "\fB\-\fISK\fR"
and\~\c
.nohy "\fB\-\fIS\fB\-\fIK\fR,"
respectively.
.LP
The following options are supported:
.TP
.nohy "\fB\-\-\fR"
.IPEZ
The
.nohy "\fB\-\-\fR"
option disables option detection, causing all remaining arguments to be
interpreted as operands.
.TP
.nohy "\fB\-\-all\fR[\fB=\fIV\fR]"
.TPZ
.nohy "\fB\-a\fR[\fIV\fR]"
.IPEZ
The
.nohy "\fB\-\-all\fR[\fB=\fIV\fR]"
option inserts the names of all special files in front of the remaining
arguments.
Each name is prefixed with
.nohy "\fIV\fR."
If
.nohy "\fIV\fR"
is omitted, then it is taken to be empty.
If
.nohy "\fIV\fR"
is not empty and does not end with a slash character, then a slash
character is appended to
.nohy "\fIV\fR."
If
.nohy "\fIV\fR"
begins with a hyphen-minus character, then a period character and a
slash character are prepended to
.nohy "\fIV\fR."
Note that no special file name begins with a hyphen-minus character.
.TP
.nohy "\fB\-\-awk=\fIV\fR"
.IPEZ
The
.nohy "\fB\-\-awk=\fIV\fR"
option sets the command name
that will be used to invoke the
.nohy "\fBawk\fR"
program to
.nohy "\fIV\fR."
If
.nohy "\fIV\fR"
is
.nohy "\fBauto\fR,"
then the command name is inferred.
The copy of the
program that corresponds
to this copy of the man page
behaves as if an instance of the
.nohy "\fB\-\-awk=|%}AWK_DEFAULT_TROFF{%|\fR"
option were added to the
arguments at a position that
lies before all original arguments
and before any argument added by the
.nohy "\fBAWK\fR"
environment variable.
Other copies may use other initial values.
.TP
.nohy "\fB\-\-boundary\fR"
.TPZ
.nohy "\fB\-b\fR"
.IPEZ
The
.nohy "\fB\-\-boundary\fR"
option enables recursion
for the next operand but
not for its prerequisites.
.TP
.nohy "\fB\-\-dry\-run\fR"
.TPZ
.nohy "\fB\-n\fR"
.IPEZ
The
.nohy "\fB\-\-dry\-run\fR"
option enables printing and disables generation.
.TP
.nohy "\fB\-\-help\fR[\fB=\fIV\fR]"
.IPEZ
The
.nohy "\fB\-\-help\fR[\fB=\fIV\fR]"
option writes text to standard output and
causes all remaining arguments to be ignored.
If
.nohy "\fIV\fR"
is omitted, then
the text is a short description of the program.
Otherwise, the text is a short description
of the file that would be generated by the
.nohy "\fBgatbps\ \-\-\ \fIV\fR"
command.
.TP
.nohy "\fB\-\-man\fR"
.IPEZ
The
.nohy "\fB\-\-man\fR"
option writes text to standard output and
causes all remaining arguments to be ignored.
The text is the source code
of the program's man page,
which can be processed with any
command that is analogous to the
.nohy "\fBtbl\ |\ nroff\ \-man\fR"
command.
In particular, the
.nohy "\fBman\ \-l\ \-\fR"
command can be used on most systems.
.TP
.nohy "\fB\-\-no\-dry\-run\fR"
.TPZ
.nohy "\fB\-N\fR"
.IPEZ
The
.nohy "\fB\-\-no\-dry\-run\fR"
option disables printing and enables generation.
However, printing remains enabled if the
.nohy "\fB\-\-verbose\fR"
option is in effect.
.TP
.nohy "\fB\-\-no\-recursive\fR"
.TPZ
.nohy "\fB\-R\fR"
.IPEZ
The
.nohy "\fB\-\-no\-recursive\fR"
option disables recursion.
However, this does not affect the
.nohy "\fB\-\-boundary\fR"
option.
.TP
.nohy "\fB\-\-no\-verbose\fR"
.TPZ
.nohy "\fB\-V\fR"
.IPEZ
The
.nohy "\fB\-\-no\-verbose\fR"
option disables printing.
However, printing remains enabled if the
.nohy "\fB\-\-dry\-run\fR"
option is in effect.
.TP
.nohy "\fB\-\-recursive\fR"
.TPZ
.nohy "\fB\-r\fR"
.IPEZ
The
.nohy "\fB\-\-recursive\fR"
option enables recursion.
.TP
.nohy "\fB\-\-sed=\fIV\fR"
.IPEZ
The
.nohy "\fB\-\-sed=\fIV\fR"
option sets the command name
that will be used to invoke the
.nohy "\fBsed\fR"
program to
.nohy "\fIV\fR."
If
.nohy "\fIV\fR"
is
.nohy "\fBauto\fR,"
then the command name is inferred.
The copy of the
program that corresponds
to this copy of the man page
behaves as if an instance of the
.nohy "\fB\-\-sed=|%}SED_DEFAULT_TROFF{%|\fR"
option were added to the
arguments at a position that
lies before all original arguments
and before any argument added by the
.nohy "\fBSED\fR"
environment variable.
Other copies may use other initial values.
.TP
.nohy "\fB\-\-style\fR[\fB=\fIV\fR]"
.IPEZ
The
.nohy "\fB\-\-style\fR[\fB=\fIV\fR]"
option prepends an instance of the
.nohy "\fB\-\-style\-stderr\fR"
option and an instance of the
.nohy "\fB\-\-style\-stdout\fR"
option to the remaining arguments.
If
.nohy "\fIV\fR"
is omitted, then neither
instance is given a value.
Otherwise, both are given the value
.nohy "\fIV\fR."
.TP
.nohy "\fB\-\-style\-stderr\fR[\fB=\fIV\fR]"
.IPEZ
The
.nohy "\fB\-\-style\-stderr\fR[\fB=\fIV\fR]"
option enables or disables bold,
underline, and color styling of
text written to standard error,
which is initially disabled.
If
.nohy "\fIV\fR"
is omitted, then it is taken to be
.nohy "\fBalways\fR."
If
.nohy "\fIV\fR"
is
.nohy "\fBalways\fR,"
then styling is enabled.
If
.nohy "\fIV\fR"
is
.nohy "\fBnever\fR,"
then styling is disabled.
If
.nohy "\fIV\fR"
is
.nohy "\fBauto\fR,"
then styling is enabled
if standard error is associated
with a terminal or disabled if not.
Any other value causes an error.
.TP
.nohy "\fB\-\-style\-stdout\fR[\fB=\fIV\fR]"
.IPEZ
The
.nohy "\fB\-\-style\-stdout\fR[\fB=\fIV\fR]"
option enables or disables bold,
underline, and color styling of
text written to standard output,
which is initially disabled.
If
.nohy "\fIV\fR"
is omitted, then it is taken to be
.nohy "\fBalways\fR."
If
.nohy "\fIV\fR"
is
.nohy "\fBalways\fR,"
then styling is enabled.
If
.nohy "\fIV\fR"
is
.nohy "\fBnever\fR,"
then styling is disabled.
If
.nohy "\fIV\fR"
is
.nohy "\fBauto\fR,"
then styling is enabled
if standard output is associated
with a terminal or disabled if not.
Any other value causes an error.
.TP
.nohy "\fB\-\-texi2any=\fIV\fR"
.IPEZ
The
.nohy "\fB\-\-texi2any=\fIV\fR"
option sets the command name
that will be used to invoke the
.nohy "\fBtexi2any\fR"
program to
.nohy "\fIV\fR."
If
.nohy "\fIV\fR"
is
.nohy "\fBauto\fR,"
then the command name is inferred.
The copy of the
program that corresponds
to this copy of the man page
behaves as if an instance of the
.nohy "\fB\-\-texi2any=|%}TEXI2ANY_DEFAULT_TROFF{%|\fR"
option were added to the
arguments at a position that
lies before all original arguments
and before any argument added by the
.nohy "\fBTEXI2ANY\fR"
environment variable.
Other copies may use other initial values.
.TP
.nohy "\fB\-\-verbose\fR"
.TPZ
.nohy "\fB\-v\fR"
.IPEZ
The
.nohy "\fB\-\-verbose\fR"
option enables printing.
.TP
.nohy "\fB\-\-version\fR"
.IPEZ
The
.nohy "\fB\-\-version\fR"
option writes text to standard output and
causes all remaining arguments to be ignored.
The text is the program's
name, package, version number,
release date, and copyright information.
.SH "OPERANDS"
.LP
Each operand is
processed in three phases:
printing, generation, and recursion.
Printing writes the
operand to standard output,
generation creates the file,
and recursion prepends the
names of prerequisite special
files to the remaining arguments.
Recursion also maintains the
directory part of the operand.
Various options
can be used to enable
or disable each phase,
but printing and generation
cannot be simultaneously disabled.
By default, only generation is enabled.
.SH "STDIN"
.LP
Not used.
.SH "INPUT FILES"
.LP
For each plain
file\~\c
.nohy "\fIX\fR"
that is generated, the input file
.nohy "\fIX\fB.texi\fR"
is required and the input files
.nohy "\fIX\fB.top\fR,"
.nohy "\fIX\fB.top.texi\fR,"
.nohy "\fIX\fB.bot\fR,"
and
.nohy "\fIX\fB.bot.texi\fR"
are optional.
.SH "ENVIRONMENT VARIABLES"
.LP
The following environment variables are supported:
.TP
.nohy "\fBAWK\fR"
.IPEZ
If the
.nohy "\fBAWK\fR"
environment variable
is set and has value
.nohy "\fIV\fR,"
then an instance of the
.nohy "\fB\-\-awk=\fIV\fR"
option is added to the
arguments at a position that
lies before all original arguments
and after the implicit initial instance.
Otherwise, the
.nohy "\fBAWK\fR"
environment variable has no effect.
.TP
.nohy "\fBSED\fR"
.IPEZ
If the
.nohy "\fBSED\fR"
environment variable
is set and has value
.nohy "\fIV\fR,"
then an instance of the
.nohy "\fB\-\-sed=\fIV\fR"
option is added to the
arguments at a position that
lies before all original arguments
and after the implicit initial instance.
Otherwise, the
.nohy "\fBSED\fR"
environment variable has no effect.
.TP
.nohy "\fBSTYLE\fR"
.IPEZ
If the
.nohy "\fBSTYLE\fR"
environment variable
is set and has value
.nohy "\fIV\fR,"
then an instance of the
.nohy "\fB\-\-style=\fIV\fR"
option is added to the
arguments at a position that
lies before all original arguments
and before any arguments added by the
.nohy "\fBSTYLE_STDERR\fR"
and
.nohy "\fBSTYLE_STDOUT\fR"
environment variables.
Otherwise, the
.nohy "\fBSTYLE\fR"
environment variable has no effect.
.TP
.nohy "\fBSTYLE_STDERR\fR"
.IPEZ
If the
.nohy "\fBSTYLE_STDERR\fR"
environment variable
is set and has value
.nohy "\fIV\fR,"
then an instance of the
.nohy "\fB\-\-style\-stderr=\fIV\fR"
option is added to the
arguments at a position that
lies before all original arguments
and after any argument added by the
.nohy "\fBSTYLE\fR"
environment variable.
Otherwise, the
.nohy "\fBSTYLE_STDERR\fR"
environment variable has no effect.
.TP
.nohy "\fBSTYLE_STDOUT\fR"
.IPEZ
If the
.nohy "\fBSTYLE_STDOUT\fR"
environment variable
is set and has value
.nohy "\fIV\fR,"
then an instance of the
.nohy "\fB\-\-style\-stdout=\fIV\fR"
option is added to the
arguments at a position that
lies before all original arguments
and after any argument added by the
.nohy "\fBSTYLE\fR"
environment variable.
Otherwise, the
.nohy "\fBSTYLE_STDOUT\fR"
environment variable has no effect.
.TP
.nohy "\fBTEXI2ANY\fR"
.IPEZ
If the
.nohy "\fBTEXI2ANY\fR"
environment variable
is set and has value
.nohy "\fIV\fR,"
then an instance of the
.nohy "\fB\-\-texi2any=\fIV\fR"
option is added to the
arguments at a position that
lies before all original arguments
and after the implicit initial instance.
Otherwise, the
.nohy "\fBTEXI2ANY\fR"
environment variable has no effect.
.SH "ASYNCHRONOUS EVENTS"
.LP
Default.
.SH "STDOUT"
.LP
For each operand
.nohy "\fIX\fR"
for which printing is enabled,
.nohy "\fIX\fR"
followed by either a
newline or null character
is written to standard output.
The
.nohy "\fB\-\-help\fR,"
.nohy "\fB\-\-man\fR,"
and
.nohy "\fB\-\-version\fR"
options also write to standard output.
.SH "STDERR"
.LP
Each error causes a message
to be written to standard error.
Each line
of the message
is punctuated by either
an exclamation mark, colon,
or period character, which
indicate fatal, cautionary, and
informational errors, respectively.
If styling is enabled with the
.nohy "\fB\-\-style\-stderr\fR"
option, then
each line begins with
red, yellow, or cyan text if
the error is fatal, cautionary,
or informational, respectively.
Underlying programs
may also write their own
messages to standard error.
.SH "OUTPUT FILES"
.LP
For each
operand\~\c
.nohy "\fIX\fR"
for which generation is enabled (see the OPERANDS section), the output
file\~\c
.nohy "\fIX\fR"
is attempted to be generated, and the ten files
.nohy "\fIX\fB.tmp0\fR"
to\~\c
.nohy "\fIX\fB.tmp9\fR"
are reserved for temporary use during this process.
Generation begins by attempting to delete the output file and the
temporary files with individual
.nohy "\fBrm\ \-f\fR"
commands.
If at least one of these commands fails, then generation ends.
Otherwise, the output file is attempted to be generated.
If this fails, then the state of the output file is unspecified.
Regardless of whether this fails, generation ends by attempting to
delete the temporary files again.
If the program is terminated by a signal during generation, then the
state of the output file and the temporary files is unspecified.
.SH "PLAIN FILES"
.SH "COPYRIGHT TEXTS"
.SH "WRITING MATHEMATICAL NOTATION IN TEXINFO"
.LP
GATBPS provides a set of special files to support an alternative
approach to writing mathematical notation in Texinfo.
This approach produces reasonable output in all output formats,
including ASCII plain text.
.SH "WRITING MATHEMATICAL EXPRESSIONS TWICE"
.LP
The idea is to write two versions of each mathematical expression: one
with the
.nohy "\fB@tex\fR"
environment, and the other with the
.nohy "\fB@ifnottex\fR"
environment.
The
.nohy "\fB@tex\fR"
version is considered to define the standard appearance of the
expression, and the
.nohy "\fB@ifnottex\fR"
version should try to imitate it.
For example,
.nohy "\fIx\fR\ +\ \fIy\fR"
can be written as follows:
.IP
.nf
@tex
$x\ +\ y$
@end\ tex
@ifnottex
@i{x}\ +\ @i{y}
@end\ ifnottex
.fi
.LP
Here, the
.nohy "\fB@i\fR"
command has no effect on the
.nohy "\fIx\fR"
and
.nohy "\fIy\fR"
characters in plain text but makes them italic in the other output
formats.
The end result is an expression that looks reasonable in every output
format:
.nohy "\fIx\fR\ +\ \fIy\fR."
.LP
The macros are then used in the
.nohy "\fB@ifnottex\fR"
block to imitate various features of TeX.
For example, the
.nohy "\fB@mdot\fR"
macro imitates the
.nohy "\fB\ecdot\fR"
control sequence.
The macro names have been chosen
to avoid collisions with the names of
Texinfo commands and TeX control sequences,
as recommended by the Texinfo manual.
.LP
Each macro
.nohy "\fB@\fIM\fR"
is defined by the
.nohy "\fIM\fB.texi\fR"
special file, which also uses the
.nohy "\fIM\fBtexi\fR"
flag as an include guard so
that including the special file
multiple times is equivalent to
including it only the first time.
For example, the
.nohy "\fB@mdot\fR"
macro is defined by the
.nohy "\fBmdot.texi\fR"
special file, which also uses the
.nohy "\fBmdottexi\fR"
flag as an include guard.
The
.nohy "\fBmath.texi\fR"
special file is also provided, which includes every
.nohy "\fIM\fB.texi\fR"
special file.
It can be generated under the effect of the
.nohy "\fB\-\-recursive\fR"
option to generate all
.nohy "\fIM\fB.texi\fR"
special files at once.
.LP
The macros insert symbols
as UTF-8 characters in Info
and plain text and as numeric
character references in DocBook,
HTML, and XML by default, or as ASCII
alternatives in all output formats if the
.nohy "\fBinsertascii\fR"
flag is set at their points of inclusion.
For example, the
.nohy "\fB@mdot\fR"
macro inserts a UTF-8
dot operator character in
Info and plain text and an
.nohy "\fB&#x22C5;\fR"
character reference
in DocBook, HTML, and
XML by default, or an ASCII
.nohy "\fB*\fR"
character in all output formats if the
.nohy "\fBinsertascii\fR"
flag is set at its point of inclusion.
.LP
In DocBook, HTML, and XML, the macros use the
.nohy "\fB@inlineraw\fR"
command to insert
numeric character references.
This command was
added in Texinfo 5.0,
which was released on 2013\-02\-16.
The macros automatically
detect older versions of
Texinfo, in which case they
insert UTF-8 characters instead.
.SH "WRITING MATHEMATICAL SYMBOLS"
.LP
The following table lists the
macros that have no parameters,
which insert individual symbols.
Along with each macro is its corresponding TeX syntax, the Unicode
character that it inserts by default, and the ASCII alternative that it
inserts if the
.nohy "\fBinsertascii\fR"
flag was set at its first point of inclusion.
.IP
.TS
tab( );
l l l l .
TeX Macro Unicode ASCII
' @prm{} U+2032 '
'' @dprm{} U+2033 ''
''' @tprm{} U+2034 '''
'''' @qprm{} U+2057 ''''
\- @msign{} U+2212 \-
/ @dslash{} U+2215 /
\eLeftarrow @ldarrow{} U+21D0 <=
\eLeftrightarrow @bdarrow{} U+21D4 <=>
\eLongleftarrow @lldarrow{} U+27F8 <==
\eLongleftrightarrow @lbdarrow{} U+27FA <==>
\eLongrightarrow @lrdarrow{} U+27F9 ==>
\eRightarrow @rdarrow{} U+21D2 =>
\ecdot @mdot{} U+22C5 *
\ecdots @mdots{} U+22EF ...
\ege @gequ{} U+2265 >=
\elceil @lcei{} U+2308 ceil(
\eldots @bdots{} U+2026 ...
\ele @lequ{} U+2264 <=
\eleftarrow @larrow{} U+2190 <\-
\eleftrightarrow @barrow{} U+2194 <\->
\elfloor @lflo{} U+230A floor(
\elongleftarrow @llarrow{} U+27F5 <\-\-
\elongleftrightarrow @lbarrow{} U+27F7 <\-\->
\elongrightarrow @lrarrow{} U+27F6 \-\->
\ene @nequ{} U+2260 !=
\erceil @rcei{} U+2309 )
\erfloor @rflo{} U+230B )
\erightarrow @rarrow{} U+2192 \->
.TE
.LP
The
.nohy "\fB@sps{\fIL\fB,\ \fIS\fB,\ \fIR\fB}\fR"
and
.nohy "\fB@sbs{\fIL\fB,\ \fIS\fB,\ \fIR\fB}\fR"
macros are provided for inserting
.nohy "\fIS\fR"
as a superscript or subscript.
In DocBook,
.nohy "\fIL\fR"
and
.nohy "\fIR\fR"
are ignored and
.nohy "\fIS\fR"
is inserted inside a
.nohy "\fB<superscript>\fR"
or
.nohy "\fB<subscript>\fR"
element.
In HTML and XML,
.nohy "\fIL\fR"
and
.nohy "\fIR\fR"
are ignored and
.nohy "\fIS\fR"
is inserted inside a
.nohy "\fB<sup>\fR"
or
.nohy "\fB<sub>\fR"
element.
In Info and plain text, an ASCII
.nohy "\fB^\fR"
or
.nohy "\fB_\fR"
character is inserted, followed by
.nohy "\fIL\fR,"
then
.nohy "\fIS\fR,"
then
.nohy "\fIR\fR,"
so that
.nohy "\fIL\fR"
and
.nohy "\fIR\fR"
serve as parentheses around
.nohy "\fIS\fR."
Note that
.nohy "\fIL\fR"
and
.nohy "\fIR\fR"
may be left blank.
For example, the following code produces
.nohy "\fBx^(y\ +\ z_w)\fR"
in Info and plain text:
.IP
.nf
@tex
$x^{y\ +\ z_w}$
@end\ tex
@ifnottex
@i{x}@sps{(,\ @i{y}\ +\ @i{z}@sbs{,\ @i{w},\ },\ )}
@end\ ifnottex
.fi
.LP
In DocBook, HTML, and XML, the
.nohy "\fB@sps\fR"
and
.nohy "\fB@sbs\fR"
macros use the
.nohy "\fB@inlineraw\fR"
command to insert
superscript and subscript elements.
This command was
added in Texinfo 5.0,
which was released on 2013\-02\-16.
The macros automatically
detect older versions of
Texinfo, in which case they
behave as if the output format
were Info or plain text instead.
.SH "SPECIAL FILE REFERENCE"
.LP
This section provides a short
description of each special file.
Along with each
short description is a
cross-reference to where the
full description can be found.
If a special file
supports comments,
then its short description is also
included in a comment at the top of the file.
The short descriptions can
also be shown by using the
.nohy "\fB\-\-help=\fIS\fR"
option.
.TP
.nohy "\fBCC0\-1.0\-AC\-COPYRIGHT.ac\fR"
.IPEZ
The
.nohy "\fBCC0\-1.0\-AC\-COPYRIGHT.ac\fR"
special file calls the
.nohy "\fBAC_COPYRIGHT\fR"
Autoconf macro with a message stating that some parts of the script
are from the package and that the authors of those parts have waived
their rights to them by referencing the
.nohy "\fBCC0\-1.0.txt\fR"
special file.
It can be included in an Autoconf file where the
.nohy "\fBAC_COPYRIGHT\fR"
call is desired to occur.
.TP
.nohy "\fBCC0\-1.0\-AM\-COPYRIGHT.am\fR"
.IPEZ
The
.nohy "\fBCC0\-1.0\-AM\-COPYRIGHT.am\fR"
special file contains an Automake comment
that states that some parts of the
.nohy "\fBMakefile\fR"
are from the package, and
that the authors of those parts have waived their rights to them by
referencing the
.nohy "\fBCC0\-1.0.txt\fR"
special file.
This can be included in
another Automake file with the
.nohy "\fBinclude\fR"
directive where the comment is
desired to appear.
.TP
.nohy "\fBCC0\-1.0\-appendix.texi\fR"
.IPEZ
The
.nohy "\fBCC0\-1.0\-appendix.texi\fR"
special file is a Texinfo appendix that contains the complete text of
the Creative Commons Zero
(CC0)\~1.0
Universal Public Domain Dedication.
It can be included in a Texinfo document where the appendix is desired
to appear.
The appendix is labeled with
.nohy "\fB@node\fR"
.nohy "\fBCreative\fR"
.nohy "\fBCommons\fR"
.nohy "\fBZero@tie{}@w{1\-0}\fR"
so that it maintains the usual node structure and can be
cross-referenced.
.IP
For more information, see the COPYRIGHT TEXTS section.
.TP
.nohy "\fBCC0\-1.0\-commit.txt\fR"
.IPEZ
The
.nohy "\fBCC0\-1.0\-commit.txt\fR"
special file is a commit
message template that states that
the author of the commit has waived
their rights to it by cross-referencing the
.nohy "\fBCC0\-1.0.txt\fR"
special file.
This can be used, for example, with Git's
.nohy "\fBcommit.template\fR"
configuration variable.
.IP
For more information, see the COPYRIGHT TEXTS section.
.TP
.nohy "\fBCC0\-1.0\-copying.texi\fR"
.IPEZ
The
.nohy "\fBCC0\-1.0\-copying.texi\fR"
special file invokes the
.nohy "\fB@copying\fR"
Texinfo command with a message stating that the authors of the manual
have waived their rights to it by cross-referencing the appendix of the
.nohy "\fBCC0\-1.0\-appendix.texi\fR"
special file.
It can be included in a Texinfo document where the invocation of the
.nohy "\fB@copying\fR"
command is desired to occur.
.IP
For more information, see the COPYRIGHT TEXTS section.
.TP
.nohy "\fBCC0\-1.0\-file.txt\fR"
.IPEZ
The
.nohy "\fBCC0\-1.0\-file.txt\fR"
special file contains
a message stating that the
authors of the file have waived their
rights to it by cross-referencing the
.nohy "\fBCC0\-1.0.txt\fR"
special file.
This can be used
as a copyright notice
in a wide variety of files.
.IP
For more information, see the COPYRIGHT TEXTS section.
.TP
.nohy "\fBCC0\-1.0.txt\fR"
.IPEZ
The
.nohy "\fBCC0\-1.0.txt\fR"
special file is the
plain text version of the
Creative Commons Zero (CC0) 1.0
Universal Public Domain Dedication.
.IP
For more information, see the COPYRIGHT TEXTS section.
.TP
.nohy "\fBTEST_EXIT.h\fR"
.IPEZ
The
.nohy "\fBTEST_EXIT.h\fR"
special file is a C header file that defines the
.nohy "\fBTEST_EXIT_ERROR\fR,"
.nohy "\fBTEST_EXIT_FAIL\fR,"
.nohy "\fBTEST_EXIT_PASS\fR,"
and
.nohy "\fBTEST_EXIT_SKIP\fR"
macros to
.nohy "\fB99\fR,"
.nohy "\fB1\fR,"
.nohy "\fB0\fR,"
and
.nohy "\fB77\fR,"
respectively.
These are the exit status values used by GNU Automake for a test suite
with no test protocol.
.TP
.nohy "\fBbarrow.texi\fR"
.IPEZ
The
.nohy "\fBbarrow.texi\fR"
special file defines the
.nohy "\fB@barrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \eleftrightarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @barrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBbdarrow.texi\fR"
.IPEZ
The
.nohy "\fBbdarrow.texi\fR"
special file defines the
.nohy "\fB@bdarrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \eLeftrightarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @bdarrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBbdots.texi\fR"
.IPEZ
The
.nohy "\fBbdots.texi\fR"
special file defines the
.nohy "\fB@bdots\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$1,\ \eldots,\ n$
@end\ tex
@ifnottex
@w{1@comma{}\ @bdots{}@comma{}\ @i{n}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBdprm.texi\fR"
.IPEZ
The
.nohy "\fBdprm.texi\fR"
special file defines the
.nohy "\fB@dprm\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$x''$
@end\ tex
@ifnottex
@w{@i{x}@dprm{}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBdslash.texi\fR"
.IPEZ
The
.nohy "\fBdslash.texi\fR"
special file defines the
.nohy "\fB@dslash\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$x\ /\ y$
@end\ tex
@ifnottex
@w{@i{x}\ @dslash{}\ @i{y}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBgequ.texi\fR"
.IPEZ
The
.nohy "\fBgequ.texi\fR"
special file defines the
.nohy "\fB@gequ\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$x\ \ege\ y$
@end\ tex
@ifnottex
@w{@i{x}\ @gequ{}\ @i{y}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBlarrow.texi\fR"
.IPEZ
The
.nohy "\fBlarrow.texi\fR"
special file defines the
.nohy "\fB@larrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \eleftarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @larrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBlbarrow.texi\fR"
.IPEZ
The
.nohy "\fBlbarrow.texi\fR"
special file defines the
.nohy "\fB@lbarrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \elongleftrightarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @lbarrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBlbdarrow.texi\fR"
.IPEZ
The
.nohy "\fBlbdarrow.texi\fR"
special file defines the
.nohy "\fB@lbdarrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \eLongleftrightarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @lbdarrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBlcei.texi\fR"
.IPEZ
The
.nohy "\fBlcei.texi\fR"
special file defines the
.nohy "\fB@lcei\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$\elceil\ x\ \erceil$
@end\ tex
@ifnottex
@w{@lcei{}@i{x}@rcei{}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBldarrow.texi\fR"
.IPEZ
The
.nohy "\fBldarrow.texi\fR"
special file defines the
.nohy "\fB@ldarrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \eLeftarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @ldarrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBlequ.texi\fR"
.IPEZ
The
.nohy "\fBlequ.texi\fR"
special file defines the
.nohy "\fB@lequ\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$x\ \ele\ y$
@end\ tex
@ifnottex
@w{@i{x}\ @lequ{}\ @i{y}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBlflo.texi\fR"
.IPEZ
The
.nohy "\fBlflo.texi\fR"
special file defines the
.nohy "\fB@lflo\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$\elfloor\ x\ \erfloor$
@end\ tex
@ifnottex
@w{@lflo{}@i{x}@rflo{}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBllarrow.texi\fR"
.IPEZ
The
.nohy "\fBllarrow.texi\fR"
special file defines the
.nohy "\fB@llarrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \elongleftarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @llarrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBlldarrow.texi\fR"
.IPEZ
The
.nohy "\fBlldarrow.texi\fR"
special file defines the
.nohy "\fB@lldarrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \eLongleftarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @lldarrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBlrarrow.texi\fR"
.IPEZ
The
.nohy "\fBlrarrow.texi\fR"
special file defines the
.nohy "\fB@lrarrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \elongrightarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @lrarrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBlrdarrow.texi\fR"
.IPEZ
The
.nohy "\fBlrdarrow.texi\fR"
special file defines the
.nohy "\fB@lrdarrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \eLongrightarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @lrdarrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBmath.texi\fR"
.IPEZ
The
.nohy "\fBmath.texi\fR"
special file is a Texinfo file
that includes every special file
that defines a macro for imitating
the mathematical notation of TeX in
the other output formats.
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBmdot.texi\fR"
.IPEZ
The
.nohy "\fBmdot.texi\fR"
special file defines the
.nohy "\fB@mdot\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$x\ \ecdot\ y$
@end\ tex
@ifnottex
@w{@i{x}\ @mdot{}\ @i{y}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBmdots.texi\fR"
.IPEZ
The
.nohy "\fBmdots.texi\fR"
special file defines the
.nohy "\fB@mdots\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$1\ +\ \ecdots\ +\ n$
@end\ tex
@ifnottex
@w{1\ +\ @mdots{}\ +\ @i{n}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBmsign.texi\fR"
.IPEZ
The
.nohy "\fBmsign.texi\fR"
special file defines the
.nohy "\fB@msign\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$x\ \-\ y$
@end\ tex
@ifnottex
@w{@i{x}\ @msign{}\ @i{y}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBnequ.texi\fR"
.IPEZ
The
.nohy "\fBnequ.texi\fR"
special file defines the
.nohy "\fB@nequ\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$x\ \ene\ y$
@end\ tex
@ifnottex
@w{@i{x}\ @nequ{}\ @i{y}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBprm.texi\fR"
.IPEZ
The
.nohy "\fBprm.texi\fR"
special file defines the
.nohy "\fB@prm\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$x'$
@end\ tex
@ifnottex
@w{@i{x}@prm{}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBqprm.texi\fR"
.IPEZ
The
.nohy "\fBqprm.texi\fR"
special file defines the
.nohy "\fB@qprm\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$x''''$
@end\ tex
@ifnottex
@w{@i{x}@qprm{}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBrarrow.texi\fR"
.IPEZ
The
.nohy "\fBrarrow.texi\fR"
special file defines the
.nohy "\fB@rarrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \erightarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @rarrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBrcei.texi\fR"
.IPEZ
The
.nohy "\fBrcei.texi\fR"
special file defines the
.nohy "\fB@rcei\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$\elceil\ x\ \erceil$
@end\ tex
@ifnottex
@w{@lcei{}@i{x}@rcei{}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBrdarrow.texi\fR"
.IPEZ
The
.nohy "\fBrdarrow.texi\fR"
special file defines the
.nohy "\fB@rdarrow\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$P\ \eRightarrow\ Q$
@end\ tex
@ifnottex
@w{@i{P}\ @rdarrow{}\ @i{Q}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBrflo.texi\fR"
.IPEZ
The
.nohy "\fBrflo.texi\fR"
special file defines the
.nohy "\fB@rflo\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$\elfloor\ x\ \erfloor$
@end\ tex
@ifnottex
@w{@lflo{}@i{x}@rflo{}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBsbs.texi\fR"
.IPEZ
The
.nohy "\fBsbs.texi\fR"
special file defines the
.nohy "\fB@sbs{\fIL\fB,\ \fIS\fB,\ \fIR\fB}\fR"
Texinfo macro, which inserts
.nohy "\fIS\fR"
as a subscript in the output formats other than TeX.
.nohy "\fIL\fR"
and
.nohy "\fIR\fR"
are ignored except in Info and plain text,
in which they are inserted to the left and right of
.nohy "\fIS\fR,"
serving as parentheses.
This is used to imitate the mathematical
notation of TeX in the other output formats:
.RS
.IP
.nf
@tex
$x_{y\ +\ z_w}$
@end\ tex
@ifnottex
@w{@i{x}@sbs{(,@i{y}\ +\ @i{z}@sbs{,@i{w},},)}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBsh\-form.sh\fR"
.IPEZ
The
.nohy "\fBsh\-form.sh\fR"
special file is a portable
shell script that formats its
input as a shell string literal.
.IP
Generate the file and try
.nohy "\fBsh\ sh\-form.sh\ \-\-help\fR"
for more information.
.TP
.nohy "\fBsps.texi\fR"
.IPEZ
The
.nohy "\fBsps.texi\fR"
special file defines the
.nohy "\fB@sps{\fIL\fB,\ \fIS\fB,\ \fIR\fB}\fR"
Texinfo macro, which inserts
.nohy "\fIS\fR"
as a superscript in the output formats other than TeX.
.nohy "\fIL\fR"
and
.nohy "\fIR\fR"
are ignored except in Info and plain text,
in which they are inserted to the left and right of
.nohy "\fIS\fR,"
serving as parentheses.
This is used to imitate the mathematical
notation of TeX in the other output formats:
.RS
.IP
.nf
@tex
$x^{y\ +\ z^w}$
@end\ tex
@ifnottex
@w{@i{x}@sps{(,@i{y}\ +\ @i{z}@sps{,@i{w},},)}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.TP
.nohy "\fBtexinfo.css\fR"
.IPEZ
The
.nohy "\fBtexinfo.css\fR"
special file is a CSS file that makes Texinfo's HTML output look more
like its
TeX
output.
It can be copied into the HTML output by using the
.nohy "\fB\-\-css\-include\fR"
option of the
.nohy "\fBtexi2any\fR"
program.
.TP
.nohy "\fBtprm.texi\fR"
.IPEZ
The
.nohy "\fBtprm.texi\fR"
special file defines the
.nohy "\fB@tprm\fR"
Texinfo macro, which can be used to imitate the mathematical notation of
TeX in the other output formats.
For example:
.RS
.IP
.nf
@tex
$x'''$
@end\ tex
@ifnottex
@w{@i{x}@tprm{}}
@end\ ifnottex
.fi
.RE
.IP
For more information, see the WRITING MATHEMATICAL NOTATION IN TEXINFO
section.
.SH "EXIT STATUS"
.LP
Exit status zero means success, and any other exit status means failure.
Success means that all arguments were successfully processed, and
failure means that one or more were not.
.SH "CONSEQUENCES OF ERRORS"
.LP
All errors cause the
program to terminate except
perhaps when processing an operand,
in which case some errors only cause the
current phase to be canceled for the operand.
.\"
.\" The authors of this file have waived all copyright and
.\" related or neighboring rights to the extent permitted by
.\" law as described by the CC0 1.0 Universal Public Domain
.\" Dedication. You should have received a copy of the full
.\" dedication along with this file, typically as a file
.\" named <CC0-1.0.txt>. If not, it may be available at
.\" <https://creativecommons.org/publicdomain/zero/1.0/>.
.\"|%}
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
