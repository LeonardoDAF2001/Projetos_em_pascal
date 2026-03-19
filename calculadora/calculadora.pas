program calculadora;

uses
	crt;


procedure Add;
var
	i,j,max:integer;
	n_array: array of int64;
	result,n:int64;
begin
	result:=0;
	clrscr;
	gotoxy(10,10); write('Quantos numeros somar? ');
	readln(max);
	SetLength(n_array,max);
	
	for i:=1 to max do
	n_array[i]:=0;		

		
	for i:=1 to max do
	begin	
		gotoxy(10,11); clreol; write('Numero',i,': ');
		readln(n);
		n_array[i]:=n;	
		result:=result+n;
		gotoxy(10,12);
		for j:=1 to max do
		begin
			clreol;
			if (j<max) and (n_array[j]<>0) then
			write(n_array[j],' + ');	
			
			if (j=max) and (n_array[j]<>0) then
			write(n_array[j]);
		end;
		gotoxy(10,13); 
		write('Resultado: ',result);
	end;
	
	gotoxy(10,15); 
	write('Fim - tecle algo'); 
	readkey;
end;


procedure Sub;
var
	i,j,max:integer;
	n_array: array of int64;
	result,n:int64;
begin
	result:=0;
	clrscr;
	gotoxy(10,10); write('Quantos numeros subtrair? ');
	readln(max);
	SetLength(n_array,max);
	
	for i:=1 to max do
	n_array[i]:=0;		

		
	for i:=1 to max do
	begin	
		gotoxy(10,11); clreol; write('Numero',i,': ');
		readln(n);
		n_array[i]:=n;

		if(i=1) then	
		result:=n;
		if(i>1) then
		result:=result-n;

		gotoxy(10,12);
		for j:=1 to max do
		begin
			clreol;
			if (j<max) and (n_array[j]<>0) then
			write(n_array[j],' - ');	
			
			if (j=max) and (n_array[j]<>0) then
			write(n_array[j]);
		end;
		gotoxy(10,13); 
		write('Resultado: ',result);
	end;
	
	gotoxy(10,15); 
	write('Fim - tecle algo'); 
	readkey;
end;

procedure Mult;
var
	i,j,max:integer;
	n_array: array of int64;
	result,n:int64;
begin
	result:=1;
	clrscr;
	gotoxy(10,10); write('Quantos numeros multiplicar? ');
	readln(max);
	SetLength(n_array,max);
	
	for i:=1 to max do
	n_array[i]:=0;		

		
	for i:=1 to max do
	begin	
		gotoxy(10,11); clreol; write('Numero',i,': ');
		readln(n);
		n_array[i]:=n;	
		result:=result*n;
		gotoxy(10,12);
		for j:=1 to max do
		begin
			clreol;
			if (j<max) and (n_array[j]<>0) then
			write(n_array[j],' * ');	
			
			if (j=max) and (n_array[j]<>0) then
			write(n_array[j]);
		end;
		gotoxy(10,13); 
		write('Resultado: ',result);
	end;
	
	gotoxy(10,15); 
	write('Fim - tecle algo'); 
	readkey;
end;

procedure Divide;
var
	i,j,max:integer;
	n_array: array of real;
	result,n:real;
	result2:real;
begin
	result:=1;
	clrscr;
	gotoxy(10,10); write('Quantos numeros dividir? ');
	readln(max);
	SetLength(n_array,max);
	
	for i:=1 to max do
	n_array[i]:=0;		

		
	for i:=1 to max do
	begin	
		gotoxy(10,11); clreol; write('Numero',i,': ');
		readln(n);
		n_array[i]:=n;	
		if(i=1) then
		result:=n;
		if(i>1) then
		result:=result/n;
		gotoxy(10,12);
		for j:=1 to max do
		begin
			clreol;
			if (j<max) and (n_array[j]<>0) then
			write(n_array[j]:0:2,' / ');	
			
			if (j=max) and (n_array[j]<>0) then
			write(n_array[j]:0:2);
		end;
		gotoxy(10,13); 
		write('Resultado: ',result:0:2);
	end;
	
	gotoxy(10,15); 
	write('Fim - tecle algo'); 
	readkey;
end;



var
	option:char;

Begin
	
	option:='0';
	while(option<>'5') do
	begin
		clrscr;
		gotoxy(10,10); write('1 - Somar');
		gotoxy(10,11); write('2 - Subtrair');
		gotoxy(10,12); write('3 - Multiplicar');
		gotoxy(10,13); write('4 - Dividir');
		gotoxy(10,14); write('5 - Sair');
		gotoxy(10,20); write('Feito por: Leonardo Ferreira');
		gotoxy(10,15); option:=readkey;
		
		
		if (option<>'5') then
			case option of
			'1': Add;
			'2': Sub;
			'3': Mult;
			'4': Divide;
		else
			clrscr;
			gotoxy(10,10); write('Opcao invalida, tecle algo');
			option := readkey;
	end;
End;
end.