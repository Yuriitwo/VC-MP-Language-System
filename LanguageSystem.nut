/* -----------------------------------------------
	Multi Language System (Server-Side)
	Version: v1.0
	Author: Yuriiwo#3272
------------------------------------------------ */

function getMsgByLanguage(ptMsg, enMsg, esMsg, player) {
    if (Language[ player.ID ] == 0) {
        return ptMsg;
    }
	else if (Language[ player.ID ] == 1) {
        return enMsg;
    }
	else if (Language[ player.ID ] == 2) {
        return esMsg;
    }
}
function getMsgByLanguageAllPlayers(ptMsg, enMsg, esMsg) {
	for(local i = 0, plr; i < GetMaxPlayers(); i++) {
		plr = FindPlayer(i);
		if ( plr ) {
			if (Language[ plr.ID ] == 0) MessagePlayer(ptMsg, plr);
			else if (Language[ plr.ID ] == 1) MessagePlayer(enMsg, plr);
			else if (Language[ plr.ID ] == 2) MessagePlayer(esMsg, plr);
		}
	}
}
function getMsgByLanguageAllExcept(ptMsg, enMsg, esMsg, player) {
    for(local i = 0, plr; i < GetMaxPlayers(); i++) {
        plr = FindPlayer(i);
        if (plr && plr.ID != player.ID) {
            if (Language[ plr.ID ] == 0) MessagePlayer("" + ptMsg, plr);
            else if (Language[ plr.ID ] == 1) MessagePlayer("" + enMsg, plr);
            else if (Language[ plr.ID ] == 2) MessagePlayer("" + esMsg, plr);
        }
    }
}
print("Multi Language System has been loaded, by Yuriitwo and Diego^.");
