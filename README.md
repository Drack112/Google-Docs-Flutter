<h1 align="center">Google Flutter App</h1>

<div align="center">
    <a href="#sobre">Sobre</a> | <a href="#tecnologias">Tecnologias</a> | <a href="#run">Rodando o projeto</a>
</div>

<a id="sobre"></a>

## 🚀 Sobre

Aplicação multiplataforma desenvolvido em Flutter (ios, android e web) com o foco de ter as mesmas funcionalidades do Google Docs. A aplicação conta com o mesmo sistema de edição colaborativa de documentos via WebSocket e um sistema de autenticação OAuth2 usando ferramentas da plataforma Google Cloud Platform(GCP).🥰

<a id="tecnologias"></a>

## :computer: Tecnologias

### Mobile/Web

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)

### Infra
![Google Cloud](https://img.shields.io/badge/GoogleCloud-%234285F4.svg?style=for-the-badge&logo=google-cloud&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

### Backend

![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![Socket.io](https://img.shields.io/badge/Socket.io-black?style=for-the-badge&logo=socket.io&badgeColor=010101)
![JWT](https://img.shields.io/badge/JWT-black?style=for-the-badge&logo=JSON%20web%20tokens)



https://user-images.githubusercontent.com/61944386/222469140-69da68f8-a51a-4d3d-93f4-d83d8bf6ca33.mp4



<a id="run"></a>

#### 💽 1. Pré-requisitos:

- **[Node.js](https://nodejs.org/en/)**, **[Git](https://git-scm.com/)**, um gerenciador de pacotes node (**[NPM](https://www.npmjs.com/)** ou **[Yarn](https://yarnpkg.com/)**) instalado na máquina, **[Docker](https://docker.com)** e o SDK do **[Flutter](https://flutter.dev/)**.

#### 💮 2. Configurando o ambiente

Na pasta docs, existe dois arquivos nomeados de `index.html` e `info.plist`, esses arquivos servem de configuração para setar o cliente OAUTH2 no projeto.

Para mais informações de como você pode gerar o cliente OAUTH2 nas plataformas web, android e IOS, aqui está um guia de como configurar:

https://developers.google.com/identity/protocols/oauth2?hl=pt-br

Lembre-se de ativar os escopos do PeopleAPI, tais como `/auth/userinfo.email` e `/auth/userinfo.profile`.

E também ativar o serviço do PeopleAPI na plataforma da GCP.

#### 📇 2.1 Configurando portas e host

No portal da GCP, quando você gerar seu cliente OAUTH2 com ID e etc, lembre-se de no campo **Authorized JavaScript origins** você colocar as opções de 

    - http://localhost
    - http://localhost:3000
    
⚠️ O projeto flutter roda obrigatóriamente sobre a porta 3000, então se certifique que está porta no seu PC está livre ⚠

##### 🔑 2.2 - Configurando os tokens e id's do oatuh2

Com os clientes e tokens configurados, baixe os arquivos dos clientes android e IOS na tela inicial de credenciais, para android renomeie o arquivo baixado para **google-services-2.json** e mova ele para a pasta `android/app/`.

Com o cliente IOS, baixe o arquivo em formato plist e renomeie para **GoogleService-info.plist**, depois mova-o para `ios/Runner`.

<br>

Pegue o seu OAUTH2_CLIENT_ID e insira o ID nos arquivos `index.html` e `info.plist` que estão na pasta `docs`

*Detalhe, você também precisa do secret que está no cliente web do oauth2*

```html
...
 <meta name="google-signin-client_id" content="OAUTH2_CLIENT_ID">
...
 <body>
  <script>
    window.addEventListener('load', function(ev) {
      // Download main.dart.js
      _flutter.loader.loadEntrypoint({
        serviceWorker: {
          serviceWorkerVersion: serviceWorkerVersion,
        },
        onEntrypointLoaded: function(engineInitializer) {
          engineInitializer.initializeEngine().then(function(appRunner) {
            appRunner.runApp();
          });
        }
      });
    });
  </script>
  <script src="https://apis.google.com/js/api.js"></script>
  <script src="https://accounts.google.com/gsi/client" async defer></script>
  <script>
   function start() {
     gapi.client.init({
       'apiKey': 'OAUTH2_API_KEY_WEB_CLIENT',
       'clientId': 'OAUTH2_CLIENT_ID',
     });
   };
   gapi.load('client', start);
</script>
</body
```

No arquivo **GoogleService-Info.plist** que você baixou, encontre a key **REVERSE_ID_CLIENT** e insira em `<string></string>`

``` xml
<array>
			<dict>
				<key>CFBundleTypeRole</key>
				<string>Editor</string>
				<key>CFBundleURLSchemes</key>
				<array>
					<!-- O valor da string se encontra em GoogleService-Info.plist [REVERSE_ID_CLIENT] -->
					<string></string>
				</array>
			</dict>
</array>
```

#### 🏝️ 3. Levantando o servidor Backend com Node

Suba o servidor Node utilizando Docker, basta navegar até a pasta **server/**

#### 📲 4. Rodando o flutter

Com o servidor Backend de pé, baixe as deps do projeto usando o commando:

``` bash
dart pub get
```

Depois disso, rode a aplicação web com o seguinte comando

```bash
flutter run -d chrome --web-host localhost --web-port 3000
```

###### Dica: 🤫

Caso você não queira rodar o chrome, faça um export da var **CHROME_EXECUTABLE** com o arquivo binário do seu navegador, o flutter vai reconhecer ele como Chrome.

Se você quiser rodar o projeto no seu android/IOS, utilize o comando:

``` bash
flutter run -d [id_do_seu_dispositivo]
```

#### _Sinta-se livre para colaborar, toda ajuda é bem vinda ;)_

<br/>
