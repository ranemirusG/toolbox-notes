$excel = New-Object -ComObject Excel.Application
$workbook = $excel.Workbooks.Add()
$workbook.SaveAs("new_file.xlsx")
$excel.Quit()