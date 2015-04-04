function Create-PkgUndefFile {
    param([string]$packagesFile)

    $fileName = ".\devenv.pkgundef"
    ";SlimVS by Igal Tabachnik" | Out-File $fileName
    Get-Content $packagesFile | % {
        [string]$line = $_
        
        if ($line.StartsWith(";Id:")) {
            if ($line -match "\{[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}\}") {
                $line | Out-File $fileName -Append
                "[`$RootKey$`\Packages\{0}]" -f $Matches[0] | Out-File $fileName -Append;
            }
            
        }
        else {
            $line | Out-File $fileName -Append
        }
    }


}

Create-PkgUndefFile .\packages.txt