---
title: 'Instalando sua iOS app &#8211; Deploying your iOS app'
author: Lineker Tomazeli
layout: post
permalink: deploying-your-ios-app

---
<div>
  Infelizmente, a Apple ainda nÃ£o liberou ( e provavelmente nÃ£o ira ) a instalaÃ§Ã£o de aplicaÃ§Ãµes (para teste) em devicesÂ  iOS para aqueles que nÃ£o sÃ£o membros do programa de desenvolvedor.
</div>

<div>
  Para se afiliar como membro do programa de desenvolvedor Apple vocÃª devera pagar uma taxa de US$99/ano o que te darÃ¡ a habilidade de instalar via adhoc sua aplicaÃ§Ã£o em ate 100 devices.
</div>

<div>
  Mas existe uma soluÃ§Ã£o se o seu iphone, ipad ou ipod Ã© jailbroken.
</div>

<div>
  Siga as seguintes instruÃ§Ãµes:
</div>

<div>
  <h2>
    Criar Self-Signed Certificado
  </h2>

  <p>
    Primeiramente vocÃª devera criar um self signed certificate e patch seu iPhone SDK para possamos usa-lo:
  </p>

  <ol>
    <li>
      Execute Keychain Access.app. Com nenhuma item selecionado, no Keychain menu selecione Certificate Assistant, entÃ£o Create a Certificate.<br /> Name: iPhone Developer<br /> Certificate Type: Code Signing<br /> Let me override defaults: Yes
    </li>
    <li>
      Clique ContinueValidity: 3650 days
    </li>
    <li>
      Clique Continue
    </li>
    <li>
      Deixe em branco o campo do Email .
    </li>
    <li>
      Clique em Continue atÃ© o final.VocÃª devera ver no final, algo do tipo &#8220;This root certificate is not trusted&#8221;. Isso era de se esperar, nÃ£o se preocupe.
    </li>
    <li>
      Configure o iPhone SDK para utilizar self-signed certificate :<br /> <blockquote>
        <p>
          sudo /usr/bin/sed -i .bak &#8216;s/XCiPhoneOSCodeSignContext/XCCodeSignContext/&#8217; /Developer/Platforms/iPhoneOS.platform/Info.plist
        </p>
      </blockquote>
    </li>
  </ol>

  <p>
    Este comando ira criar um backup do arquivo Info.plist e modificar a opÃ§Ã£o necessÃ¡ria, se quiser voltar para a configuraÃ§Ã£o normal, vocÃª devera renomear o arquivo somente.Se o Xcode estava aberto, feche e abra novamente para que carregue as novas configuraÃ§Ãµes
  </p>

  <h2>
    Deployment Manual via WiFi
  </h2>

  <p>
    Os seguintes passos necessitam <strong>openssh</strong> e <strong>uikittools</strong> instalados primeiramente no devices.
  </p>

  <p>
    Para compilar manualmente e instalar sua aplicaÃ§Ã£o no seu device como uma system app:
  </p>

  <ol>
    <li>
      Project, Set Active SDK, Device e Set Active Build Configuration, para Release.
    </li>
    <li>
      Compile seu projeto normalmente (usando Build, e nÃ£o Build & Go).
    </li>
    <li>
      Na pasta <code>build/Release-iphoneos</code> vocÃª encontrar seu app bundle.
    </li>
    <li>
      Use seu mÃ©todo preferido (via ssh) para transferir sua app para a pasta /Applications no device.
    </li>
    <li>
      Avise SpringBoard que uma nova aplicaÃ§Ã£o foi instalada:<br /> <blockquote>
        <p>
          <code>ssh mobile@myiphone.local uicache</code>
        </p>
      </blockquote>

      <p>
        Isso somente deve ser feito quando vocÃª adiciona ou deleta aplicaÃ§Ãµes. aplicaÃ§Ãµes atualizadas nÃ£o precisam desse passo.</li> </ol>

        <p>
          Note que se vocÃª desejar deletar a aplicaÃ§Ã£o, a mesma nÃ£o poderÃ¡ ser feita via SpringBoard interface, vocÃª terÃ¡ que usar ssh para deletar e atualizar o SpringBoard:
        </p>

        <pre><code>ssh root@myiphone.local rm -r /Applications/myApp.app
ssh mobile@myiphone.local uicache

Agora Ã© sÃ³ abrir sua aplicaÃ§Ã£o e enjoy it!
Abracos

fonte:</code>http://stackoverflow.com/questions/37464/iphone-app-minus-app-store</pre></div>
