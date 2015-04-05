---
title: 'Monitorando sua rede&#8230;'
author: Lineker Tomazeli
layout: post
permalink: monitorando-sua-rede

---
Hoje decidi que gostaria de monitorar minha rede. Ver quanto de bandwidth estamos usando na nossa rede. Para isso fiz uma pesquisa rapida e encontrei uma ferramenta chamadaÂ **bandwidthd**, no qual funciona como um sniffer na rede, monitorando os packets enviados e recebidos das maquinas conectadas.

Para instalar, vocÃª precisarÃ¡ de uma maquina com alguma distribuiÃ§Ã£o linux, estou usando Ubuntu 8.04. Siga os seguintes passos para instalar a aplicaÃ§Ã£o e o servidor web apache onde vocÃª terÃ¡ acesso a alguns relatorios:

  1. apt-get install bandwidthd  
    A instalaÃ§Ã£o ira pedir para escolher qual interface esta conectada com a rede.
  2. apt-get install apache2
  3. cd /var/www e crie um soft link para o diretorio htdocs Â que o bandwidthd usa (veja /etc/bandwidthd/bandwidthd.conf)  
    ln -s /var/lib/bandwidthd/htdocs bandwidthd  
    onde bandwidthd Ã© o nome do link
  4. restarte o servidor apache /etc/init.d/apache2 restart (e o bandwidthd se necessario /etc/init.d/bandwidthd restart)
  5. acesse bandwidthd no seu browser  
    http://<localhost ou IP>/bandwidthd

[<img class="aligncenter size-medium wp-image-207" title="bandwidth" src="http://tomazeli.files.wordpress.com/2011/03/bandwidth.png?w=300" alt="" width="300" height="173" />][1]

http://sourceforge.net/projects/bandwidthd/

 [1]: http://tomazeli.files.wordpress.com/2011/03/bandwidth.png
