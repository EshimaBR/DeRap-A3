# DeRap-A3 - Arma 3 Config Auto Decoder

Bem-vindo ao **DeRap-A3**, uma ferramenta dedicada construída para automatizar a desofuscação e extração de arquivos `config.bin` com formatação corrompida (ou ilegível), gerando arquivos legíveis com extensão `.cpp`.

## ⚙️ O que esta ferramenta faz?
Alguns arquivos `config.bin` de mods do Arma 3 são intencionalmente ofuscados para impedir a leitura por ferramentas padrão. Uma das técnicas famosas consiste em: 
1. Adicionar preenchimentos ilegais e invalidar os *magic bytes* originais. *(exemplo: alterá-los de `\0raP` para `_\0raP`).*
2. Injetar "bytes lixo" periodicamente, o que quebra ferramentas comuns e corrompe blocos de árvores.

**O DeRap-A3 corrige isso automaticamente:**
* Analisa inicialmente cada arquivo para conferir como a proteção e a ofuscação estão aplicadas.
* Se os Magic Bytes e Arrays estiverem ofuscados (`_\`0raP`), ele os limpa e injeta a rotina correta.
* Se o arquivo for apenas um `config.bin` comum binarizado da Bohemia (sem a assinatura da ofuscação), ele avisa o usuário e procede com a descompressão.
* Transcreve a árvore (classes, variáveis e arrays) reconstruindo dinamicamente um arquivo legível `.cpp` no formato original!

---

## 🚀 Como usar

A ferramenta foi projetada para ser extremamente fácil, tratada de forma totalmente nativa e protegida como um único executável.

**Processo fácil (Drag & Drop):**
1. Selecione o seu arquivo `.bin` (ofuscado ou não) com o mouse.
2. Arraste-o para cima do arquivo executável `DeRap-A3.exe` e o solte.
3. O programa abrirá rapidamente, limpará a sujeira/lerá a estrutura e criará automaticamente um novo `config.cpp` legível ao lado do original!

---

## 📁 Arquivos da Estrutura

Não necessita de arquivos adicionais para rodar.

---

## ⚠️ Mensagens Comuns

**[ERRO] Arquivo não tem a assinatura raP válida! Abortando.**
Isso significa que o script verificou a estrutura inicial e não encontrou nem os bytes padrão da Bohemia e nem a proteção da biblioteca mapeada. Provavelmente o arquivo foi criptografado ou corrompido de forma irreversível por outro método. Há a chance da proteção apenas ter evoluído.
