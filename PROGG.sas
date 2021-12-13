FILENAME GAME '/home/u59880251/sasuser.v94/game_skater_stats.csv';

PROC IMPORT DATAFILE=GAME
	DBMS=CSV
	OUT=NHL.game_skater_stats;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=NHL.game_skater_stats; RUN;

FILENAME PLAYER '/home/u59880251/sasuser.v94/player_info.csv';

PROC IMPORT DATAFILE=PLAYER
	DBMS=CSV
	OUT=NHL.player_info;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=NHL.player_info; RUN;

proc sql  ;
	 create table NHL.player_info2 as 
	 select * from NHL.PLAYER_INFO 
	 where(primaryPosition NE 'G');
quit;

proc print data=NHL.player_info2 (obs=100);
run;
proc sql ;
	create table NHL.player_info3 as 
	select * from NHL.player_info2
	