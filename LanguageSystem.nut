/* -----------------------------------------------
	Multi Language System (Server-Side)
	Version: v1.0
	Author: Yuriiwo#3272
------------------------------------------------ */

function getMsgByLanguage(ptMsg, enMsg, esMsg, player) {
    if (status[player.ID].Language == 0) {
        return ptMsg;
    }
	else if (status[player.ID].Language == 1) {
        return enMsg;
    }
	else if (status[player.ID].Language == 2) {
        return esMsg;
    }
}
function getMsgByLanguageAllPlayers(ptMsg, enMsg, esMsg) {
	for(local i = 0, plr; i < GetMaxPlayers(); i++) {
		plr = FindPlayer(i);
		if ( plr ) {
			if (status[plr.ID].Language == 0) MessagePlayer(ptMsg, plr);
			else if (status[plr.ID].Language == 1) MessagePlayer(enMsg, plr);
			else if (status[plr.ID].Language == 2) MessagePlayer(esMsg, plr);
		}
	}
}
function getMsgByLanguageAllExcept(ptMsg, enMsg, esMsg, player) {
    for(local i = 0, plr; i < GetMaxPlayers(); i++) {
        plr = FindPlayer(i);
        if (plr && plr.ID != player.ID) {
            if (status[plr.ID].Language == 0) MessagePlayer("" + ptMsg, plr);
            else if (status[plr.ID].Language == 1) MessagePlayer("" + enMsg, plr);
            else if (status[plr.ID].Language == 2) MessagePlayer("" + esMsg, plr);
        }
    }
}