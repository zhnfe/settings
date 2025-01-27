oh-my-posh init pwsh --config 'C:\Users\mismz\AppData\Local\Programs\oh-my-posh\themes\my.omp.json' | Invoke-Expression
# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# auto suggestions
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

# colorful dir
Import-Module -Name Terminal-Icons