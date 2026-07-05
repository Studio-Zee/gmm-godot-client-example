# Godot Client - GMM (Godot Multiplayer Manager)

Este é o projeto base oficial para testar a conexão multiplayer local utilizando o **GMM (Godot Multiplayer Manager)**. Ele já vem configurado com o script de WebSocket pronto para conectar no seu servidor Termux!

## Como testar no seu celular

1. Baixe o App do GMM e crie o seu servidor local.
2. No painel do GMM, clique em **Deploy** e depois copie o seu **Endpoint Godot** (ex: `ws://127.0.0.1:8080`).
3. Baixe este repositório clicando no botão verde `<> Code` > `Download ZIP`.
4. Extraia o ZIP no seu celular.
5. Abra o aplicativo da **Godot Mobile**, clique em "Importar" e selecione o arquivo `project.godot` que você acabou de extrair.
6. Dê o **Play** no projeto!

## Como funciona?

Se o seu servidor GMM estiver rodando corretamente, a tela inicial do jogo vai mudar de "Conectando..." para **ONLINE** e mostrará o seu UUID verde na tela! 

O script principal está no arquivo `Main.gd`. Sinta-se à vontade para estudar o código e adaptar para o seu próprio jogo de RPG, Tiro ou qualquer outro projeto multiplayer!

---
Desenvolvido pela comunidade ZeeGameDev.
