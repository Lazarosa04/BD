# Levantamento de Entidades, Características e Relações (Atualizado)

## Entidades e Características

### 1. **Viatura**

    - **ID Viatura**
    - ID Quartel (ligação com Quartel)
    - ID Tipo Viatura (ligação com Tipo Viatura)
    - Matrícula
    - Ano

### 2. **Tipo Viatura**

    - **ID Tipo Viatura**
    - Nome Tipo Viatura

### 3. **Quartel**

    - **ID Quartel**
    - Nome Quartel
    - Endereço
    - Telefone

### 4. **Equipamento**

    - **ID Equipamento**
    - ID Quartel (ligação com Quartel)
    - ID Viatura (ligação com Viatura)
    - Nome Equipamento
    - Quantidade

### 5. **Manutenção**

    - **ID Manutenção**
    - ID Viatura (ligação com Viatura)
    - ID Equipamento (ligação com Equipamento)
    - Data Manutenção
    - Descrição

### 6. **Ocorrência**

    - **ID Ocorrência**
    - ID Quartel (ligação com Quartel)
    - ID Bombeiro (ligação com Bombeiro)
    - ID Viatura (ligação com Viatura)
    - Data e Hora
    

### 7. **Chamada**

    - **ID Chamada**
    - ID Ocorrência (ligação com Ocorrência)
    - Origem (chamada direta ou redirecionada)
    - Descrição
    - Nome
    - Data e Hora Chamada
    - Localização
    - Número

### 8. **Bombeiro**

    - **ID Bombeiro**
    - ID Quartel (ligação com Quartel)
    - Nome Bombeiro
    - Data Nascimento
    - Morada
    - Email
    - NIF
    - Telemóvel

### 9. **Formação**

    - **ID Formação**
    - ID Quartel (ligação com Quartel)
    - ID Bombeiro (ligação com Bombeiro)
    - Data Início
    - Data Fim

### 10. **Especialização**

    - **ID Especialização**
    - Nome Especialização

### 11. **Férias**

    - ID Bombeiro (ligação com Bombeiro)
    - **Data Início**
    - Data Fim

### 12. **Baixa**

    - ID Bombeiro (ligação com Bombeiro)
    - **Data Início**
    - Data Fim
    - Razão

### 13. **Bombeiro_Formação**

    - ID Bombeiro (ligação com Bombeiro)
    - ID Formação (ligação com Formação)

### 14. **Bombeiro_Especialização**

    - ID Bombeiro (ligação com Bombeiro)
    - ID Especialização (ligação com Especialização)

### 15. **Bombeiro_Ocorrência**

    - ID Bombeiro (ligação com Bombeiro)
    - ID Ocorrência (ligação com Ocorrência)

### 16. **Viatura_Ocorrência**

    - ID Viatura (ligação com Viatura)
    - ID Ocorrência (ligação com Ocorrência)

---

## Relações

1. **Viatura - Tipo Viatura**
    - Uma viatura pertence a um tipo de viatura.

2. **Viatura - Quartel**
    - Um quartel possui várias viaturas.

3. **Quartel - Equipamento**
    - Um quartel possui vários equipamentos.

4. **Equipamento - Viatura**
    - Vários equipamentos podem estar associados a uma viatura.

5. **Manutenção - Viatura**
    - Uma viatura pode necessitar de manutenção várias vezes.

6. **Manutenção - Equipamento**
    - Um equipamento pode necessitar de manutenção várias vezes.

7. **Ocorrência - Quartel**
    - Um quartel responde a várias ocorrências.

8. **Ocorrência - Chamada**
    - Uma ocorrência vem de uma ou mais chamadas.

9. **Bombeiro - Quartel**
    - Vários bombeiros pertencem a um quartel.

10. **Bombeiro - Ocorrência**
    - Vários bombeiros participam em várias ocorrências.

11. **Bombeiro - Formação**
    - Um bombeiro pode participar em várias formações.

12. **Bombeiro - Especialização**
    - Um bombeiro pode ter várias especializações.

13. **Bombeiro - Férias**
    - Um bombeiro tira férias.

14. **Bombeiro - Baixa**
    - Um bombeiro pode estar de baixa.

15. **Viatura - Ocorrência**
    - Várias viaturas podem acudir a uma ocorrência.

16. **Bombeiro - Ocorrência**
    - Vários bombeiros podem acudir a uma ocorrência.

17. **Bombeiro_Formação**
    - Um bombeiro pode participar em várias formações, e uma formação pode ter vários bombeiros.

18. **Bombeiro_Especialização**
    - Um bombeiro pode ter várias especializações, e uma especialização pode ser adquirida por vários bombeiros.

19. **Viatura_Ocorrência**
    - Uma viatura pode acudir a várias ocorrências, e uma ocorrência pode ter várias viaturas.
