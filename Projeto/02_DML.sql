insert into Quartel values(11111,'Quartel blblblb','Rua aaaaaaa',1234567890);

insert into Bombeiro values(12345,11111,'Jo�o Gomes','1985-10-24','Rua da Liberdade,24','joaobombeiro@gmail.com',123456789,914562381);

insert into TipoViatura values(4444,'Pesado');

insert into Viatura values(1234512345,11111,4444,'AB-12-EF',2021);

insert into Equipamento values(685475,11111,1234512345,'Extintor',3);

insert into Manuten��o values(321321,1234512345,685475,'2024-11-12','Ajuste da press�o.');

insert into Forma��o values(55555,11111,'2024-06-12','2024-10-13');

insert into Bombeiro_Forma��o values(12345,55555);

insert into Especializa��o values(666666,'Prote��o Civil');

insert into Bombeiro_Especializa��o values(12345,666666);

insert into F�rias values(12345,'2024-07-25','2024-08-15');

insert into Baixa values(12345,'2025-02-01','2025-02-25','Fractura no bra�o esquerdo');

insert into Ocorr�ncia values(333,11111,'2025-03-12');

insert into Bombeiro_Ocorr�ncia values(333,12345);

insert into Viatura_Ocorr�ncia values(333,1234512345);

insert into Chamada values(7777777,333,0,'Fogo em habita��o','Adelaide Sousa','2025-04-12 14:25:35','Rua blable,7 2�D',965123321); 
