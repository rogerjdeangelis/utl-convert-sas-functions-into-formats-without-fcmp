%let pgm=utl-convert-sas-functions-into-formats-without-fcmp;

%stop_submission;

Convert sas functions into formats without fcmp
Functions in formats
invalue?

Solution by
data _null_
https://listserv.uga.edu/scripts/wa-UGA.exe?A2=SAS-L;e593f02b.2509A&S=


For full soltion with many examples see github
https://tinyurl.com/fw3h3chy
https://github.com/rogerjdeangelis/utl-convert-sas-functions-into-formats-without-fcmp



PROBLEM:
   1. Print variable name and length using just formats
   2. Print number and its square root with formats

Other function in formats repos on end

====================================================
1. PRINT VARIABLE NAME AND LENGTH USING JUST FORMATS
====================================================

proc format;
value $length(default=32) other=[length()];
run;quit;

data chk;
 set sashelp.class(obs=3 keep=name);
 put name $8. name $length.;
run;quit;

OUTPUT
======

Alfred  6
Alice   5
Barbara 7

OR

proc report data=sashelp.class(obs=3 keep=name);
col name name=nam;
define name / display;
define nam / display format=$length.;
run;quit;

OUTPUT
======
NAME      NAME
Alfred    6
Alice     5
Barbara   7

================================================
2. PRINT NUMBER AND ITS SQUARE ROOT WITH FORMATS
================================================

proc format;
value $sqrt(default=32) other=[sqrt()];
quit;

data chk;
  x='4';
  put x 1. " square root =" x $sqrt.;
run;quit;

OUTPUT
======

4 square root =2

proc report data=chk;
col x x=xalias;
define x / display;
define xalias / display format=$sqrt. 'SQRT(4)';
run;quit;

OUTPUT
======

X  SQRT(4)
4  2

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|

STRING FUNCTIONS
=================

ANYALNUM  (string)
ANYALPHA  (string)
ANYCNTRL  (string)
ANYDIGIT  (string)
ANYFIRST  (string)
ANYGRAPH  (string)
ANYLOWER  (string)
ANYNAME   (string)
ANYPRINT  (string)
ANYPUNCT  (string)
ANYSPACE  (string)
ANYUPPER  (string)
ANYXDIGIT (string)

COMPBL    (string)
DEQUOTE   (string)
LENGTH    (string)
LENGTHC   (string)
LENGTHM   (string)
REVERSE   (string)
COMPRESS  (string)
PROPCASE  (string)

NOTALNUM  (string)
NOTALPHA  (string)
NOTCNTRL  (string)
NOTDIGIT  (string)
NOTFIRST  (string)
NOTGRAPH  (string)
NOTLOWER  (string)
NOTNAME   (string)`
NOTPRINT  (string)
NOTPUNCT  (string)
NOTSPACE  (string)
NOTUPPER  (string)
NOTXDIGIT (string)


NUMERIC FUNCTIONS
=================

ABS   (numeric string)
SQRT  (numeric string)
EXP   (numeric string)
LOG   (numeric string)
LOG10 (numeric string)
FACT  (numeric string)
GAMMA (numeric string)
ERF   (numeric string)
ROUND (numeric string)
CEIL  (numeric string)
FLOOR (numeric string)
INT   (numeric string)
MOD   (numeric string)
SIN   (numeric string)
COS   (numeric string)
TAN   (numeric string)
ARSIN (numeric string)
ARCOS (numeric string)
ATAN  (numeric string)
SINH  (numeric string)
COSH  (numeric string)
TANH  (numeric string)

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/


%macro charfun(fun,strng=)
 /des="sas character function to a format";

  /*----
    %let strng=Multiple   blanks to single   blank;
    %let fun=compbl;
  ----*/

  data have;
    chr="&strng";
  run;quit;

  proc format;
  value $&fun(default=32) other=[&fun()];
  run quit;

  proc print data=have;
  format chr $&fun..;
  run;quit;

%mend charfun;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_ ___
 / _ \| | | | __| `_ \| | | | __/ __|
| (_) | |_| | |_| |_) | |_| | |_\__ \
 \___/ \__,_|\__| .__/ \__,_|\__|___/
                |_|
*/

%charfun(compbl,strng=Multiple   blanks to single   blank);
/*---- Multiple blanks to single blank ----*/

%charfun(compress,strng=Multiple   blanks to single   blank);
/*---- Multipleblankstosingleblank     ----*/

%charfun(dequote,strng="Multiple");
/*---- Multiple                        ----*/

%charfun(propcase,strng=roger de angelis);
/*---- Roger De Angelis                ----*/

%charfun(reverse,strng=roger);
/*---- regor                           ----*/



%charfun(notdigit,strng=999dial);
/*---- 4                               ----*/

%charfun(anydigit,strng=dial999);
/*---- 5                               ----*/

%charfun(anylower,strng=NVMe);
/*---- 4                               ----*/

/*---- also lengthn lenghtc            ----*/
%charfun(length,strng=roger);
/*---- 4                               ----*/

%charfun(sqrt,strng=4);
/*---- 4                               ----*/

%charfun(abs,strng=-99);
/*---- 99                              ----*/

%charfun(fact,strng=3);
/*---- 6                               ----*/

/*        _       _           _
 _ __ ___| | __ _| |_ ___  __| |  _ __ ___ _ __   ___  ___
| `__/ _ \ |/ _` | __/ _ \/ _` | | `__/ _ \ `_ \ / _ \/ __|
| | |  __/ | (_| | ||  __/ (_| | | | |  __/ |_) | (_) \__ \
|_|  \___|_|\__,_|\__\___|\__,_| |_|  \___| .__/ \___/|___/
                                          |_|
*/

REPO
-----------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/utl-functions-in-formats-for-currency-evaluations
https://github.com/rogerjdeangelis/utl-using-functions-in-formats-to-right-justify-character-variables
https://github.com/rogerjdeangelis/utl-using-sas-functions-in-formats-to-isolate-algorithms-from-your-code
https://github.com/rogerjdeangelis/utl_sort_summarize_set_merge_using_functions_in_formats_groupformat_fcmp

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
