---
title: 'Assembly Programming &#8211; Parte 1'
author: Lineker Tomazeli
layout: post
permalink: assembly-programming-parte-1

tags:
  - assembly
  - MicroCode
  - Programming
---
Bom depois de muito tempo sem artigos estou de volta para comeÃ§ar uma sÃ©rie em assembly programming bÃ¡sico.

Assembly Ã© a linguagem mais prÃ³xima dos 0&#8217;s e 1&#8217;s (que Ã© a Ãºnica coisa que o computador entende).  
Em qualquer outra linguagem de programaÃ§Ã£o o compiler tem o trabalho de traduzir seu cÃ³digo (high level) para assembly (low-level) e dai o assembler converte para 1&#8217;s e 0&#8217;s. entÃ£o se vocÃª nÃ£o tem a mÃ­nima ideia de como o computador processa cada instruÃ§Ã£o ou como pode o computador entender somente 1&#8217;s e 0&#8217;s eu recomendo o livro &#8221; Computer Organization and Design &#8221; by David A. Patterson e John L. Hennesy.

Nesse tutorial estaremos usando o simulador MIPS, que utiliza o processador do tipo RISC. Cada processador tem comandos diferentes na sua linguagem assembly. Ã‰ por isso que se vocÃª escrever um programa assembly para MIPS, o mesmo nÃ£o ira funcionar em um processador Intel ou AMD. Processadores Intel e AMD tem uma tabela de commandos muito similar e isso minimiza os problemas de compatibilidade entre eles.

Aonde eu usaria assembly ? Por ser uma linguagem low-level Ã© extremamente rÃ¡pida se utilizada de maneira correta. Assembly tambÃ©m Ã© muito utilizado quando vocÃª quer se comunicar diretamente com o hardware do computador, por isso Ã© utilizado tambÃ©m para criar drivers para devices. E se vocÃª ainda nÃ£o esta convencido a aprender assembly, eu te digo que se vocÃª sempre imaginou como alguÃ©m pode criar um crack para uma aplicaÃ§Ã£o&#8230; Ã‰ utilizando uma tÃ©cnica chamada disassembly, que simplesmente converte o .exe para assembly e assim vocÃª pode ver o que esta acontecendo na aplicaÃ§Ã£o e descobrir como a aplicaÃ§Ã£o utiliza aquele serial que vocÃª entrou na instalaÃ§Ã£o.

No prÃ³ximo artigo entraremos a fundo na syntax da linguagem.

Boa sorte a todos e nÃ£o se esqueÃ§a de aprender como o computador processa instruÃ§Ãµes antes de ler a prÃ³xima parte.

AbraÃ§os
