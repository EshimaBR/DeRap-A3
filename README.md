# DeRep v1.1 - Arma 3 Config Auto Decoder

Bem-vindo ao **DeRep v1.1**, uma ferramenta dedicada construída para automatizar a desofuscação e extração de arquivos `config.bin` com formatação corrompida (ou ilegível), gerando arquivos legíveis com extensão `.cpp`.

## ⚙️ O que esta ferramenta faz?
Alguns arquivos `config.bin` de mods do Arma 3 são intencionalmente ofuscados para impedir a leitura por ferramentas padrão. Uma das técnicas famosas consiste em: 
1. Adicionar preenchimentos ilegais e invalidar os *magic bytes* originais. *(exemplo: alterá-los de `\0raP` para `_\0raP`).*
2. Injetar "bytes lixo" periodicamente, o que quebra ferramentas comuns e corrompe blocos de árvores.

**O DeRep v1.1 corrige tudo isso automaticamente:**
* Analisa inicialmente cada arquivo para conferir se pertence à biblioteca de assinaturas já mapeada.
* Ao detectar a assinatura restrita, isola a sujeira e extrai as lógicas, reconstruindo um `config.cpp` legível de forma estática.
* Se a estrutura for desconhecida e estiver fora da biblioteca de assinaturas, ele aborta a execução e notifica você de forma segura (prevenindo travamentos ou lixo).

---

## 🚀 Como usar

A ferramenta foi projetada para ser extremamente fácil, sem necessitar abrir o prompt de comando a menos que queira.

**Processo fácil (Drag & Drop):**
1. Pegue o seu arquivo `.bin` ofuscado com o mouse.
2. Arraste-o para cima do arquivo `arraste_aqui.cmd` e o solte.
3. O script do PowerShell abrirá rapidamente, limpará o arquivo e salvará um novo `config.cpp` legível ao lado do original!

---

## 📁 Arquivos da Estrutura

Para o roteiro funcionar, **não tente separar a dupla**. Mantenha os arquivos juntos:

* `arraste_aqui.cmd`: O atalho para o usuário fazer o "arrastar e soltar". Somente invoca a lógica de fundo.
* `derap_smart.ps1`: O núcleo da operação (o "cérebro"). É aqui que a detecção de assinatura e a lógica de inteligência de contorno de ofuscação estão aplicadas.

---

## ⚠️ Possíveis Alertas no Uso

**[ERRO] Este arquivo está com uma codificação fora da minha biblioteca de assinaturas. Contate o Dev.**
Isso significa que o script verificou a estrutura inicial e confirmou que a proteção usada não foi mapeada na sua atual biblioteca de assinaturas do DeRep v1.1 (ela não tem a assinatura `_\0raP`). Neste caso, não há nada de errado, a proteção apenas evoluiu ou é de um ofuscador completamente diferente. Em caso de dúvidas, contate o desenvolvedor para expandir a biblioteca de reconhecimento.

---
