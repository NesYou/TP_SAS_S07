LIBNAME lib '/folders/myfolders/sasuser.v94/';

/* Exercice 1 */

DATA dataExo1;
	
	/* Exercice 3 */LENGTH Etat $ 12; /* Doit être avant input ! */
	INPUT Abv$ Etat$ Pop Revenu Region$;
	CARDS;
	AL Alabama 3615 3624 South
	AK Alaska 365 6315 West
	CA California 21198 . West
	;
	
/* Exercice 2 */

TITLE 'Exercice 2';
PROC print; run;
PROC means; run;


/* Exercice 4 */
TITLE 'Exercice 4';

DATA lib.exo4;

	INFILE '/folders/myfolders/sasuser.v94/StateFacts.txt';
	LENGTH Etat $ 12 Region $ 13;
	INPUT Abv$ Etat$ Pop Revenu Apb EspVie Crime Diplome NbGel Aire Region$;
	
PROC print; run;

TITLE 'Exercice 4 - MEANS';
PROC means; run;

/* Afficher les 5 premiers */
PROC PRINT DATA=dataexo4 (obs=5); RUN;

/* Exercice 5 */
TITLE 'Exercice 5 - a)';
DATA lib.exo5;
	SET lib.exo4;
	RevenuE = 0.84 * revenu;
	if Region = 'West' then RG = 'w';
	else if Region = 'NorthEast' then RG = 'NE';
	else if Region = 'NorthCentral' then RG = 'NC';
	else if Region = 'South' then RG = 'S';
	
PROC print; RUN;