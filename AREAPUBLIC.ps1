<#função em powershell para rodar privilégios adm#>

param([switch]$Elevated)

function Test-Admin {
  $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) 
    {
        # tried to elevate, did not work, aborting
    } 
    else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}

exit
}

'running with full privileges'

$caminhoareapublica = "C:\Instalacao-CRM-BANCO-SANTANDER\ARCHIVESRC\4"

$caminhoagent = "C:\Instalacao-CRM-BANCO-SANTANDER\ARCHIVESRC\5"
    <#variaveis utilizadas#>
   robocopy $caminho $destino /mir

     robocopy $caminhoareapublica C:\Users\Public\Desktop
          <# Criação de pasta no c raiz #>
       New-Item -Path 'C:\Agent' -ItemType Directory
          <# Criação de pasta no c raiz #>
       New-Item -Path 'C:\ajustarhora' -ItemType Directory
          <# Criação de pasta no c raiz #>
       New-Item -Path 'C:\ajustarhora\ajustarhora.ps1' -ItemType File
          <# Criação de pasta no c raiz #>
       New-Item -Path 'C:\AgentPortalClient' -ItemType Directory

     robocopy $caminhoagent C:\AgentPortalClient /mir


 <#esta parte no código muda o arquivo criado na pasta ajustar hora#>

'running with full privileges'

$file = "C:\ajustarhora\ajustarhora.ps1"
$hostfile = Get-Content $file
$hostfile +='

Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sCountry -Value "Brazil";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sLongDate -Value "dddd, d. MMMM yyyy";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortDate -Value "dd.MM.yyyy";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortTime -Value "HH:mm";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sTimeFormat -Value "HH:mm:ss";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sYearMonth -Value "MMMM yyyy";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iFirstDayOfWeek -Value 6;
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sLanguage -Value "PTB";
Set-Culture pt-BR
Set-WinSystemLocale pt-BR
Set-WinHomeLocation -GeoId 32
exit
'
Set-Content -Path $file -Value $hostfile -Force





<#essa sessão adiciona os ips do crm no arquivo host do system#>


$file = “C:\Windows\System32\drivers\etc\hosts”
$hostfile = Get-Content $file
$hostfile += “
10.80.100.30 portalcrm-me
10.80.100.30 CMELDR01
10.80.100.31 cmeldr02
10.80.100.32 CMELDR03
”
Set-Content -Path $file -Value $hostfile -Force









