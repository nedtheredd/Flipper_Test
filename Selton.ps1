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
$Counter_Form = New-Object System.Windows.Forms.Form
$Counter_Form.Text = " 💀Time till Bone'o Clock💀"
$Counter_Form.Width = 450
$Counter_Form.Height = 200
$Counter_Label = New-Object System.Windows.Forms.Label
$Counter_Label.AutoSize = $true 
$Counter_Form.Controls.Add($Counter_Label)
while ($delay -ge 0)
{
$Counter_Form.Show()
$Counter_Label.Text = "Time left Until You get Boned: $($delay)"
start-sleep 1
$delay -= 1
}
wininit 
}
 
Get-DownloadAssets("https://img-new.cgtrader.com/items/2765992/2e8263108d/troll-face-skull-3d-printable-3d-model-obj-fbx-ma-stl-dae-ztl.jpg")
Set-Wallpaper("C:\selton.jpg") 
Set-PlaySound($theNoise)
Get-Boned($skelet)
