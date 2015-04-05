---
title: 'Isolamento de Classes &#8211; .NET'
author: Lineker Tomazeli
excerpt: Resumo sobre Isolamento de classes
layout: post
permalink: isolamento-de-classes-net
categories:
  - .NET
  - 'C#'
tags:
  - .NET
  - Framework .NET
---
<img style="max-width:800px;float:left;margin-top:10px;margin-bottom:10px;margin-right:10px;" src="http://tomazeli.files.wordpress.com/2008/11/security.jpg" alt="" />

Muitas dÃºvidas tem surgido sobre isolamento de classes e entÃ£o resolvi escrever este pequeno artigo. Vamos lÃ¡.

Quando usamos isolamento de classes ?  
Iremos usar diferentes tipos de isolamento de classe quando queremos proteger uma classe de ser estanciada ou herdada.  
Quem mais utiliza isto?  
Podemos encontrar essa prÃ¡tica em muitos componentes prontos que sÃ£o vendidos.

NÃ³s temos 3 tipos de isolamento de classes:

  * Classe abstrata ( abstract ) &#8211; NÃ£o Ã© possÃ­vel estanciar mas pode ser herdada

Exemplo:  
abstract classÂ  MinhaClass {Â Â Â  }

  * Classe de construtor privado ( private ) &#8211; NÃ£o Ã© possivel estanciar a classe mas pode ser herdada

Exemplo:

private MinhaClasse()  
{  
}

  * Classe Isolada ( sealed ) &#8211; NÃ£o pode ser herdada mas pode ser estanciada

Por tanto se vocÃª juntar um construtor privado com uma classe isolada vocÃª terÃ¡ uma classe extremamente protegida.

Deixe seu comentÃ¡rio.

AbraÃ§os

Lineker Tomazeli
