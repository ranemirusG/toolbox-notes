# Datetime
Useful date & time resources and notes.


## Online Tools

- <https://www.epochconverter.com/>


## Time
- <https://en.wikipedia.org/wiki/ISO_8601>
- <https://www.rfc-editor.org/rfc/rfc3339>
- <https://www.rfc-editor.org/rfc/rfc868>
- <https://cldr.unicode.org/>
- "An Essay on Time" (Norbert Elias)



###  Windows

tzutil.exe

```cmd
tzutil.exe | find "Buenos Aires"
tzutil /l | findstr /I "Buenos Argentina" & more +1

# Get current timezone
tzutil /g

```

```powershell
Get-TimeZone -ListAvailable | Where-Object { $_.Id -match "Argentina" }

tzutil /l | Select-String "Buenos|Argentina"


# Set timezone
Set-TimeZone "Eastern Standard Time"
tzutil /s "Eastern Standard Time"

```



Windows FILETIME / Win32 epoch
Windows tracks time in 100ns units since January 1, 1601.
Why was that date chosen? The Gregorian calendar operates on a 400-year cycle, and 1601 is the first year of the cycle that was active at the time Windows NT was being designed. In other words, it was chosen to make the math come out nicely.

- <https://devblogs.microsoft.com/oldnewthing/20220602-00/?p=106706>
- <https://learn.microsoft.com/en-us/windows/win32/sysinfo/converting-a-time-t-value-to-a-file-time>



```cpp
// from Unix time to FILETIME
auto datetime = winrt::clock::from_time_t(unix_time_seconds);
FILETIME filetime = winrt::clock::to_file_time(datetime);

// or combined into one line
FILETIME filetime = winrt::clock::to_file_time(winrt::clock::from_time_t(unix_time_seconds));



// And you can just run everything in reverse to go the other way.

// from FILETIME to Unix time
auto datetime = winrt::clock::from_file_time(filetime);
time_t unix_time_seconds = winrt::clock::to_time_t(datetime);

// or combined into one line
time_t unix_time_seconds = winrt::clock::to_time_t(
                     winrt::clock::from_file_time(filetime));

```



```powershell

# Convert from Unix Time to Normal, human readable
$unixTime = 1716302955

(([System.DateTimeOffset]::FromUnixTimeSeconds($unixTime)).DateTime).ToString("s") # Output: 2024-05-21T14:49:15


# Convert Unix timestamp to DateTime in GMT -3 timezone
$convertedTime = ([System.DateTimeOffset]::FromUnixTimeSeconds($unixTime)).ToOffset([TimeSpan]::FromHours(-3))

# Format the converted time as a string
$formattedTime = $convertedTime.ToString("yyyy-MM-ddTHH:mm:ss")

# Output the formatted time
$formattedTime


# <https://devblogs.microsoft.com/scripting/create-custom-date-formats-with-powershell/>

Get-TimeZone

Get-Date ([datetime]::UtcNow) -UFormat "%H:%M"
```



#### Interesting script using Notepad++ File Modification Timestamp
```python
import datetime

# Notepad++ session data example
originalFileLastModifTimestamp = -1354503710
originalFileLastModifTimestampHigh = 31047188

full_timestamp = (originalFileLastModifTimestampHigh << 32) | (originalFileLastModifTimestamp & 0xFFFFFFFF)
timestamp_seconds = full_timestamp / 10**7
timestamp = datetime.datetime(1601,1,1) + datetime.timedelta(seconds=timestamp_seconds)

print(timestamp)
```











### UNIX Time
Seconds which have passed since 00:00:00 UTC on Thursday, 1 January 1970 (epoch).
<https://en.wikipedia.org/wiki/Year_2038_problem>





- `ntpd`






```bash

# Current Date in Unix Time
date +%s


# Convert from Unix to Normal, human readable
date -d @1709514290129


# convert from unix time to normal (see https://www.reydes.com/d/?q=Convertir_muchas_Marcas_de_Tiempo_UNIX_Unix_Epoch)
cat access.log | awk '{$1=strftime("%F %T", $1, 1); print $0}'
grep (Direccion IP) access.log | awk '{$1=strftime("%F %T", $1, 1); print $0}'





```




```python
import datetime

unix_time = 1707760274  # Replace this with your Unix time

# Convert Unix time to a datetime object
normal_date = datetime.datetime.utcfromtimestamp(unix_time)

print("Normal Date:", normal_date)
```


### UTC
Coordinated Universal Time is the primary time standard by which the world regulates clocks and time.



### CEST
Central European Summer Time is the variation of standard clock time that is applied in most European countries



### GMT
Greenwich Mean Time


### TAI
International Atomic Time

























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

### Week days abbreviations

| Language | Monday       | Tuesday      | Wednesday      | Thursday       | Friday        | Saturday      | Sunday        |
|----------|--------------|--------------|----------------|----------------|---------------|---------------|---------------|
| Català   | Dl (dilluns) | Dt (dimarts) | Dc (dimecres)  | Dj (dijous)    | Dv (divendres)| Ds (dissabte) | Dg (diumenge) |
| Deutsche | Mo (Montag)  | Di (Dienstag)| Mi (Mittwoch)  | Do (Donnerstag)| Fr (Freitag)  | Sa (Samstag)  | So (Sonntag)  |
| English  | Mon (Monday) | Tue (Tuesday)| Wed (Wednesday)| Thu (Thursday) | Fri (Friday)  | Sat (Saturday)| Sun (Sunday)  |
| Español  | Lun (lunes)  | Mar (martes) | Mié (miércoles)| Jue (jueves)   | Vie (viernes) | Sáb (sábado)  | Dom (domingo) |
| Français | Lun (lundi)  | Mar (mardi)  | Mer (mercredi) | Jeu (jeudi)    | Ven (vendredi)| Sam (samedi)  | Dim (dimanche)|
| Italiano | Lun (Lunedì) | Mar (Martedì)| Mer (Mercoledì)| Gio (Giovedì)  | Ven (Venerdì) | Sab (Sabato)  | Dom (Domenica)|
| Português| Seg (segunda)| Ter (terça)  | Qua (quarta)   | Qui (quinta)   | Sex (sexta)   | Sáb (sábado)  | Dom (domingo) |






## Month


| Language | January       | February       | March      | April       | May         | June        | July          | August      | September       | October      | November       | December       |
|----------|---------------|----------------|------------|-------------|-------------|-------------|---------------|-------------|-----------------|--------------|----------------|----------------|
| Català   | Gen (gener)   | Feb (febrer)   | Mar (març) | Abr (abril) | Maig (maig) | Juny (juny) | Jul (juliol)  | Ago (agost) | Set (setembre)  | Oct (octubre)| Nov (novembre) | Des (desembre) |
| Deutsche | Jan (Januar)  | Feb (Februar)  | März (März)| Apr (April) | Mai (Mai)   | Jun (Juni)  | Jul (Juli)    | Aug (August)| Sep (September) | Okt (Oktober)| Nov (November) | Dez (Dezember) |
| English  | Jan (January) | Feb (February) | Mar (March)| Apr (April) | May (May)   | Jun (June)  | Jul (July)    | Aug (August)| Sep (September) | Oct (October)| Nov (November) | Dec (December) |
| Español  | Ene (enero)   | Feb (febrero)  | Mar (marzo)| Abr (abril) | May (mayo)  | Jun (junio) | Jul (julio)   | Ago (agosto)| Sep (septiembre)| Oct (octubre)| Nov (noviembre)| Dic (diciembre)|
| Français | Janv (janvier)| Fév (février)  | Mar (mars) | Avr (avril) | Mai (mai)   | Juin (juin) | Juil (juillet)| Aoû (août)  | Sep (septembre) | Oct (octobre)| Nov (novembre) | Déc (décembre) |
| Italiano | Gen (gennaio) | Feb (febbraio) | Mar (marzo)| Apr (aprile)| Mag (maggio)| Giu (giugno)| Lug (luglio)  | Ago (agosto)| Set (settembre) | Ott (ottobre)| Nov (novembre) | Dic (dicembre) |
| Português| Jan (janeiro) | Fev (fevereiro)| Mar (março)| Abr (abril) | Mai (maio)  | Jun (junho) | Jul (julho)   | Ago (agosto)| Set (setembro)  | Out (outubro)| Nov (novembro) | Dez (dezembro) |