/* -----------------------------------------------
	Multi Language System (Server-Side)
	Version: v1.0
	Author: Yuriiwo#3272
------------------------------------------------ */

function onScriptLoad() {
    dofile("scripts/LanguageSystem.nut");
    Language <- array(GetMaxPlayers(), 1);
}

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