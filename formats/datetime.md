# Datetime
Useful date & time resources and notes


## Time
- <https://en.wikipedia.org/wiki/ISO_8601>
- <https://www.rfc-editor.org/rfc/rfc3339>
- <https://www.rfc-editor.org/rfc/rfc868>
- <https://cldr.unicode.org/>
- "An Essay on Time" (Norbert Elias)


### UTC
Coordinated Universal Time is the primary time standard by which the world regulates clocks and time.



### CEST
Central European Summer Time is the variation of standard clock time that is applied in most European countries



### GMT
Greenwich Mean Time


### TAI
International Atomic Time



### UNIX Time
Seconds which have passed since 00:00:00 UTC on Thursday, 1 January 1970 (epoch).
<https://en.wikipedia.org/wiki/Year_2038_problem>





















## Date
ISO 8601 format `YYYY-MM-DD`. Examples: 
```
2023-12-21
7 January 2000 can be written as "2000-01-07" or "20000107"

```





### Examples

| Language  | Example 1                 | Example 2                   |
|-----------|---------------------------|-----------------------------|
| Català    | 10 de gener de 2023       | 25 de juny de 2023          |
| Deutsche  | 15. Januar 2023           | 7. August 2023              |
| English   | January 3, 2023           | June 18, 2023               |
| Español   | 8 de febrero de 2023      | 17 de septiembre de 2023    |
| Français  | 12 janvier 2023           | 5 juillet 2023              |
| Italiano  | 20 gennaio 2023           | 14 settembre 2023           |
| Português | 3 de março de 2023        | 22 de novembro de 2023      |






## CalDAV
https://en.wikipedia.org/wiki/CalDAV


























## Days

<https://www.timeanddate.com/calendar/days/first-day-of-the-week.html>

### Week days and abbreviation

| Language  | Monday         | Tuesday        | Wednesday      | Thursday       | Friday         | Saturday       | Sunday         |
|-----------|----------------|----------------|----------------|----------------|----------------|----------------|----------------|
| Català    | Dl (dilluns)   | Dt (dimarts)   | Dc (dimecres)  | Dj (dijous)     | Dv (divendres) | Ds (dissabte)  | Dg (diumenge)  |
| Deutsche  | Mo (Montag)     | Di (Dienstag)  | Mi (Mittwoch)  | Do (Donnerstag) | Fr (Freitag)   | Sa (Samstag)   | So (Sonntag)   |
| English   | Mon (Monday)    | Tue (Tuesday)  | Wed (Wednesday)| Thu (Thursday)  | Fri (Friday)    | Sat (Saturday) | Sun (Sunday)   |
| Español   | Lun (lunes)    | Mar (martes)   | Mié (miércoles)| Jue (jueves)   | Vie (viernes)  | Sáb (sábado)   | Dom (domingo)  |
| Français  | Lun (lundi)    | Mar (mardi)    | Mer (mercredi) | Jeu (jeudi)     | Ven (vendredi) | Sam (samedi)   | Dim (dimanche) |
| Italiano  | Lun (Lunedì)   | Mar (Martedì)  | Mer (Mercoledì)| Gio (Giovedì)   | Ven (Venerdì)  | Sab (Sabato)   | Dom (Domenica) |
| Português | Seg (segunda)  | Ter (terça)    | Qua (quarta)   | Qui (quinta)   | Sex (sexta)    | Sáb (sábado)   | Dom (domingo)  |









## Month


| Language  | January        | February       | March          | April          | May            | June           | July           | August         | September      | October        | November       | December       |
|-----------|----------------|----------------|----------------|----------------|----------------|----------------|----------------|----------------|----------------|----------------|----------------|
| Català    | Gen (gener)    | Feb (febrer)   | Mar (març)     | Abr (abril)    | Maig (maig)    | Juny (juny)    | Jul (juliol)   | Ago (agost)    | Set (setembre) | Oct (octubre)  | Nov (novembre) | Des (desembre) |
| Deutsche  | Jan (Januar)   | Feb (Februar)  | März (März)    | Apr (April)    | Mai (Mai)      | Jun (Juni)     | Jul (Juli)     | Aug (August)   | Sep (September)| Okt (Oktober)  | Nov (November) | Dez (Dezember) |
| English   | Jan (January)  | Feb (February) | Mar (March)    | Apr (April)    | May (May)      | Jun (June)     | Jul (July)     | Aug (August)   | Sep (September)| Oct (October)  | Nov (November) | Dec (December) |
| Español   | Ene (enero)    | Feb (febrero)  | Mar (marzo)    | Abr (abril)    | May (mayo)     | Jun (junio)    | Jul (julio)    | Ago (agosto)   | Sep (septiembre)| Oct (octubre)  | Nov (noviembre)| Dic (diciembre)|
| Français  | Janv (janvier) | Fév (février)  | Mar (mars)     | Avr (avril)    | Mai (mai)      | Juin (juin)    | Juil (juillet) | Aoû (août)     | Sep (septembre)| Oct (octobre)  | Nov (novembre) | Déc (décembre) |
| Italiano  | Gen (gennaio)  | Feb (febbraio) | Mar (marzo)    | Apr (aprile)   | Mag (maggio)   | Giu (giugno)  | Lug (luglio)   | Ago (agosto)   | Set (settembre)| Ott (ottobre)  | Nov (novembre) | Dic (dicembre) |
| Português | Jan (janeiro)  | Fev (fevereiro)| Mar (março)    | Abr (abril)    | Mai (maio)     | Jun (junho)    | Jul (julho)    | Ago (agosto)   | Set (setembro) | Out (outubro)  | Nov (novembro) | Dez (dezembro) |








## Powershell
<https://devblogs.microsoft.com/scripting/create-custom-date-formats-with-powershell/>






## Tools

### convert from unix time to normal

```bash
date -d @1709514290129

```



``` python
import datetime

unix_time = 1707760274  # Replace this with your Unix time

# Convert Unix time to a datetime object
normal_date = datetime.datetime.utcfromtimestamp(unix_time)

print("Normal Date:", normal_date)
```