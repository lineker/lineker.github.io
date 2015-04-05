---
title: 'Dica&#8230;Framework .NET 3.5 &#8211; StringBuilder e String Format'
author: Lineker Tomazeli
layout: post
permalink: dicaframework-net-35-stringbuilder-e-string-format
categories:
  - Uncategorized
tags:
  - .NET
  - ASP.NET
  - Framework .NET
---
A dica de hoje vai pra 2 classes novas que foram inseridos no framework e que sÃ£o muito Ãºteis quando se tratando de &#8220;best practices&#8221; e utilizaÃ§Ã£o de memÃ³ria.

**StringBuilder**

String builder veio para convencionar a concatenaÃ§Ã£o de strings.  
Antigamente nos viamos programadores concatenarem as string de select e update da vida, por ex:

*string str =&#8221;select produto&#8221;;  
str = str + &#8220;from tb_produto&#8221;;  
str = str + &#8220;where id = 1&#8243;;*

Agora nos utilizaremos um mÃ©todo muito mais elegante e eficaz pra fazer isso.

*//Declare o namespace System.Text  
using System.Text;*

*// Vamos estanciar a classe  
StringBuilder sb = new StringBuilder();  
// E agora vamos adicionar strings  
sb.Append(&#8220;select produto&#8221;);  
sb.Append(&#8220;from tb_produto&#8221;);  
sb.Append(&#8220;where id = 1&#8243;);*

*// passamos a string para aonde for conveniente  
string r = sb.ToString();*

ps: No objeto StringBuilder pode ser adicionado outros valores como int, char entre outros.  
Veja mais :<a href="http://msdn.microsoft.com/pt-br/library/2839d5h5.aspx" target="_blank"> http://msdn.microsoft.com/pt-br/library/2839d5h5.aspx</a>

**String Format**

****Nada mais Ã© do que uma funÃ§Ã£o que substituirÃ¡ um item na string por seu correspondente.  
Vamos aos exeplos que ficarÃ¡ mais claro.

Um exemplo clÃ¡ssico Ã© na utilizaÃ§Ã£o do Responde.Redirect quando utilizavamos assim:

*Response.Redirect(&#8220;teste.aspx?id=&#8221; + txtId.Text + &#8220;&nome=&#8221; + txtnome.Text );*

**Utilizando o string format ficarÃ¡ assim:

*Response.Redirect(*string.Format(&#8220;teste.aspx?id={0}&nome={1}&#8221;,txtId.Text,txtnome.Text));

Lembrando que comeÃ§aremos a contagem sempre do 0 e que devem seguir na ordem.

abraÃ§os e boa semana.

Lineker Tomazeli
