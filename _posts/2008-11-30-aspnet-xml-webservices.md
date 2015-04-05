---
title: ASP.NET XML webservices
author: Lineker Tomazeli
excerpt: Sobre ASP.NET XML Webservices
layout: post
permalink: aspnet-xml-webservices
categories:
  - .NET
  - 'C#'
tags:
  - .NET
  - ASP.NET
  - Web Services
  - XML
---
Hoje falaremos sobre XML webservices, um pouca da sua histÃ³ria e o objetivo dele ter sido desenvolvido e estaremos criando e consumindo um ao final deste artigo.

Simplificando a utilidade dos webservices teremos uma explicaÃ§Ã£o simples que Ã© a integraÃ§Ã£o de sistemas distintos mas que precisam trocar informaÃ§Ãµes.  
Antigamente essa integraÃ§Ã£o era feita via RPC ( Remote Procedure Call ) e depois evoluiu para RPC â€“ over http no qual utilizava a porta 143 para se comunicar. A tecnologia RPC tem vÃ¡rios problemas, sÃ£o eles:

â€¢ A data dos sistemas que estÃ£o tentando trocar informaÃ§Ãµes devem estar sincronizadas, isto Ã©, exatamente iguais.  
â€¢ Existiam muitas diferenÃ§as na linguagem quando os sistemas eram diferentes.  
â€¢ As chamadas eram sÃ­ncronas.

Portanto para acabar com todos esses problemas foi criado o webservices utilizando o XML como linguagem de comunicaÃ§Ã£o. O XML foi implantado e padronizado pela W3C.

Existem alguns itens que sÃ£o importantes saber para criarmos um webservices:

WSDL â€“ Web Service Description Language &#8211; Nele estÃ£o descriminados todos os pontos de entrada, descriÃ§Ã£o de classes, mÃ©todos e outras informaÃ§Ãµes. ( Ele Ã© criado de acordo com as regras da W3C)

DISCO â€“ Discovery â€“ Armazena os contratos com relaÃ§Ã£o ao webservices ( Ele Ã© gerado somente por webservices da Microsoft)

UDDI â€“ WWW.uddi.org &#8211; Funciona como as pÃ¡ginas amarelas dos webservices onde vocÃª pode cadastrar o seu webservices e disponibiliza-lo ao pÃºblico e tambÃ©m achar e consumir algum do seu interesse.

SOAP â€“ Simple Object Access Protocol â€“ Ã‰ a linguagem que os webservices utilizam para trafegar as informaÃ§Ãµes entre eles.

Existem 2 tipos de chamadas quando estamos consumindo um webservices

1. Direct call â€“ Chamadas feitas direto do browser para o webservices.  
2. Proxy call â€“ AplicaÃ§Ã£o fazendo chamadas para o webservices onde nÃ£o tem uma camada de apresentaÃ§Ã£o.

Bom, agora vamos botar a mÃ£o na massa e criar e consumir nosso webservices.

Vamos abrir o Visual Studio 2008 SP 1 e criar um projeto do tipo ASP.NET Web Services application.

<img src="http://tomazeli.files.wordpress.com/2008/11/snap11.jpg" alt="" width="400" />

Iremos perceber que ele jÃ¡ criou um WebMethod de exemplo quer se chamarmos ele irÃ¡ nos retornar um â€œHello Worldâ€.

Agora vamos criar um mÃ©todo nosso onde ele irÃ¡ receber 2 numeros, fazer a soma deles e retornar o resultado.

Nosso cÃ³digo ficarÃ¡ assim:

<img src="http://tomazeli.files.wordpress.com/2008/11/snap31.jpg" alt="" width="550" />

Simplesmente fazendo isso nÃ³s jÃ¡ temos nosso webservices pronto para funcionar. Lembrando que o webservices Ã© como se fosse um website entÃ£o se quisermos botar para funcionar devemos simplesmente criar o diretÃ³rio virtual no IIS, mas como estÃ£o rodando nossa aplicaÃ§Ã£o no VS 2008 ele criarÃ¡ o web Server virtual para nÃ³s.

Iremos criar agora uma aplicaÃ§Ã£o web e montar nossa tela de input. Vamos adicionar um projeto a nossa soluÃ§Ã£o

![][1]

Nossa tela ficarÃ¡ assim:

![][2]

De um Build na soluÃ§Ã£o para ver se nÃ£o tem nenhum erro.

Agora iremos adicionar a referencia do nosso WebService ao nosso projeto web para que possamos consumir e chamar o mÃ©todo que criamos.

Para adicionar a referencia, clique com o botÃ£o direito em cima do projeto web no solution Explorer e clique em Add Service Reference

![][3]

Depois na prÃ³xima tela clique em Discovery , selecione o nosso webservices que ele achou automaticamente e clique em OK.

![][4]

Feito isso iremos programar um pouco.  
De um duplo clique no botÃ£o da tela e insira o seguinte cÃ³digo:

<img src="http://tomazeli.files.wordpress.com/2008/11/snap7.jpg" alt="" width="550" />

Agora podemos rodar nossa aplicaÃ§Ã£o e testar nossa â€œsuperâ€ calculadora.

Boa sorte a todos e qualquer dÃºvida pode perguntar.

AbraÃ§os

Lineker Tomazeli

 [1]: http://tomazeli.files.wordpress.com/2008/11/snap21.jpg
 [2]: http://tomazeli.files.wordpress.com/2008/11/snap4.jpg
 [3]: http://tomazeli.files.wordpress.com/2008/11/snap5.jpg
 [4]: http://tomazeli.files.wordpress.com/2008/11/snap61.jpg
