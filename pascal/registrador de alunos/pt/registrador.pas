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
	gotoxy(5,10); write('Nota: Use somente pontos (.) ao inves de virgulas (,) para representar numeros decimais.');
	gotoxy(5,11); write('Tecle algo.');
	readkey;
	i:=0;
	j:=0;
	lin:=0;
	clrscr;
	for i:=1 to MAX do
	begin
		gotoxy(5,10); write('Digite o nome do aluno ',i,': ');
		readln(aluno[i].nome);
		for j:=1 to 4 do
		begin
			gotoxy(5,11+lin); write('Digite a nota ',j,': ');
			readln(aluno[i].nota[j]);
			if(aluno[i].nota[j]>10) or (aluno[i].nota[j]<0) then
			begin
				gotoxy(5,11+lin); clreol; write('Voce precisa digitar um numero entre 0 e 10 - Tecle algo');
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
	gotoxy(5,12); write('Feito'); readkey;
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
	write('Feito, veja na opcao Exibir - Tecle algo');
	readkey;
	option:='0';
	clrscr;
end;


procedure Exibir;
begin
clrscr;
writeln('Media para aprovar: media maior que 7');
for i:=1 to MAX do
	begin
		aluno[i].media:=0;
		writeln('Aluno ',i,': ',aluno[i].nome);
		for j:=1 to 4 do
		begin
			writeln('Nota ',j,': ',aluno[i].nota[j]:0:2);
			aluno[i].media:=aluno[i].media+aluno[i].nota[j];
		end;
		aluno[i].media:=aluno[i].media/4;
		
		writeln('Media do aluno: ',aluno[i].media:0:2);
		if(aluno[i].media>=7) then
		writeln('Situacao: Aprovado')
		else	
		writeln('Situacao: Reprovado');

		writeln;
	end;
	readkey;
	option:='0';
	clrscr;
end;


procedure TXT;
begin
	assign(arquivo,'registro_alunos.txt');
	rewrite(arquivo);
	writeln(arquivo,'Media para aprovar: media maior que 7');
	for i:=1 to MAX do
	begin
		aluno[i].media:=0;
		writeln(arquivo,'Aluno ',i,': ',aluno[i].nome);
		for j:=1 to 4 do
		begin
			writeln(arquivo,'Nota ',j,': ',aluno[i].nota[j]:0:2);
			aluno[i].media:=aluno[i].media+aluno[i].nota[j];
		end;
		aluno[i].media:=aluno[i].media/4;
		
		writeln(arquivo,'Media do aluno: ',aluno[i].media:0:2);
		if(aluno[i].media>=7) then
		writeln(arquivo,'Situacao: Aprovado')
		else	
		writeln(arquivo,'Situacao: Reprovado');

		writeln(arquivo);
	end;
	close(arquivo);
	clrscr;
	writeln('Feito, cheque sua pasta pelo arquivo "registro_alunos.txt" - Tecle algo');
	readkey;
	option:='0';
	clrscr;
end;



procedure INTRO;	
begin

	repeat	
	begin
		clrscr;
		gotoxy(5,10); write('Bem vindo ao registrador de alunos');
		gotoxy(5,11); write('Quantos alunos sera registrado dessa vez? '); readln(MAX);
	
		clrscr;
		if(MAX<=0) then
		begin
			write('Numero de alunos invalido tente de novo');
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
		gotoxy(5,10); write('Bem vindo ao registrador de alunos');
		gotoxy(5,11); write('Selecione uma opcao');
		gotoxy(10,13); write('1 - Registrar alunos');
		gotoxy(10,14); write('2 - Ordenar os alunos por ordem alfabetica');
		gotoxy(10,15); write('3 - Exibir tudo');
		gotoxy(10,16); write('4 - Criar arquivo txt');
		gotoxy(10,17); write('5 - Sair');
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
			write('Opcao invalida, tecle algo');
			option:='0';
			readkey;
			clrscr;
		end;
	end;
end;
end.