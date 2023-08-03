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

4. Também adicione a seguinte linha no onScriptLoad para criar uma array "Language" com o número máximo de jogadores para que seja possível trocar entre idiomas:

   ```squirrel
   function onScriptLoad() {
       dofile("scripts/LanguageSystem.nut");
       Language <- array(GetMaxPlayers(), 1);
   }

5. Adicione o comando "idioma" na função onPlayerCommand para permitir que os jogadores alterem o idioma:
   ```squirrel
   function onPlayerCommand( player, cmd, text ) {
       else if ( cmd == "idioma" || cmd == "language" || cmd == "linguagem" ) {
           if (!text) {
               S_MSG(sintaxe + cmd + " <pt/en/es>", player);
           }
           else if (text == "pt") {
               if (Language[ player.ID ] == 0 ) {
               E_MSG("O idioma ja esta definido como Portugues.", player);
           }
           else {
                   Language[ player.ID ] = 0;
                   I_MSG("Idioma definido como Portugues.", player);
               }
           }
           else if (text == "en") {
               if (Language[ player.ID ] == 1 ) {
               E_MSG("The language is already set to English.", player);
           }
           else {
                   Language[ player.ID ] = 1;
                   I_MSG("Language set to English.", player);
               }
           }
           else if (text == "es") {
               if (Language[ player.ID ] == 2 ) {
               E_MSG("El idioma ya esta configurado en espanol.", player);
           }
           else {
                   Language[ player.ID ] = 2;
                   I_MSG("Idioma configurado en espanol.", player);
               }
           }
           else E_MSG(getMsgByLanguage("Esse idioma nao esta na lista.", "This language is not on the list.", "Este idioma no esta en la lista.", player), player);
       }
   }

6. Para trocar o idioma, use o comando /idioma seguido da sigla do idioma: "pt" para português, "en" para inglês e "es" para espanhol.
