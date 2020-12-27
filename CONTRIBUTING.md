<!--
SPDX-FileCopyrightText: 2020 Markus Murto <markus.murto@kusochi.eu>

SPDX-License-Identifier: CC0-1.0
-->

# Kehitykseen osallistuminen

Jotta pidetään koodi ja repo siistinä, seurataan tätä dokumenttia. Tarkkaa opasta ei voi kirjoittaa, mutta tätä seuraamalla ja maalaisjärkeä noudattamalla saadaan hyvää tulosta.

## Prosessi

1. Nosta muutoksesta ensimmäiseksi keskustelu, esimerkiksi Github issuen avulla.
2. Shelliskriptien osalta seuraa tyyliopasta ja hyödynnä linteriä.
3. Tee mahdolliset muutokset tiedoston tekijänoikeustietoihin.
4. Lisää mahdollinen dokumentaatio README:een.
5. Markus M. hyväksyy merge reguestin

## Shelliskriptit

Shelliskripteissä pyritään noudattamaan [Googlen tyyliopasta](https://google.github.io/styleguide/shellguide.html). Tarkista koodisi [lintterillä](https://www.shellcheck.net/).

## Tekijänoikeus- ja lisenssimerkinnät

### SPDX-merkinnät

Merkitse itsesi tekijänoikeuden haltijaksi myös olemassaoleviin tiedostoihin, mikäli muutoksesi näihin on merkittävä. Pienet muutamien merkkien muutokset eivät liene sellaisia muutoksia, jotka tätä vaatii. 

Sen lisäksi, että tämä repo käyttää vapaita lisenssejä, tämä repo pyrkii noudattamaan [REUSE:a](https://reuse.software/). Tämän vuoksi tiedostojen alussa tekijänoikeus- ja linsenssit merkataan [SPDX:n standardin](https://spdx.dev/) mukaisesti. Tämä tarkoittaa tämänkaltaisia kommentoituja rivejä koodissa:

```
SPDX-FileCopyrightText: 2020 Matti Meikäläinen <email>

SPDX-License-Identifier: MIT
```

`FileCopyrightText` on melko vapaamuotoinen, mutta merkkaa edellisen perään pilkulla erotettuna, mikäli olet muokkaamassa jo olemassa olevaa tiedostoa:

```
SPDX-FileCopyrightText: 2020 Matti Meikäläinen <email>, 2021 Maija Meikäläinen <email>
```

### Noudata REUSE:a

Hyvä idea olisi asentaa `reuse`-työkalu omalle työasemallesi:

```
pip3 install --user reuse
```

Tämän jälkeen voit tarkistaa, noudattaako forkkisi REUSE:a.

```
reuse lint
```

Tarkemmat ohjeet `reuse`-työkalun käyttöön löytyy [täältä](https://reuse.software/tutorial/).

## Lisenssit

Mikäli muokkaat olemassaolevaa tiedostoa, muutoksesi lisensoidaan samalla lisenssillä, millä tiedosto on jo lisensoitu. Uusien tiedostojen kohdalla alkuperäisenä tekijänä sinulla on vapaus valita omavalintainen lisenssi, mutta toivon sinun valitsevan vapaan lisenssin - esimerkiksi:

- [MIT](https://choosealicense.com/licenses/mit/), mikäli haluat simppelin ja hyvin sallivan lisenssin.
- [GNU GPLv3](https://choosealicense.com/licenses/gpl-3.0/), mikäli toivot, että koodisi pysyy samassa vapaassa lisenssissä.

Dokumentaatiolle ja konfiguraatiotiedostoille suositaan [CC0-1.0 Public Domain -lisenssiä](https://choosealicense.com/licenses/cc0-1.0/). Kysymys siitä, onko dokumentaatio ja konfiguraatiotiedostot tekijänoikeuden alaisia teoksia, on epävarma, joten siitä syystä ja siitä huolimatta on hyvä merkitä näille lisenssi. Tämäkin noudattaaksemme REUSE:a.

