libname survival "F:\Cliniqua\User Folders\Mayuri\Misc\Self-teaching\Survival Analysis\Notes\Code";
proc format;
value gender
	  0 = "Male"
	  1 = "Female";
run;

data whas500;
set survival.whas500;
format GENDER gender.;
run;

proc print data=whas500 (obs=5);run;


proc lifetest data=whas500;
time lenfol*fstat(0);
strata GENDER;
run; 

proc corr data = whas500 plots(maxpoints=none)=matrix(histogram);
var lenfol gender age bmi hr;
run;
