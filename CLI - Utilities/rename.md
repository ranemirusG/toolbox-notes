# Rename






## bash/zsh
```
# all files in dir from this: Sangre 2021-01-18.pdf
# to this: Analisis de sangre 2021-01-18.pdf
for file in Sangre*.pdf; do mv "$file" "Analisis de sangre${file#Sangre}"; done

```





## cmd
```
REM Rename files
ren old new
rename old new

```




## PowerShell
```
# all files in dir from this: Sangre 2021-01-18.pdf
# to this: Analisis de sangre 2021-01-18.pdf
Get-ChildItem "Sangre*.pdf" | ForEach-Object { Rename-Item $_ $_.Name -replace "Sangre", "Analisis de sangre" }
Get-ChildItem "Sangre*.pdf" | Rename-Item -NewName { $_.Name -replace "^Sangre", "Analisis de sangre" }
Get-ChildItem -Filter "Sangre*.pdf" | Rename-Item -NewName { "Analisis de sangre" + $_.Name.Substring(6) }

```


