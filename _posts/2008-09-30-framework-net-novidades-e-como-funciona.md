---
title: 'Framework .NET novidades e como funciona&#8230;'
author: Lineker Tomazeli
layout: post
permalink: framework-net-novidades-e-como-funciona
categories:
  - .NET
tags:
  - .NET
  - ASP.NET
  - Framework 3.5
---
OlÃ¡ pessoal, depois de uma temporada sem post estamos de volta com uma serie de dicas sobre a tecnologia .NET da Microsoft.  
PeÃ§o desculpas por ter estado ausente mas acreditem, foram por forÃ§as maiores.

Mas vamos lÃ¡, hoje explicarei um pouquinho de como funciona a linguagem interpretada e sua vantagens.

Para comeÃ§ar vamos entender alguns conceitos:  
&#8211; A familia .NET esta toda baseada na CLS ( Common Language Specification ) que sÃ£o as regras que se deve seguir para que o interpretador possa interpretar o seu codigo para liguagem de maquina ( binary code ou native code ) e assim a mÃ¡quina possa fazer o que voÃ§Ãª solicitou.

Vamos analizar o diagrama:

<div>
  <img style="max-width:800px;" src="http://tomazeli.files.wordpress.com/2008/09/clr.jpg" alt="" width="483" height="263" /></p>

  <div>
    Por tanto vocÃª escreve seu codigo e compila ele com o seu respectivo compilador e voÃ§Ãª terÃ¡ como resultado o MSIL code ( Microsoft Intermediare Language ou Assembly ) que nada mais Ã© seu .exe se for winforms ou .dll se for webforms e assim quando for a hora ele sera interpretado e passado para binary code ( codigo que utiliza somente 1 e 0. ex: 00110101)</p>

    <p>
      Mas dai vem a pergunta mas qual a diferenÃ§a da linguagem compilada?<br /> Bom uma das grandes desvantagens das liguagens compiladas Ã© que se vocÃª faz seu programa e compila no seu computador que Ã© um pentium 3 e entÃ£o vocÃª troca seu pentium 3 por um duo core achando que o processamento serÃ¡ mais rÃ¡pido, vocÃª se engana, pois ele terÃ¡ o mesmo desempenho que o pentium 3, pois o codigo foi compilado para aquele hardware. JÃ¡ a linguagem interpretada, como ela Ã© compilada na hora da execuÃ§Ã£o, ela Ã© compilada para o hardware do momento podendo utilizar todo o recurso disponÃ­vel.
    </p>

    <p>
      Outras novidades e dicas do framework sÃ£o:
    </p>

    <ul>
      <li>
        Garbage Collection : Ã‰ um mecanismo que jÃ¡ vem por default no framework que fica checando para ver senÃ£o existem variÃ¡veis que nÃ£o estÃ£o sendo utilizadas na memÃ³ria e as retira para economizar recursos.
      </li>
      <li>
        Namespaces: Nada mais Ã© do que um agrupador lÃ³gico de classes.
      </li>
      <li>
        Multithread: VocÃª pode iniciar multiplos processos ao mesmo tempo. Veremos isso num proximo post.
      </li>
    </ul>

    <p>
      Bom gente espero que tenha esclarecido um pouco este assunto.
    </p>

    <p>
      Lineker Tomazeli
    </p>
  </div>
</div>

Categorias do Technorati <a class="performancingtags" rel="tag" href="http://technorati.com/tag/.NET">.NET</a>, <a class="performancingtags" rel="tag" href="http://technorati.com/tag/Dev">Dev</a>
