{
	ENONCE
	bateau sera composer d'un ensemble de case et flotte de bateau a couler sera represente par ensemble de bateau
	1. case compose de 2  champ libre ( ligne =  Y et colonne = X )
	2. bateau compose de n case 
	3. flotte compose d un ensemnle de bateau
	4. fonction de creation d une case qui prendre en parametre la ligne et colonne associe a la case
	5. fonction de comparaison de 2 cases, qui renvois vrai ou faux selon le cas
	6. fonction creation de bateau qui renvoi structure bateau correctement remplie
    7. fonction verifie si case appartient bateau renvoie vrai ou faux  cette fonction utilisera fonction (5)
    8. fonction qui verifie case appartient flotte bateau utilisera fonction (7)
    9. gameplay libre 
    10. bonne chance

    Bataille naval

}

program Bataillenavale;
uses crt;

const
	bateau1=9;// bateau1 signifie que c'est le bateau 1
	bateau2=8;
	bateau3=7;
	NCases=25;{Ncases est le nombre de case dans la grille sur une ligne ou colonne sur 25 ligne et 25 colonne donc un total 25*25= 625 case 
	           et j'ai choisi 25 case car cest le jour de mon anniversaire :) }

type
	Cases=record

	x:integer;	
end;

type
	bateau=record

	b1:integer;//enregistrement des coordonnes du bateau1
	b2:integer;//enregistrement des coordonnes du bateau2
	b3:integer;//enregistrement des coordonnes du bateau3
end;

type
	flotte=record
	bat : array [1..NCases,1..NCases] of bateau;
end;



type
	grille=array [1..NCases*NCases] of Cases;
	
procedure mer (var place:grille);
var
	a,b:integer;

begin
	for a:=1 to NCases*NCases do
		begin
			place[a].x:=1;
			write(place[a].x);
			if(a mod NCases = 0) then
				writeln;
		end;
	writeln;
end;

function tire(Ttab:grille; x:integer; y:integer):boolean; //X correspond  a l'absicce de a grille donc X est les colonnes de la grilles, Y correspond a l'ordonne a l'origine donc Y correspond au ligne de la grille
begin
	if (Ttab[(y-1)*NCases + x].x = 1 ) then
	begin
		Exit(True);
    end
	else
	begin
		Exit(False);
	end;
end;

procedure place(var Ttab:grille; boat:flotte);
var
	a, b: integer;
	choixX, choixY: integer;
begin
	for a:= bateau3 to bateau1 do
	begin
	    write('Il y 25 colonne et 25 ligne en tout, veuillez choisir la colonne pour placer le bateau de taille ', a, ': ');// en utilisant le write le texte afficher restera afficher indefiniment 
		readln(choixX);
		while((choixX < 1) or (choixX > NCases)) do
		begin
			write('La place sur la colonne doit etre superieur ou egal a 1 et inferieur a ', NCases, ': ');
			readln(choixX);
		end;
		
		write('Veuillez choisir la ligne pour placer le bateau de taille ', a, ': ');
		readln(choixY);
		while((choixY < 1) or (choixY + a > NCases)) do
		begin
			write('La place sur la ligne doit etre superieur ou egal a 1 et inferieur a ', NCases - a + 1, ': ');
			readln(choixY);
		end;
		
		for b:= 1 to a do
		begin
			Ttab[(ChoixY-1)*NCases + choixX + (b-1)*NCases].x := 0;
		end;
	end;
	
	for a:= 1 to NCases*NCases do
	begin
		write(Ttab[a].x);
		if(a mod NCases = 0) then
			writeln;
	end;
end;
	
function Btoucher(var tab:grille; place:flotte): boolean;
var
	x, y : integer;
	toucher : boolean;
begin
	write('veuillez saisir la place sur la ligne ou vous souhaitez tirer: ');
	readln(x);
	while ((x<1) or (x>NCases)) do
	begin
		write ('echec, vous ne pouvez que tirer entre 1 et ',NCases,': ');
		readln (x);
	end;
	write ('veuillez saisir la place sur la colonne ou vous souhaitez tirer: ');
	readln(y);
	while ((y<1) or (y>NCases)) do
	begin
		write ('echec, vous ne pouvez que tirer entre 1 et ',NCases,': ');
		readln (y);
	end;
	
	toucher := tire(tab, x, y);
	if(toucher) then
		begin
			writeln('toucher!');
		end
	else
		writeln('Rater!');
end;


var
	tab: grille;
	flottex: flotte;
	
begin
    clrscr;

    writeln(' Bonjour et bienvenu au jeu de la bataille naval');
    writeln(' Veuillez suivre les instructions a la lettre et taper ENTER a chaque fois que vous allez saisir quelque chose');
	mer(tab);
	place(tab, flottex);
	Btoucher(tab, flottex);
	readln;
end.