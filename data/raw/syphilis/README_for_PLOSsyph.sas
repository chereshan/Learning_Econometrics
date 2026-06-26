
*new hep screener;
proc format;
	value gender	1 = 'Male'
					2 = 'Female'
					3 = 'TG M to F'
					4 = 'TG F to M';
	value yesnoR	1 = 'yes'
				    2 = 'No'
					3 = 'refuse to answer'
					4 = 'missing';
	value BRG		1 = 'HM/IDU'
					2 = 'F/IDU'
					3 = 'MSM/IDU'
					4 = 'WASR'
					5 = 'MSM'
					6 = 'MSM/W'
					7 = 'TG'
					8 = 'T/IDU'
					9 = 'MSMW/IDU'
					10 = 'none';
	run;
Data PLOS ;
infile 'H:\Dennis.Fisher\Data\PLOS\PLOSsyph.dat' ;
input  r15 r16  r17  r18  r19  r20  r21 r25 r28  r29  r30  t2 t10 t11  t14  titer titer_4  titer_8  dpp_syph syphilis syph_titer  brg  race gender  Hispanic ;

label
 hispanic	=	'Are you Hispanic or Latino'
t2 = 'Multiplo HIV/HCV performance site'
t10 = 'DPP Syphilis performance sire'
r15 = 'DPP Syphilis - TREP result'
r16 = 'DPP Syphilis - N-TREP result'
t11 = 'DPP HIV/Syphilis performance site'
r17 = 'DPP HIV/Syphilis - HIV Ab result'
r18 = 'DPP HIV/Syphilis - TREP result'
t12 = 'DPP HIV/HCV/Syphilis performance site'
r19 = 'DPP HIV/HCV/Syphilis - HIV Ab result'
r20 = 'DPP HIV/HCV/Syphilis - HCV result'
r21 = 'DPP HIV/HCV/Syphilis - TREP result'
t14 = 'Determine HIV-1/2 performance site'
r25 = 'HIV 1 (serum) result'
r26 = 'HIV (western) result'
r28 = 'HCV (Ab) result'
r29 = 'TPPA result'
r30 = 'RPR result'
;

format gender gender.;
format brg BRG.;
format hispanic  yesnoR.;

*recode BRG to match new screender data;
 if BRG = 11 then BRG = 10;
if r29 = 1 and r30 = 1 then syphilis = 1;
if r29 = 0 or r30 = 0 then syphilis = 0;
if r15 = 1 and r16 = 1 then dpp_syph = 1;
if r15 = 0 or r16 = 0 then dpp_syph = 0;
if syphilis = 1 and titer > 3 then syph_titer = 1;
if syphilis = 1 and titer in (1,2,3) then syph_titer = 0;
if syphilis = 0 then syph_titer = 0;
if syphilis = . then syph_titer = .;
result = 1;
if titer in (1,2) then titer_4 = 0;
if titer > 2 then titer_4 = 1;
if titer in (1,2,3) then titer_8 = 0;
if titer > 3 then titer_8 = 1;
run;
proc freq ;
run ;
