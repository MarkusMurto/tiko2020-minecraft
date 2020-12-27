<!--
SPDX-FileCopyrightText: 2020 Markus Murto <markus.murto@kusochi.eu>

SPDX-License-Identifier: CC0-1.0
-->

# tiko2020-minecraft

[![REUSE status](https://api.reuse.software/badge/github.com/MarkusMurto/tiko2020-minecraft)](https://api.reuse.software/info/github.com/MarkusMurto/tiko2020-minecraft)

Tämä git repo sisältää sekalaisia skriptejä ja konffitiedostoja, joita käytetään tikojen Minecraft-palvelimella. 

## Sisältö

`minecraft_server.service` - systemd-service, jolla käynnistetään ja suljetaan Minecraft-palvelin.

`server_backup.bash` - bash-skripti, jolla luodaan varmuuskopio Minecraft-palvelimen maailmasta. Sopiva cronjobiksi.

## Lisenssit
Tiedostoissa käytetään eri lisenssejä, mutta yhteenvetona:

- Koodiksi luokiteltavat: MIT
- Konfiguraatiotiedostot sekä tämä README: CC0

Koska noudatetaan REUSE:a, tarkempi informaatio tekijänoikeuksista ja lisensseistä löytyy aina tiedoston yläosasta.

