# Multi-Language System

Welcome to the Multi-Language System! This is a project that allows you to add 3 languages, but you can implement more languages by adding base functions. In this example, the available languages are Portuguese, English, and Spanish. This system was developed with the assistance of (LBR)Diego^.

## Installation

Follow the steps below to set up the Multi-Language System on your server:

1. Download the files from the repository.

2. After downloading the repository, you will find two files. Copy the "LanguageSystem.nut" file to the scripts folder of your server. In the "Essential.nut" file, you will find everything you need to install the system.

3. Add the following code in the `onScriptLoad` to load the functions from the "LanguageSystem.nut" file:
-  ```squirrel
   function onScriptLoad() {
       dofile("scripts/LanguageSystem.nut");
   }

4. Also, add the following line in the `onScriptLoad` to create an array "Language" with the maximum number of players, so it's possible to switch between languages:
-  ```squirrel
   function onScriptLoad() {
       dofile("scripts/LanguageSystem.nut");
       Language <- array(GetMaxPlayers(), 1);
   }

5. Add the "idioma" command in the `onPlayerCommand` function to allow players to change the language:
-  ```squirrel
      function onPlayerCommand( player, cmd, text ) {
       if ( cmd == "idioma" || cmd == "language" || cmd == "linguagem" ) {
           if (!text) {
               MessagePlayer( cmd + " <pt/en/es>", player);
           }
           else if (text == "pt") {
               if (Language[ player.ID ] == 0 ) {
               MessagePlayer("> [#fc3932]O idioma ja esta definido como Portugues.", player);
           }
           else {
                   Language[ player.ID ] = 0;
                   MessagePlayer("> [#08c5ff]Idioma definido como Portugues.", player);
               }
           }
           else if (text == "en") {
               if (Language[ player.ID ] == 1 ) {
               MessagePlayer("> [#fc3932]The language is already set to English.", player);
           }
           else {
                   Language[ player.ID ] = 1;
                   MessagePlayer("> [#08c5ff]Language set to English.", player);
               }
           }
           else if (text == "es") {
               if (Language[ player.ID ] == 2 ) {
               MessagePlayer("> [#fc3932]El idioma ya esta configurado en espanol.", player);
           }
           else {
                   Language[ player.ID ] = 2;
                   MessagePlayer("> [#08c5ff]Idioma configurado en espanol.", player);
               }
           }
           else MessagePlayer(getMsgByLanguage("> [#fc3932]Esse idioma nao esta na lista.", "> [#08c5ff]This language is not on the list.", "> [#08c5ff]Este idioma no esta en la lista.", player), player);
       }
   }

6. To change the language, use the `/idioma` command followed by the language code: `"pt"` for Portuguese, `"en"` for English, and `"es"` for Spanish.

## About the system

This is a multi-language system designed to handle different messages for players in their preferred language. The system uses an array called Language to keep track of the `language` chosen by each player.

1. `getMsgByLanguage(ptMsg, enMsg, esMsg, player)`
This function takes four parameters: `ptMsg`, `enMsg`, `esMsg`, and player. It determines the message to be returned based on the player's chosen language. It first checks the Language array for the player's language preference and returns the corresponding message in that language. If the player's language is not 0 (Portuguese), 1 (English), or 2 (Spanish), it will return the ptMsg as a default fallback.

2. `getMsgByLanguageAllPlayers(ptMsg, enMsg, esMsg)`
This function takes three parameters: `ptMsg`, `enMsg` and `esMsg`. It iterates through all the players on the server and sends the appropriate message to each player based on their chosen language. It uses the MessagePlayer function to send the messages.

3. `getMsgByLanguageAllExcept(ptMsg, enMsg, esMsg, player)`
This function is similar to the previous one, but it excludes sending the message to a specific player passed as the player parameter. It iterates through all players on the server except the specified player and sends the appropriate messages to each player based on their chosen language.


Overall, this system allows you to manage and deliver messages in different languages based on each player's preferences. By calling the appropriate functions, you can send messages to individual players, all players, or all players except a specific one, in their chosen language.
