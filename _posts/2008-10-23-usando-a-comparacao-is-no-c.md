---
title: 'Usando a comparaÃ§Ã£o &#8220;Is&#8221; no C#'
author: Lineker Tomazeli
excerpt: 'ExplicaÃ§Ã£o simples sobre a comparaÃ§Ã£o IS do C#.'
layout: post
permalink: usando-a-comparacao-is-no-c
categories:
  - .NET
  - 'C#'
tags:
  - .NET
  - ASP.NET
  - 'C#'
  - Framework .NET
---
O comando de comparaÃ§Ã£o** Is** Ã© utilizado para comparar objetos. Veja o exemplo abaixo:

Criei um botÃ£o na tela e codifiquei uma verificaÃ§Ã£o.

** if (Button1 is Button)  
{  
Response.Write(&#8220;Button1 Ã© um botÃ£o!&#8221;);</p>

}</strong>

Claro que este Ã© um exemplo muito simples e inÃºtil mas podemos utilizar num ambiente mais complexo e usando heranÃ§as, vejam:

Imagine que temos 2 classes uma chamada **Gerente** e outra **Pessoa** e a classe **Gerente herda Pessoa**.

**public class Pessa  
{ &#8230;.. }  
public class Gerente:Pessoa  
{ &#8230;&#8230; }  
**

** Private void teste()  
{  
Gerente objGerente = new Gerente();  
if(objGerente is Pessoa)  
{**

** Response.Write(&#8220;A classe Gerente Ã© Pessoa&#8221;)  
}  
else  
{ &#8230; }  
}**

Qualquer duvida perguntem&#8230;. e deixe seu feedback

AbraÃ§os

Lineker
