---
title: Usando Multithread no Framework .NET
author: Lineker Tomazeli
layout: post
permalink: usando-multithread-no-framework-net
categories:
  - Uncategorized
---
Depois de um final de semana ensolarado estamos de volta com mais um dos assuntos comentadissimos no momento , threads ou melhor multithread, que Ã© nada mais nada menos do que muitas vÃ¡rias aÃ§Ãµes ocorrendo ao mesmo tempo.

Iremos fazer um exemplo hoje usando uma aplicaÃ§Ã£o windows services onde teremos 2 threads rodando ao mesmo tempo.

Primeiramente vamos criar o projeto windows form application.

<div>
  <img style="max-width:800px;" src="http://tomazeli.files.wordpress.com/2008/11/snap1.jpg" alt="" />
</div>

Depois adicione duas classes chamadas class1.cs e class2.cs

<div>
  <img style="max-width:800px;" src="http://tomazeli.files.wordpress.com/2008/11/snap2.jpg" alt="" />
</div>

Abra o Form1.cs e vamos codificar um pouco.

Declare o namespace System.Threading.

*******using System.Threading;***

******Abra as classes que que foram criadas e crie um mÃ©todo em cada, pois chamaremos estes mÃ©todos para iniciarmos a thread.

<div>
  <img style="max-width:800px;" src="http://tomazeli.files.wordpress.com/2008/11/snap3.jpg" alt="" />
</div>

Voltando para o Form1.cs em Design Mode de um duplo clique no form para criar o evento **Form1_Load** no code behind e entÃ£o vamos adicionar as seguintes linhas de codigo para iniciarmos as thread .

**** *//Estanciando a class1  
Class1 objC = new Class1();  
//Criamos um objeto ThreadStart que serve para setar qual mÃ©todo irÃ¡ iniciar a Thread.  
ThreadStart obj1 = new ThreadStart(objC.FazerAcao1);  
//Criamos um objeto do tipo Thread e passamos como parametro o objeto ThreadStart  
Thread th = new Thread(obj1);  
//Iniciamos a Thread  
th.Start();*

* Class2 objC2 = new Class2();  
ThreadStart obj2 = new ThreadStart(objC.FazerAcao1);  
Thread th2 = new Thread(obj2);  
th2.Start();*

Coloque um break point no **Form1_Load **mÃ©todo e rode a aplicaÃ§Ã£o,passe passo-a-passo usando F11 e perceba que as thread sÃ£o iniciadas e a aplicaÃ§Ã£o continua rodando. Usando esta tÃ©cnica vocÃª pode fazer e tomar varias acÃµes ao mesmo tempo na sua aplicaÃ§Ã£o.

Vale lembrar que multithread tambÃ©m funcionam para aplicaÃ§Ã£o .NET, incluindo web. Lembre-se que quanto mais threads mais memÃ³ria serÃ¡ consumida na mÃ¡quina.

Um exemplo prÃ¡tico da utilizaÃ§Ã£o disto Ã© quando vocÃª tem um windows services que fica fazendo algum tipo de verificaÃ§Ã£o no seu sistema, pode ser feito um unico serviÃ§o que faÃ§a vÃ¡rias verificaÃ§Ãµes ao mesmo tempo, conecte com outros serviÃ§os e por ai vai.

Coloquei o arquivo fonte com os exemplo abaixo e qualquer dÃºvida e sugestÃµes sÃ£o sempre bem-vindas.

[<img class="alignnone size-full wp-image-129" title="snap6" src="http://tomazeli.files.wordpress.com/2008/11/snap6.jpg" alt="snap6" width="91" height="85" />][1]

AbraÃ§os

Lineker Tomazeli

 [1]: http://cid-04a483189133b6e0.skydrive.live.com/self.aspx/P%c3%bablica/Multithread.zip
