	NB. handy4tab.ijs
cocurrent 'z'

QT=: ''''
and=: *.
any=: +./
brace=: 1 |. '}{' , ":
brack=: 1 |. '][' , ":
ddefine=: 1 : 'm&$: : (4 : 0)'

default=: 0&$: :(4 : 0)
	NB. pronoun (y) created with value (x)
	NB. UNLESS name (y) already in-use.
	NB. NOT compatible with the "misc.ijs" version
	NB. which has x<--> swapped.
	NB. Permits MYVAR=: 99 default 'MYVAR'
	NB. as well as:   99 default 'MYVAR'
if. 0<: 4!:0 <y do. y~ return. end.
(y)=:x
)

dtlf=: #~ ([: +./\. (10{a.)&~:)
edit=: [: open [: , [: > whichscript_z_

from=: 4 : 0
  NB. extract x from anytype list y
z=. '<from:unset>'
try.
select. datatype y
  case. 'literal'	do.
	x=. {.x
	if. 'literal'-:datatype x do.
		z=. x lfrom ;:y
	else.	z=. x { ;:y
	end.
  case. 'boxed'	do.
	x=. {.x
	if. 'literal'-:datatype x do.
		z=. x lfrom y
	else.	z=. x{ y
	end.
 fcase. 'floating' do.
  case. 'integer'	do.	z=. x { y
  case.		do.	z=. x { y
end.
catch.
  ''
end.
>z
)

help=: 1&$: :(4 : 0)
  NB. help on a library word name
ver=. ":jversion''
select. y [z=.''
  case. 'compare'        do. z=. 'lib_compare'
  case. 'setbreak'       do. z=. 'lib_break'
  case. 'endian'         do. z=. 'lib_dll'
  case. 'Endian'         do. z=. 'lib_dll'
  case. 'fc'             do. z=. 'lib_dll'
  case. 'ic'             do. z=. 'lib_dll'
  case. 'AND'            do. z=. 'lib_dll'
  case. 'OR'             do. z=. 'lib_dll'
  case. 'XOR'            do. z=. 'lib_dll'
  case. 'calendar'       do. z=. 'lib_dates'
  case. 'getdate'        do. z=. 'lib_dates'
  case. 'isotimestamp'   do. z=. 'lib_dates'
  case. 'timestamp'      do. z=. 'lib_dates'
  case. 'valdate'        do. z=. 'lib_dates'
  case. 'jpath'          do. z=. 'lib_jade'
  case. 'load'           do. z=. 'lib_jade'
  case. 'loadd'          do. z=. 'lib_jade'
  case. 'require'        do. z=. 'lib_jade'
  case. 'scripts'        do. z=. 'lib_jade'
  case. 'show'           do. z=. 'lib_jade'
  case. 'wcsize'         do. z=. 'lib_jade'
  case. 'xedit'          do. z=. 'lib_jade'
  case. 'getqtbin'       do. z=. 'lib_jal'
  case. 'install'        do. z=. 'lib_jal'
  case. 'charsub'        do. z=. 'lib_strings'
  case. 'fstringreplace' do. z=. 'lib_strings'
  case. 'joinstring'     do. z=. 'lib_strings'
  case. 'ljust'          do. z=. 'lib_strings'
  case. 'quote'          do. z=. 'lib_strings'
  case. 'rjust'          do. z=. 'lib_strings'
  case. 'rplc'           do. z=. 'lib_strings'
  case. 'FHS'            do. z=. 'lib_sysenv'
  case. 'hostpathsep'    do. z=. 'lib_sysenv'
  case. 'UNAME'          do. z=. 'lib_sysenv'
  case. 'winpathsep'     do. z=. 'lib_sysenv'
  case. 'cutpara'        do. z=. 'lib_text'
  case. 'topara'         do. z=. 'lib_text'
  case. 'UNXLIB'         do. z=. 'lib_unxlib'
  case. 'unxlib'         do. z=. 'lib_unxlib'
  case. 'fcompare'       do. z=. 'lib_compare'
end.
if. z-:'' do. select. 2{.y
  case. 'an' do. z=. 'lib_android'
  case. 'br' do. z=. 'lib_break'
  case. 'cd' do. z=. 'lib_dll'
  case. 'co' do. z=. 'lib_coutil'
  case. 'co' do. z=. 'lib_dates'
  case. 'fo' do. z=. 'lib_text'
  case. 'IF' do. z=. 'lib_sysenv'
  case. 'ta' do. z=. 'lib_strings'
  case. 'to' do. z=. 'lib_dates'
  case. 'ts' do. z=. 'lib_dates'
  case. 'db' do. z=. 'lib_debug'
  case. 'di' do. z=. 'lib_dir'
  case. 'me' do. z=. 'lib_dll'
  case. 'sy' do. z=. 'lib_dll'
end. end.
if. z-:'' do. select. {.y
  case. 'd' do. z=. 'lib_strings'
  case. 'f' do. z=. 'lib_files'
  case. 'J' do. z=. 'lib_dll'
  case. 'j' do. z=. 'lib_sysenv'
  case. 's' do. z=. 'lib_strings'
  case.     do. z=. 'lib_stdlib'
end. end.
z=.sw'help/user/(z).htm#(y)'
if. x do.
  z=. sw'http://www.jsoftware.com/(z)'
else.
  z=. sw'file:///applications/j64-(ver)/addons/docs/(z)'
end.
empty browse_j_ URL=: z
)

ijs=: '.ijs'&extx
isBool=: isBools *. isScalar
isEmpty=: 0 = [: */ $
llog=: (1 { ":)@(,@([: ] ;: ,. [: ".&.> ;:))
log=: [: ": ;: ,. [: ".&.> ;:
max=: $:/ :>.
min=: $:/ :<.
o2f=: 3 : 'LF(I. y=SP)}y'
or=: +.
pathof=: ] {.~ [: >: '/' i:~ ]
pc=: '%' ,~ [: ": [: <. 0.5 + 100 * 88350 %~ ]
sllog=: smoutput@llog
sq=: *: :[:
sqrt=: %: :[:
square=: *: :[:
ssw=: smoutput&sw
sw=: ] rplc [: , (paren&.> ,. ":&".&.>)&smresolve

tab=: 4 : 0
	NB. space strings x and y with TABs to (m) TAB-widths
'm z'=. y  NB. m is # of effective TABs to {:y
t=. 9      NB. # of spaces in a TAB (ADJUST FOR IDE CHARACTERISTICS)
x ,(TAB #~ 1>. m - <.(#x)%t), z
)

temp=: lasttemp`tmp@.(*@#@])
to=: [ + [: i. [: >: -~
x2f=: }.@((<10{a.) ;@,. ])@([: (#~ ([: +./\. ' '&~:))&.> <"1)

startonload ''
