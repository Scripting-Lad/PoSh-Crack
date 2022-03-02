$TargetHash = get-content -path "<path\to\target\hash.txt>"
$RT = "<path\to\rainbow\tables>"
$Cracked = "<path\to\cracked\pwds>"
$NotFound = "<path\to\pwds\not\found>"


foreach($Hash in $TargetHash){
    foreach($Table in Get-ChildItem $RT){
        $First2 =  Get-Content $Table -First 1 
        $Last2 =  Get-Content $Table -Tail 1        
        if($Hash -ge $First2 -and $Hash -le $Last2){
            if(findstr $Hash $Table){
                Select-Object SamAccountName | Out-File -Append -FilePath $Cracked\cracked.txt
            }
            else{
                Select-Object SamAccountName | Out-File -Append -FilePath $NotFound\notcracked.txt
            }
        }
    }
}