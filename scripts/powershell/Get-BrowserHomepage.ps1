function Get-BrowserHomepage {
	# Get Browser Homepage

  	BEGIN {

	}
	
	PROCESS {
    		Get-ItemProperty -Path "HKCU:\Software\Microsoft\Internet Explorer\Main\" -Name "start page" | Select "Start Page"
	}
	
	END {
		Write-Host "[+] Process completed..."
	}
}
