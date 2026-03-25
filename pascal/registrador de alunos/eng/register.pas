program registrador;

uses
	crt;
type 
	bimestre= array [1..4] of real;
	cad_aluno=record
		nome:string;
		nota:bimestre;
		media:real;
	end;

	

var
	aluno:array of cad_aluno;
	i,j,MAX,lin:integer;
	option:char;
	arquivo:text;



procedure Reg;
begin	
	clrscr;
	gotoxy(5,10); write('Note: Only use dots (.) instead comma (,) to write decimal numbers.');
	gotoxy(5,11); write('Press something.');
	readkey;
	i:=0;
	j:=0;
	lin:=0;
	clrscr;
	for i:=1 to MAX do
	begin
		gotoxy(5,10); write('Enter the name of student ',i,': ');
		readln(aluno[i].nome);
		for j:=1 to 4 do
		begin
			gotoxy(5,11+lin); write('Enter the grade ',j,': ');
			readln(aluno[i].nota[j]);
			
			if(aluno[i].nota[j]>10) or (aluno[i].nota[j]<0) then
			begin
				gotoxy(5,11+lin); clreol; write('You need to enter a number between 0 to 10 - Press something');
				aluno[i].nota[j]:=0;
				aluno[i].nome:='';
				readkey;
				clrscr;
				option:='0';
				exit;
			end;
			lin:=lin+1;
		end;
		lin:=0;
		clrscr;
		
	end;
	gotoxy(5,12); write('Done - Press something'); readkey;
	option:='0';
	clrscr;
end;


procedure Ordem;
var
	aux:string;
	k:integer;
	notax,mediax:real;

begin
	for i:=1 to MAX-1 do
	begin
		for j:=1+i to MAX do
		begin
		if(aluno[i].nome>aluno[j].nome) then
		begin
		aux:=aluno[j].nome;
		aluno[j].nome:=aluno[i].nome;
		aluno[i].nome:=aux;

		mediax:=aluno[j].media;
		aluno[j].media:=aluno[i].media;
		aluno[i].media:=mediax;
			for k:= 1 to 4 do
			begin
				notax:=aluno[j].nota[k];
				aluno[j].nota[k]:=aluno[i].nota[k];
				aluno[i].nota[k]:=notax;
			end;
		end;
		end;

	end;
	clrscr;
	write('Done, check it out in Show All option - Press something');
	readkey;
	option:='0';
	clrscr;
end;


procedure Exibir;
begin
clrscr;
writeln('Avarage to be approved: avarage greater than 7');
for i:=1 to MAX do
	begin
		aluno[i].media:=0;
		writeln('Student ',i,': ',aluno[i].nome);
		for j:=1 to 4 do
		begin
			writeln('Grade ',j,': ',aluno[i].nota[j]:0:2);
			aluno[i].media:=aluno[i].media+aluno[i].nota[j];
		end;
		aluno[i].media:=aluno[i].media/4;
		
		writeln('Student avarage: ',aluno[i].media:0:2);
		if(aluno[i].media>=7)  then
		writeln('Situation: Approved')
		else	
		writeln('Situation: Failed');

		writeln;
	end;
	readkey;
	option:='0';
	clrscr;
end;


procedure TXT;
begin
	assign(arquivo,'student_register.txt');
	rewrite(arquivo);
	writeln(arquivo,'Avarage to be approved: avarage greater than 7');
	for i:=1 to MAX do
	begin
		aluno[i].media:=0;
		writeln(arquivo,'Student ',i,': ',aluno[i].nome);
		for j:=1 to 4 do
		begin
			writeln(arquivo,'Grade ',j,': ',aluno[i].nota[j]:0:2);
			aluno[i].media:=aluno[i].media+aluno[i].nota[j];
		end;
		aluno[i].media:=aluno[i].media/4;
		
		writeln(arquivo,'Student avarage: ',aluno[i].media:0:2);
		if(aluno[i].media>=7) then
		writeln(arquivo,'Situation: Approved')
		else	
		writeln(arquivo,'Situation: Failed');

		writeln(arquivo);
	end;
	close(arquivo);
	clrscr;
	writeln('Done, check it out your folder for "student_register.txt" - Press something');
	readkey;
	option:='0';
	clrscr;
end;



procedure INTRO;	
begin

	repeat	
	begin
		clrscr;
		gotoxy(5,10); write('Welcome to the Student Register.');
		gotoxy(5,11); write('How many students will be registered this time? '); readln(MAX);
	
		clrscr;
		if(MAX<=0) then
		begin
			write('Invalid students number, try again');
			readkey;
		end;
	
	end;
	until(MAX>0);
	SetLength(aluno,MAX);
end;
	




begin	
	
	INTRO;
	option:='0';
	clrscr;
	while (option='0') do
	begin
		gotoxy(5,10); write('Welcome to the Student Register. ');
		gotoxy(5,11); write('Select an option ');
		gotoxy(10,13); write('1 - Register students ');
		gotoxy(10,14); write('2 - Order students by alphabetic order ');
		gotoxy(10,15); write('3 - Show all ');
		gotoxy(10,16); write('4 - Make a .txt file ');
		gotoxy(10,17); write('5 - Exit ');
		option:=readkey;
		
		if (option<>'0') then
		begin
			case option of
				'1': Reg;
				'2': Ordem;
				'3': Exibir;
				'4': TXT;
				'5': exit;
		else	
			clrscr;
			write('Invalid option - press something');
			option:='0';
			readkey;
			clrscr;
		end;
	end;
end;
end.