function onScriptLoad() {
    dofile("scripts/LanguageSystem.nut");
    Language <- array(GetMaxPlayers(), 1);
}

function onPlayerCommand( player, cmd, text ) {
    //Esse e o comando para trocar de idioma.
    if ( cmd == "idioma" || cmd == "language" || cmd == "linguagem" ) {
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