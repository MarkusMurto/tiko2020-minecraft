#!/bin/bash
# SPDX-FileCopyrightText: 2020 Markus Murto <markus.murto@kusochi.eu>
#
# SPDX-License-Identifier: MIT
# 
# Varmuuskopioidaan Minecraft-palvelimen maailma.
# Varmuuskopio pakataan .tar.gz ja poistetaan yli vuorokauden vanhat varmuuskopiot
# Oletetaan palvelimen suoritettavan screenissä systemd-servicenä.
#
# Lisää vaikkapa croniin suoritettavaksi:
# 0,30 * * * * /polku/server_backup.bash
#
# Globaalit:
# SCR: screen-session nimi
# W: Minecraft-maailman nimi
# WORLD_DIR: Hakemistopolku maailmaan
# BACKUP_DIR: Hakemistopolku varmuuskopioiduille maailmoille
# LOGFILE: Polku käytettävään logitiedostoon

SCR=mc
W=world
WORLD_DIR=/home/mctiko/server/$W
BACKUP_DIR=/home/mctiko/worldbak
LOGFILE=/home/mctiko/log/$W-backup.log

#######################################
# Kopioidaan levylle tallennettu maailma BACKUP_DIR:iin ja pakataan tämä
# .tar.gz-pakettiin. Lopuksi poistetaan yli vuorokauden vanhat varmuuskopiot.
# Argumentit:
#   Ei argumentteja
#######################################
function backup-world() {
  local TIMESTAMP
  TIMESTAMP="$(date -Im)"
  local BACKUP_NAME
  BACKUP_NAME=$W-$TIMESTAMP
  mc-command "save-off"
  mc-command "save-all"
  sleep 5
  cp -r $WORLD_DIR "$BACKUP_DIR/$BACKUP_NAME"
  mc-command "save-on"
  /usr/bin/tar --remove-files -czf "$BACKUP_DIR/$BACKUP_NAME.tar.gz" "$BACKUP_DIR/$BACKUP_NAME"
  /usr/bin/find $BACKUP_DIR -name '*.tar.gz' -mtime +0 -delete
}

#######################################
# Syötetään komento Minecraft-palvelimen komentoriville.
# Argumentit:
#   Komentoriville syötettävä merkkijono.
#######################################
function mc-command() {
  local COMMAND=$1
  /usr/bin/screen -S $SCR -p 0 -X stuff "$COMMAND$(printf \\r)"
}

#######################################
# Kirjoitetaan aikaleimattu rivi määritettyyn logitiedostoon.
# Argumentit:
#   Logitiedostoon lisättävä merkkijono.
#######################################
function log() {
  local TIMESTAMP
  TIMESTAMP="$(date -Is)"
  echo "$TIMESTAMP  $1" >> $LOGFILE
}

SERVER_IS_RUNNING=$(/usr/bin/systemctl is-active minecraftserver.service)
if [[ $SERVER_IS_RUNNING == "active" ]]; then
  log "Varmuuskopioidaan world..."
  backup-world
  log "Varmuuskopiointi valmis!"
else
  log "Palvelin ei käynnissä, ohitetaan varmuuskopiointi"
fi

