insert into Quartel values(11111,'Quartel blblblb','Rua aaaaaaa',1234567890);
insert into Quartel values(22222,'Quartel Central','Avenida Principal, 100',2345678901);
insert into Quartel values(33333,'Quartel Norte','Rua do Norte, 50',3456789012);

insert into Bombeiro values(12345,11111,'João Gomes','1985-10-24','Rua da Liberdade,24','joaobombeiro@gmail.com',123456789,914562381);
insert into Bombeiro values(23456,22222,'Maria Silva','1990-03-15','Rua das Flores,12','mariasilva@gmail.com',234567890,912345678);
insert into Bombeiro values(34567,33333,'Carlos Pereira','1982-07-08','Rua do Sol,45','carlosp@gmail.com',345678901,913456789);

insert into TipoViatura values(4444,'Pesado');
insert into TipoViatura values(5555,'Ligeiro');
insert into TipoViatura values(6666,'Ambulância');

insert into Viatura values(1234512345,11111,4444,'AB-12-EF',2021);
insert into Viatura values(2345623456,22222,5555,'CD-34-GH',2020);
insert into Viatura values(3456734567,33333,6666,'EF-56-IJ',2019);

insert into Equipamento values(685475,11111,1234512345,'Extintor',3);
insert into Equipamento values(785476,22222,2345623456,'Desfibrilhador',2);
insert into Equipamento values(895477,33333,3456734567,'Kit Primeiros Socorros',5);

insert into Manutenção values(321321,1234512345,685475,'2024-11-12','Ajuste da pressão.');
insert into Manutenção values(432432,2345623456,785476,'2025-01-10','Substituição de bateria.');
insert into Manutenção values(543543,3456734567,895477,'2025-02-20','Revisão geral.');

insert into Formação values(55555,11111,'2024-06-12','2024-10-13');
insert into Formação values(66666,22222,'2025-01-01','2025-05-01');
insert into Formação values(77777,33333,'2025-03-10','2025-07-10');

insert into Bombeiro_Formação values(12345,55555);
insert into Bombeiro_Formação values(23456,66666);
insert into Bombeiro_Formação values(34567,77777);

insert into Especialização values(666666,'Proteção Civil');
insert into Especialização values(777777,'Combate a Incêndios');
insert into Especialização values(888888,'Primeiros Socorros');

insert into Bombeiro_Especialização values(12345,666666);
insert into Bombeiro_Especialização values(23456,777777);
insert into Bombeiro_Especialização values(34567,888888);

insert into Férias values(12345,'2024-07-25','2024-08-15');
insert into Férias values(23456,'2025-08-01','2025-08-20');
insert into Férias values(34567,'2025-09-10','2025-09-25');

insert into Baixa values(12345,'2025-02-01','2025-02-25','Fractura no braço esquerdo');
insert into Baixa values(23456,'2025-03-10','2025-03-20','Gripe');
insert into Baixa values(34567,'2025-04-05','2025-04-15','Entorse no tornozelo');

insert into Ocorrência values(333,11111,'2025-03-12');
insert into Ocorrência values(444,22222,'2025-04-01');
insert into Ocorrência values(555,33333,'2025-05-05');

insert into Bombeiro_Ocorrência values(333,12345);
insert into Bombeiro_Ocorrência values(444,23456);
insert into Bombeiro_Ocorrência values(555,34567);

insert into Viatura_Ocorrência values(333,1234512345);
insert into Viatura_Ocorrência values(444,2345623456);
insert into Viatura_Ocorrência values(555,3456734567);

insert into Chamada values(7777777,333,0,'Fogo em habitação','Adelaide Sousa','2025-04-12 14:25:35','Rua blable,7 2ºD',965123321);
insert into Chamada values(8888888,444,1,'Acidente de viação','Carlos Pinto','2025-04-01 09:15:00','Avenida Central, 50',912345678);
insert into Chamada values(9999999,555,2,'Queda em casa','Ana Costa','2025-05-05 18:30:00','Rua do Norte, 51',913456789);
