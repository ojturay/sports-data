data ceps;
	infile 'C:\Users\ojtur\OneDrive\Desktop\github\sports\ceps2019.csv'
		firstobs=2
		dlm=';'
		missover
		;
	input game $ x3pa x3pm x2pa x2pm fta ftm oreb dreb steal to assists block tfoul ptsfor ptsagn;
run;

/*creating a data set containing only the in the in-game parameters*/ 
data cepspara;
	set ceps;
	drop x3pa x3pm x2pa x2pm fta ftm ptsfor ptsagn;
run;

proc sort data=cepspara;
	by game;
run;

/*transposing the datatset makes the process of visualization easier*/
proc transpose data=cepspara out=cepst;
	by game;
run;

data cepst;
	set cepst;
	label name = "parameter";
	label col="value";
run;

ods html;
title "Boxplot showing spread of in game statistics";
proc sgplot data=cepst;
	vbox col1 / group = _name_;
run;
ods html close;


/* creating a dataset that contains the values of the types of shots taken during the games*/
data ceps_shots;
	set ceps;
	drop oreb dreb steal to assists block tfoul ptsfor ptsagn;
run;

proc sort  data=ceps_shots;
	by game;
run;
proc print data=ceps_shots; run;
/*transposing dataset*/
proc transpose data=ceps_shots out=cepshot;
	by game;
run;

data cepshot;
	set cepshot;
	label name = "parameter";
	label col="value";
run;

ods html;
title "Boxplot showing spread of in game shots";
proc sgplot data=cepshot;
	vbox col1 / group = _name_;
run;
ods html close;



/*BOXPLOTS SHOWING THE SPREAD OF THE POINTS FOR AND AGAINST CEPS*/
data cepspts;
	set ceps;
	keep game ptsfor ptsagn;
run;

proc sort data=cepspts;
	by game;
run;

proc transpose data=cepspts out=cepspts;
	by game;
run;

ods html;
title "Boxplot showing spread of Points ";
proc sgplot data=cepspts;
	vbox col1 / group = _name_;
run;
ods html close;
