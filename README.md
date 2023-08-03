# Multi-Language System

Welcome to the Multi-Language System! This is a project that allows you to add 3 languages, but you can implement more languages by adding base functions. In this example, the available languages are Portuguese, English, and Spanish.

## Installation

Follow the steps below to set up the Multi-Language System on your server:

1. Download the files from the repository.

2. After downloading the repository, you will find two files. Copy the "LanguageSystem.nut" file to the scripts folder of your server. In the "Essential.nut" file, you will find everything you need to install the system.

3. Add the following code in the onScriptLoad to load the functions from the "LanguageSystem.nut" file:
-  ```squirrel
   function onScriptLoad() {
       dofile("scripts/LanguageSystem.nut");
   }

4. Also, add the following line in the onScriptLoad to create an array "Language" with the maximum number of players, so it's possible to switch between languages:
-  ```squirrel
   function onScriptLoad() {
       dofile("scripts/LanguageSystem.nut");
       Language <- array(GetMaxPlayers(), 1);
   }

5. Add the "idioma" command in the onPlayerCommand function to allow players to change the language:
-  ```squirrel
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

6. To change the language, use the /idioma command followed by the language code: "pt" for Portuguese, "en" for English, and "es" for Spanish.
