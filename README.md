# Sistema de Multi Idioma

Bem-vindo ao Sistema de Multi Idioma! Este é um projeto que permite adicionar 3 idiomas, mas você pode implementar mais idiomas adicionando funções base. Neste exemplo, os idiomas disponíveis são português, inglês e espanhol.

## Instalação

Siga os passos abaixo para configurar o Sistema de Multi Idioma em seu servidor:

1. Baixe os arquivos do repositório.

2. Após baixar o repositório, você encontrará dois arquivos. Copie o arquivo "LanguageSystem.nut" para a pasta de scripts do seu servidor.

3. Adicione o seguinte código no `onScriptLoad` para carregar as funções do arquivo "LanguageSystem.nut":
   
   ```squirrel
   function onScriptLoad() {
       dofile("scripts/LanguageSystem.nut");
   }
