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
    //Esse e o comando para trocar de idioma.
    if ( cmd == "idioma" || cmd == "language" || cmd == "linguagem" ) {
        if (!text) {
            MessagePlayer( cmd + " <pt/en/es>", player);
        }
        else if (text == "pt") {
            if (Language[ player.ID ] == 0 ) {
            MessagePlayer("O idioma ja esta definido como Portugues.", player);
        }
        else {
                Language[ player.ID ] = 0;
                MessagePlayer("Idioma definido como Portugues.", player);
            }
        }
        else if (text == "en") {
            if (Language[ player.ID ] == 1 ) {
            MessagePlayer("The language is already set to English.", player);
        }
        else {
                Language[ player.ID ] = 1;
                MessagePlayer("Language set to English.", player);
            }
        }
        else if (text == "es") {
            if (Language[ player.ID ] == 2 ) {
            MessagePlayer("El idioma ya esta configurado en espanol.", player);
        }
        else {
                Language[ player.ID ] = 2;
                MessagePlayer("Idioma configurado en espanol.", player);
            }
        }
        else MessagePlayer(getMsgByLanguage("Esse idioma nao esta na lista.", "This language is not on the list.", "Este idioma no esta en la lista.", player), player);
    }
}
