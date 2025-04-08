# Levantamento de Entidades, Características e Relações

## Entidades e Características

### 1. **Viatura**

    - ID Viatura
    - Matrícula
    - Ano
    - Tipo (ligação com Tipo Viatura)

### 2. **Tipo Viatura**

    - ID Tipo Viatura
    - Nome

### 3. **Quartel**

    - ID Quartel
    - Nome Quartel
    - Endereço
    - Telefone

### 4. **Equipamento**

    - ID Equipamento
    - Nome
    - Quantidade

### 5. **Manutenção**

    - ID Manutenção
    - Data Manutenção
    - Descrição

### 6. **Ocorrência**

    - ID Ocorrência
    - Data e Hora

### 7. **Chamada**

    - ID Chamada
    - Data e Hora
    - Descrição
    - Local

### 8. **Bombeiro**

    - ID Bombeiro
    - Nome
    - Data Nascimento
    - Morada
    - Email
    - NIF
    - Telemóvel

### 9. **Formação**

    - ID Formação
    - Data Início
    - Data Fim

### 10. **Especialização**

    - ID Especialização
    - Nome

### 11. **Férias**

    - Data Início
    - Data Fim

### 12. **Baixa**

    - Data Início
    - Data Fim
    - Razão

---

## Relações

1. **Viatura - Tipo Viatura**
    - Uma viatura pertence a um tipo de viatura.

2. **Viatura - Quartel**
    - Um quartel possui várias viaturas.

3. **Quartel - Equipamento**
    - Um quartel precisa de vários equipamentos.

4. **Manutenção - Viatura**
    - Uma viatura pode necessitar de manutenção várias vezes

5. **Ocorrência - Quartel**
    - Um quartel responde a várias ocorrências.

6. **Ocorrência - Chamada**
    - Uma ocorrência vem de uma ou mais chamada.

7. **Bombeiro - Quartel**
    - Vários bombeiros pertencem a um quartel.

8. **Bombeiro - Ocorrência**
    - Vários bombeiros participam em várias ocorrências.

9. **Bombeiro - Formação**
    - Um bombeiro pode participar em várias formações.

10. **Bombeiro - Especialização**
     - Um bombeiro pode ter várias especializações.

11. **Bombeiro - Férias**
     - Um bombeiro tira férias.

12. **Bombeiro - Baixa**
     - Um bombeiro pode estar de baixa.
