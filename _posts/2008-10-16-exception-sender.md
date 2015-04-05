---
title: Exception + Sender
author: Lineker Tomazeli
layout: post
permalink: exception-sender
categories:
  - .NET
  - 'C#'
tags:
  - .NET
  - ASP.NET
  - 'C#'
---
Hoje falaremos um pouco sobre tratamento de excessÃµes e sobre o objeto Sender.

**Exceptions**

Para fazermos o tratamento de excessÃµes utilizaremos o Try Catch do c#.  
Ã‰ muito simples e muito importante tambÃ©m, vamos a uma demonstraÃ§Ã£o.

DefiniÃ§Ãµes:  
Try = tenta  
Catch = pega

Estrutura:

&nbsp; Try  
&nbsp; {  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //Entao aqui vem o seu codigo e se houver algum excessÃ£o ( erros ) e ele cairÃ¡ no Catch conforme  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // exemplo abaixo onde estamos tentando converter uma string para int.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string texto = &#8220;Teste&#8221;;  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int numero = Convert.ToInt32(texto);  
&nbsp; }  
&nbsp; Catch(Exception ex)  
&nbsp; {  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //Cai estamos tratando o erro e mostrando na tela.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Console.WriteLine(&#8220;Ocorreu um erro : &#8221; + ex.toString());  
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; }

Podemos ter varios tipo de excessÃµes desde SQL como uma simples conversÃ£o como mostrada acima.  
Sempre devemos colocar os catchs (excessÃµes) da mais complexa para a mais simples, no caso a mais basica (simples ) Ã© a somente Exception. Portanto poderemos ter varios Catch ( cada um com seus exception especifico) para cada Try. EntÃ£o vocÃª dera dizer &#8220;Se ocorrer um erro de SQL faÃ§a isso&#8221; , &#8220;Se ocorrer um erro de dados faÃ§a isso&#8221; e assim por diante.

Mas Lineker, como posso ver qual foi o erro ?  
Quando vocÃª coloca &#8220;Catch(SQLException ex)&#8221; , ex pode ser qualquer nome que vocÃª quiser, estaremos atribuindo a excessÃ£o ao objeto ex. Se quisermos mostrar na tela o erro vamos passar o ex.toString() para aonde desejarmos. Dica: use o intellinsense para ver a propriedades das excessÃµes ( ex: ex.[ira aparecer as propriedades])

**  
Sender</p>

</b>VocÃª perceberÃ¡ este objeto quando criar um evento para por exemplo um botÃ£o. FaÃ§a o teste crie um projeto windows form, coloque um botÃ£o na tela e clique 2 vezes nele e vocÃª verÃ¡:  
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; private void button1_Click(object sender, EventArgs e) {&nbsp; }

O sender nada mais Ã© do que o objeto em si, neste caso o button.  
EntÃ£o se por exemplo vocÃª quer mudar a cor do botÃ£o quando ele for clicado usando o sender ficaria assim:

&nbsp;private void button1_Click(object sender, EventArgs e)  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Button btn = (Button)sender;  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; btn.BackColor = Color.Red;  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

Claro que essa aplicaÃ§Ã£o Ã© simple e nÃ£o faz muito sentido pois poderiamos fazer isso de maneira muito mais facil mas espero ter ajudado e esclarecido algumas duvidas dos novatos.

AbraÃ§os

Lineker Tomazeli
