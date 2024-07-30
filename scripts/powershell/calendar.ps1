function Get-Calendar {
    param (
        [int]$Year = (Get-Date).Year,
        [int]$Month = (Get-Date).Month
    )

    $firstDay = [datetime]::new($Year, $Month, 1)
    $lastDay = $firstDay.AddMonths(1).AddDays(-1)
    $daysOfWeek = "Sun Mon Tue Wed Thu Fri Sat"
    $calendar = @()

    $calendar += $daysOfWeek
    $calendar += " " * 4 * $firstDay.DayOfWeek

    for ($day = 1; $day -le $lastDay.Day; $day++) {
        $calendar += "{0,3} " -f $day
        if (($firstDay.AddDays($day - 1).DayOfWeek -eq 'Saturday') -and ($day -ne $lastDay.Day)) {
            $calendar += "`n"
        }
    }

    $calendar -join ""
}

# Call the function with the desired month and year
# Get-Calendar -Year 2023 -Month 7

