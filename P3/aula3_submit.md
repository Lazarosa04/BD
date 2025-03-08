# BD: Guião 3


## ​Problema 3.1
 
### *a)*

```
Relações(Tabelas):
-Cliente
-Aluguer
-Balcão
-Veiculo
-Tipo_Veiculo
-Similaridade
-Ligeiro
-Pesado

Esquema de Relação:
-Cliente(nome, endereço, num_carta,NIF)
-Aluguer(duracao, data, número, NIF, Numero_balcao, Matricula)
-Balcão(Numero_balcao, nome, endereço)
-Veiculo(Matricula, Marca, ano, Código_vei)
-Tipo Veiculo(Código_vei, arcondicionado, designação)
-Similaridade(Código_vei1,Código_vei2)
-Ligeiro(Código_vei, num_lugares, Portas, Combustivel)
-Pesado(Código_vei, Peso, Passageiros)

```


### *b)* 

```
Chaves Primárias:
-Cliente(NIF)
-Aluguer(número)
-Balcão(Numero_balcao)
-Veiculo(Matricula)
-Tipo_Veiculo(Código_vei)
-Ligeiro(Código_vei)
-Pesado(Código_vei)

Chaves Estrangeiras:
-Aluguer->Numero_balcao(Balcao), NIF(Cliente), matricula(Veiculo)
-Veículo->Código_vei(Tipo Veículo)
-Pesado->Código_vei(Tipo Veículo)
-Ligeiro->Código_vei(Tipo Veículo)
-Similaridade->Código_vei(Tipo Veículo)

Chaves Candidatas:
-Cliente(NIF, num_carta)
-Aluguer(número)
-Balcão(Numero_balcao)
-Veículo(Matricula)
-Tipo de veículo(Código_vei)

```


### *c)* 

![ex_3_1c!](ex3_1c.pdf "AnImage")


## ​Problema 3.2

### *a)*

```
Airport(Airport_Code, City, State, Name)
Airplane_Type(Type_Name, Max_seats, Company, Airport_Code)
Airplane(Airplane_ID, Total_no_of_Seats, Type_name)
Seat(Seat_no, Customer_name, Cphone, Date, Leg_Number, Number)
Flight_Leg(Leg_no, Scheduled_dep_time, Scheduled_arr_time, Number,  Airport_code_Dep, Airport_code_Arr)
Flight(Number, Airline, Weekdays)
Fare(Code, Amount, Restrictions, Number)
Leg_instance(Date, No_of_avail_seats, Leg_no, Airplane_ID, Number, Dep_time, Arr_time, AP_code_Dep, AP_code_Arr)
```


### *b)* 

```
Chaves Primárias:
Airport(Airport_Code)
Airplane_Type(Type_Name)
Airplane(Airplane_ID)
Seat(Seat_no, Date, Leg_number, Number)
Flight_Leg(Leg_no, Number)
Flight(Number)
Fare(Code, Number)
Leg_instance(Date, Leg_no, Number)

Chaves Estrangeiras:
Airplane_Type(Airport_Code) -> Airport
Airplane(Type_name) - > Airplane_Type
Seat(Date, Leg_Number, Number) ->Leg_instance
Flight_Leg(Number) -> Flight
Flight_leg(Airport_code_Dep, Airport_code_Arr) -> Airport
Fare(Number) -> Flight
Leg_instance(Airplane_ID) -> Airplane
Leg_instance(Leg_no, Number, AP_code_Dep, AP_code_Arr) -> Flight_Leg

Chaves Candidatas:
Airport(Airport_Code)
Airplane_Type(Type_Name)
Airplane(Airplane_ID)
Seat(Seat_no)
Flight_Leg(Leg_no)
Flight(Number)
Fare(Code)
Leg_instance(Date)
```

### *c)* 

![ex_3_2c!](ex_3_2c.pdf "AnImage")


## ​Problema 3.3


### *a)* 2.1

![ex_3_3_a!](ex_3_3a.pdf "AnImage")

### *b)* 2.2

![ex_3_3_b!](ex_3_3b.pdf "AnImage")

### *c)* 2.3

![ex_3_3_c!](ex_3_3c.pdf "AnImage")

### *d)* 2.4

![ex_3_3_d!](ex_3_3d.pdf "AnImage")