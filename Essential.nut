function onScriptLoad() {
    dofile("scripts/LanguageSystem.nut");
    Language <- array(GetMaxPlayers(), 1);
}

function onPlayerCommand( player, cmd, text ) {
    else if ( cmd == "test" ) {
        if (!text) MessagePlayer(cmd + " <1/2/3>", player); {
            //Esse exemplo pode ser usado para mensagems que são enviadas apenas para o player que usou.
            if (text == "1") {
                MessagePlayer(getMsgByLanguage("Ola jogador!", "Hello player!", "Hola jugador.", player), player);
            }

            //Esse exemplo pode ser usado para mandar mensagens para todos os players
            else if (text == "2") {
                getMsgByLanguageAllPlayers("Ola jogadores", "Hello players", "Hola jugadores");
            }

            //Esse exemplo pode ser usado para mandar mensagens para todos os players, menos o player que usou o comando.
            else if (text == "3") {
                getMsgByLanguageAllExcept(player.Name + " mandou um oi para o servidor.", player.Name + " says hi to the server", player.Name + " saluda al servidor.", player);
            }
            else {
                MessagePlayer(cmd + " <1/2/3>", player);
            }
        }
    }

    //Esse e o comando para trocar de idioma.
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