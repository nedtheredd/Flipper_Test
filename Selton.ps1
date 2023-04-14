Get-ExecutionPolicy 

function Set-Wallpaper($MyWallpaper){
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@

add-type $code 
[Win32.Wallpaper]::SetWallpaper($MyWallpaper)
}

function Set-PlaySound(){
$MediaPlayer = [Windows.Media.Playback.MediaPlayer, Windows.Media, ContentType = WindowsRuntime]::New()
$MediaPlayer.Source = [Windows.Media.Core.MediaSource]::CreateFromUri('https://ringkk.com/wp-content/uploads/2021/12/bad_to_the_bone.mp3')
$MediaPlayer.Play()
}

function Get-DownloadAssets($WallPaperURL, $SoundURL){
Invoke-WebRequest $WallPaperURL -OutFile C:\selton.jpg
}

function Get-Boned(){
$delay = 10
[reflection.assembly]::loadwithpartialname('System.Windows.Forms')
[reflection.assembly]::loadwithpartialname('System.Drawing')
$notify = new-object system.windows.forms.notifyicon
$notify.icon = [System.Drawing.SystemIcons]::Information
$notify.visible = $true

for($delay; $delay -ge 0; $delay--){
if($delay -eq 10 ){$notify.showballoontip(0.5,'WARNING','YOU WILL BE BONED IN 10 SECONDS' ,[system.windows.forms.tooltipicon]::None); Start-Sleep 5}
elseif($delay -eq 5){$notify.showballoontip(0.5,'WARNING','YOU WILL BE BONED IN 5 SECONDS' ,[system.windows.forms.tooltipicon]::None); Start-Sleep 4}
elseif($delay -eq 1){$notify.showballoontip(0.5,'WARNING','YOU WILL BE BONED NOW 💀💀💀' ,[system.windows.forms.tooltipicon]::None); Start-Sleep 1}
elseif($delay -eq 0){echo "haha"}
}
}
 
Get-DownloadAssets("https://img-new.cgtrader.com/items/2765992/2e8263108d/troll-face-skull-3d-printable-3d-model-obj-fbx-ma-stl-dae-ztl.jpg")
Set-Wallpaper("C:\selton.jpg") 
Set-PlaySound($theNoise)
Get-Boned($bones)
