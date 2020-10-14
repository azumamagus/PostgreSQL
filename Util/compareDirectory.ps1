$dir1 = Get-ChildItem -Recurse -path C:\dir1
$dir2 = Get-ChildItem -Recurse -path C:\dir2
Compare-Object -ReferenceObject $dir1 -DifferenceObject $dir2
