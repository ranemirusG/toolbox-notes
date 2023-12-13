<# Get-Calendar

# TODO
tiene que existir la copia de `cal`


#>



function Get-Calendar {
    param(
        [int]$Year,
        [int]$Month
    )

    $cal = New-Object System.Globalization.GregorianCalendar

    $date = Get-Date -Day 1 -Month $Month -Year $Year
    $daysInMonth = $cal.GetDaysInMonth($Year, $Month)
    $startDay = $date.DayOfWeek.value__

    Write-Host "  Sun Mon Tue Wed Thu Fri Sat"

    $day = 1
    for ($i = 0; $i -lt 6; $i++) {
        $line = ""
        for ($j = 0; $j -lt 7; $j++) {
            if (($i -eq 0 -and $j -lt $startDay) -or ($day -gt $daysInMonth)) {
                $line += "    "
            }
            else {
                $line += "$("{0,3}" -f $day) "
                $day++
            }
        }
        Write-Host $line
    }
}

# Example: Display calendar for November 2023
# Get-Calendar -Year 2023 -Month 11
