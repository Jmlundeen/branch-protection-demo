echo "Finding all .txt files..."
Get-ChildItem -Path . -Recurse -Include *.txt | ForEach-Object {
    echo "Processing $_"
    $File = Get-Content $_.FullName -Raw
    $Lines = $File -split "`r`n|`n"
    $First_Line = $Lines[0]
    # Check if first line contains "cat", case-insensitive, exit if it is not
    if ($First_Line -notmatch "cat") {
        echo "First line does not contain 'cat'. Exiting..."
        exit 1
    }
}