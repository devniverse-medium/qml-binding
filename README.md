# Projetos QML - Exemplos de Binding

Este repositório contém uma coleção de projetos QML que demonstram diferentes aspectos e conceitos relacionados a **bindings** (ligações) em QML. Cada projeto é um exemplo independente que ilustra um conceito específico.

##  Índice

- [qml-binding-loop](#qml-binding-loop)
- [qml-binding-move](#qml-binding-move)
- [qml-binding-simple](#qml-binding-simple)
- [qml-binding-alias](#qml-binding-alias)
- [qml-binding-this](#qml-binding-this)
- [qml-binding-transfer](#qml-binding-transfer)

---

## qml-binding-loop

**Descrição:** Demonstra o problema de **binding loop circular** (loop de ligação circular) e como evitá-lo.

### Conceito

Este projeto ilustra um problema comum em QML onde dois elementos dependem mutuamente um do outro, criando um loop infinito de atualizações:

- `rectBindingLoop` define seu tamanho baseado em `rectContentBindingLoop`
- `rectContentBindingLoop` define seu tamanho baseado em `rectBindingLoop`
- Isso cria um ciclo infinito de atualizações

### Estrutura

- **main.qml**: Contém dois exemplos:
  -  **Exemplo problemático**: Demonstra o binding loop
  -  **Exemplo correto**: Mostra como evitar o problema usando valores fixos ou anchors

### Aprendizado

- Como identificar e evitar binding loops
- A importância de ter uma hierarquia clara de dependências
- Uso de anchors como alternativa para posicionamento relativo

---

## qml-binding-move

**Descrição:** Demonstra a diferença entre **propriedades com binding** e **funções** para posicionamento de elementos, ambas reativas, mas com diferenças importantes na forma como são avaliadas e executadas.

### Conceito

Este projeto compara duas abordagens reativas para calcular a posição de elementos:

1. **Propriedade com binding** (`reactPosition`): É reativa e se atualiza automaticamente quando `enabled` muda
2. **Função** (`rectPosition()`): Também é reativa quando usada em bindings, respondendo a mudanças em `enabled`

**Ambas são reativas**, mas diferem na forma como são avaliadas quando usadas em múltiplos lugares.

### Diferença Crítica de Comportamento

Quando ambas as abordagens são usadas para definir `x` e `y` de um elemento:

- **Propriedade com binding**: Quando `x: reactPosition` e `y: reactPosition` são usados, o binding é **avaliado apenas uma vez** quando `enabled` muda, e o valor calculado é **reutilizado** para ambas as propriedades. O `console.log` dentro da propriedade será executado **apenas uma vez**.

- **Função**: Quando `x: rectPosition()` e `y: rectPosition()` são usados, a função é **chamada separadamente** para cada propriedade. Mesmo que ambas dependam de `enabled`, o `console.log` dentro da função será executado **duas vezes** (uma para `x` e outra para `y`).

### Estrutura

- **main.qml**: Contém dois retângulos (`rectFirst` e `rectSecond`) que demonstram as duas abordagens
- Botão "Change enabled" para alternar o estado `enabled` e observar o comportamento reativo de ambas as abordagens

### Aprendizado

- Ambos os métodos são reativos e respondem a mudanças nas dependências
- Propriedades com binding são avaliadas uma vez e reutilizam o valor calculado
- Funções são executadas cada vez que são chamadas, mesmo que o resultado seja o mesmo
- Quando usar cada abordagem considerando performance e eficiência
- Diferença na frequência de avaliação/execução entre propriedades e funções

---

## qml-binding-simple

**Descrição:** Demonstra como **quebrar e restaurar bindings** usando `Qt.binding()`.

### Conceito

Este projeto mostra três cenários diferentes:

1. **Binding inicial**: O retângulo está vinculado ao tamanho da janela
2. **Quebrar binding**: Atribuição direta remove a reatividade
3. **Restaurar binding**: Uso de `Qt.binding()` para recriar a ligação reativa
4. **Atribuição sem reatividade**: Atribuição direta que não mantém a reatividade

### Estrutura

- **main.qml**: Contém um retângulo e três botões que demonstram os diferentes cenários
- **main.cpp**: Configura logging para mostrar informações sobre remoção de bindings

### Funcionalidades

- Botão "Break binding": Remove a reatividade atribuindo valores fixos
- Botão "Qt Binding": Restaura a reatividade usando `Qt.binding()`
- Botão "Resize sem reatividade": Atribui valores calculados sem criar binding

### Aprendizado

- Como quebrar bindings existentes
- Como restaurar bindings usando `Qt.binding()`
- Diferença entre binding reativo e atribuição estática

---

## qml-binding-alias

**Descrição:** Demonstra o uso de **aliases** em QML para expor propriedades de componentes filhos.

### Conceito

Este projeto mostra como usar a palavra-chave `alias` para criar uma referência externa a um elemento interno de um componente, permitindo acesso direto às propriedades do elemento filho.

### Estrutura

- **MyCustomButton.qml**: Componente customizado que expõe o botão interno através de um alias
- **main.qml**: Demonstra como usar o componente e acessar o botão interno através do alias

### Funcionalidades

- Componente `MyCustomButton` que encapsula um `Button`
- Alias `button` que expõe o botão interno
- Acesso e modificação do texto do botão através do alias
- Exibição do texto do botão em outro componente

### Aprendizado

- Como criar e usar aliases em QML
- Encapsulamento de componentes
- Exposição controlada de elementos internos

---

## qml-binding-this

**Descrição:** Demonstra o comportamento do contexto `this` dentro de funções `Qt.binding()`.

### Conceito

Este projeto explora como o contexto `this` se comporta quando usado dentro de `Qt.binding()`, mostrando que `this` se refere ao objeto onde o binding é criado, não necessariamente ao objeto onde a função é definida.

### Estrutura

- **main.qml**: Contém um `Item` e um `Rectangle` interno, ambos usando `Qt.binding()` com `this`

### Funcionalidades

- Criação de bindings usando `Qt.binding()` em `Component.onCompleted`
- Uso de `this` dentro das funções de binding
- Logs no console mostrando o contexto de `this`
- Demonstração de como `this` se comporta em diferentes contextos

### Aprendizado

- Comportamento do contexto `this` em QML
- Como `this` funciona dentro de `Qt.binding()`
- Diferenças de contexto entre diferentes objetos

---

## qml-binding-transfer

**Descrição:** Demonstra a **transferência de dados entre QML e C++** através de um componente registrado.

### Conceito

Este projeto mostra como criar uma ponte entre QML e C++ usando:

- Uma classe C++ que herda de `QObject`
- Propriedades QML (`Q_PROPERTY`) expostas ao QML
- Métodos invocáveis (`Q_INVOKABLE`) acessíveis do QML
- Registro do tipo no engine QML

### Estrutura

- **usercontrol.h/cpp**: Classe C++ `UserControl` com propriedades e métodos
- **main.cpp**: Registra o tipo `UserControl` no engine QML
- **main.qml**: Interface QML que interage com o componente C++

### Funcionalidades

- **UserControl (C++)**: 
  - Propriedades: `dsName` e `dsPhoneNumber`
  - Método: `updateInfomations()` para atualizar os dados
  - Signals: `dsNameChanged()` e `dsPhoneNumberChanged()`

- **Interface QML**:
  - Campos de entrada para nome e telefone
  - Botão para atualizar informações
  - Labels que exibem os dados atualizados do componente C++

### Aprendizado

- Como criar componentes C++ para QML
- Uso de `Q_PROPERTY` para expor propriedades
- Uso de `Q_INVOKABLE` para expor métodos
- Registro de tipos customizados no QML
- Comunicação bidirecional entre QML e C++
- Uso de signals e slots para reatividade

---

## Requisitos

Todos os projetos requerem:

- **Qt 5.15+** ou **Qt 6.x**
- **Qt Quick 2.15+**
- Compilador C++ compatível (MSVC, GCC, Clang)

## Documentação

- [Documentação QML do Qt](https://doc.qt.io/qt-5/qtqml-index.html)
- [Qt Quick Binding](https://doc.qt.io/qt-5/qtqml-syntax-propertybinding.html)
- [Qt Quick Alias](https://doc.qt.io/qt-5/qtqml-syntax-propertybinding.html#alias-properties)

