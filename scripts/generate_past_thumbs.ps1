$ffmpeg = 'C:\Users\eminm\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-8.1-full_build\bin\ffmpeg.exe'
$sourceDir = 'C:\Users\eminm\Desktop\BOBBY\Source\Past'
$thumbDir = Join-Path $sourceDir 'thumbs'

New-Item -ItemType Directory -Force -Path $thumbDir | Out-Null

Get-ChildItem -Path $sourceDir -Filter '*.mp4' | ForEach-Object {
  $output = Join-Path $thumbDir ($_.BaseName + '.jpg')
  $arguments = @(
    '-y'
    '-ss'
    '00:00:00.5'
    '-update'
    '1'
    '-i'
    $_.FullName
    '-frames:v'
    '1'
    '-q:v'
    '2'
    $output
  )
  Start-Process -FilePath $ffmpeg -ArgumentList $arguments -NoNewWindow -Wait
}
