---
hide:
  - toc
---

# Histórias de Usuário

## Introdução

Este documento apresenta as histórias de usuário do sistema **Sexto Andar**, uma plataforma para gerenciamento de imóveis que conecta usuários interessados em alugar ou comprar imóveis com proprietários que desejam disponibilizá-los.

O sistema possui três tipos de usuários principais: **Usuários Comuns** (interessados em imóveis), **Proprietários** (donos de imóveis) e **Administradores** (gestores da plataforma). Cada perfil possui funcionalidades específicas que atendem às suas necessidades no processo de locação e venda de imóveis.

As histórias foram priorizadas usando o método **MoSCoW** considerando o valor para o negócio e dependências entre funcionalidades.


## Histórias Priorizadas

### Usuário Comum

| ID | História | Prioridade | Concluído |
|----|---------|:-----------:|:---:|
| US01 | Como usuário, quero me cadastrar como "Usuário" para poder acessar imóveis, favoritar, agendar visitas e fazer propostas. | Must have | Sim |
| US02 | Como usuário, quero fazer login como "Usuário" para acessar minhas funcionalidades específicas. | Must have | Sim |
| US03 | Como usuário, quero visualizar uma lista de imóveis disponíveis para encontrar opções que me interessem. | Must have | Sim |
| US04 | Como usuário, quero editar meus dados pessoais (nome, celular, email, senha) para manter minhas informações atualizadas. | Should have |
| US05 | Como usuário, quero favoritar imóveis para salvá-los em minha lista de interesse. | Should have | Sim |
| US06 | Como usuário, quero **desfavoritar** imóveis que não me interessam mais. | Could have | Sim |
| US07 | Como usuário, quero visualizar meus imóveis favoritos e realizar ações rápidas (visita, proposta) sobre eles. | Should have | Sim |
| US08 | Como usuário, quero ver a **quantidade de imóveis favoritados** no meu perfil. | Could have | Sim |
| US09 | Como usuário, quero agendar visitas a imóveis informando a data desejada. | Must have | Sim |
| US10 | Como usuário, quero enviar propostas para imóveis informando o valor oferecido. | Must have | Sim |
| US11 | Como usuário, quero deslogar ou sair do sistema a qualquer momento. | Should have | Sim |

### Proprietário

| ID | História | Prioridade | Concluído |
|----|---------|:-----------:|:---:|
| US12 | Como proprietário, quero me cadastrar como "Proprietário" para poder cadastrar e gerenciar meus imóveis. | Must have | Sim |
| US13 | Como proprietário, quero fazer login como "Proprietário" para acessar minhas funcionalidades específicas. | Must have | Sim |
| US14 | Como proprietário, quero cadastrar **casas** informando: endereço, tamanho, descrição, valor, tipo de venda (aluguel/venda), preço do terreno e se é casa única no terreno. | Must have | Sim |
| US15 | Como proprietário, quero cadastrar **apartamentos** informando: endereço, tamanho, descrição, valor, tipo de venda, preço do condomínio, área de convivência, andar e se permite pets. | Must have | Sim |
| US16 | Como proprietário, quero visualizar meus imóveis cadastrados para acompanhar meu portfólio. | Must have | Sim |
| US17 | Como proprietário, quero editar meus dados pessoais (nome, celular, email, senha) para manter minhas informações atualizadas. | Should have |
| US18 | Como proprietário, quero ver a **quantidade de imóveis cadastrados** no meu perfil. | Could have |
| US19 | Como proprietário, quero **remover imóveis** cadastrados quando necessário. | Should have |
| US20 | Como proprietário, quero visualizar **todas as propostas recebidas** para meus imóveis com detalhes do usuário interessado. | Must have | Sim |
| US21 | Como proprietário, quero visualizar **todas as visitas agendadas** para meus imóveis com detalhes do usuário interessado. | Must have | Sim |
| US22 | Como proprietário, quero ver o **status das visitas** (realizada ou não). | Should have |
| US23 | Como proprietário, quero deslogar ou sair do sistema a qualquer momento. | Should have | Sim |

### Administrador

| ID | História | Prioridade | Concluído |
|----|---------|:-----------:|:---:|
| US24 | Como administrador, quero acessar o sistema sem necessidade de cadastro prévio. | Must have | Sim |
| US25 | Como administrador, quero visualizar **todos os usuários cadastrados** (com paginação de 15 em 15). | Could have |
| US26 | Como administrador, quero **editar dados** de qualquer usuário (nome, celular, email, senha). | Could have |
| US27 | Como administrador, quero **excluir contas** de usuários quando necessário. | Could have |
| US28 | Como administrador, quero visualizar **todos os proprietários cadastrados** (com paginação de 15 em 15). | Could have |
| US29 | Como administrador, quero **editar dados** de qualquer proprietário (nome, celular, email, senha). | Could have |
| US30 | Como administrador, quero **excluir contas** de proprietários quando necessário. | Could have |
| US31 | Como administrador, quero visualizar **todos os imóveis cadastrados** no sistema (com embaralhamento e paginação). | Could have |
| US32 | Como administrador, quero **excluir imóveis** cadastrados por proprietários quando necessário. | Could have |
| US33 | Como administrador, quero buscar usuários e proprietários **por email** para edição/exclusão. | Could have |

### Sistema e Funcionalidades Técnicas

| ID | História | Prioridade | Concluído |
|----|---------|:-----------:|:---:|
| US34 | Como usuário do sistema, quero que os imóveis sejam exibidos com **filtros por tipo** (casa/apartamento) e **tipo de venda** (aluguel/venda). | Should have |
| US35 | Como usuário do sistema, quero que os imóveis sejam mostrados de forma **embaralhada** para variedade. | Could have |
| US36 | Como usuário do sistema, quero que as listas tenham **paginação** (15 itens por página) para melhor navegação. | Should have |
| US37 | Como usuário do sistema, quero ver **diferenciação entre aluguel e venda** nos valores dos imóveis. | Should have |
| US38 | Como usuário do sistema, quero que as **propostas e visitas tenham IDs únicos** para rastreamento. | Must have | Sim |
| US39 | Como proprietário, quero que o sistema **calcule automaticamente o valor total** dos imóveis com todas as taxas. | Could have |

## Legenda - Método MoSCoW

- **Must have**: Funcionalidades essenciais e críticas para o sistema
- **Should have**: Funcionalidades importantes que agregam valor significativo
- **Could have**: Funcionalidades desejáveis que podem ser implementadas se houver tempo
- **Won't have**: Funcionalidades que não serão implementadas nesta versão