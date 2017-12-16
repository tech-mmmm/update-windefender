#
# Windows Defender定義ファイル更新スクリプト
# update-windefender.ps1
#

# 定義ファイルのダウンロード先を指定
$url = "http://go.microsoft.com/fwlink/?LinkID=121721&arch=x64"

# 定義ファイルのダウンロードフォルダを指定
$workdir = "c:\work\"

# 実行コマンド
$cmd = $workdir + "mpam-fe.exe"

# 定義ファイルをダウンロード
Invoke-WebRequest -Uri $url -OutFile $cmd

# 適用チェック
if ( (Get-Item $cmd).VersionInfo.FileVersion -eq (Get-MpComputerStatus).AntivirusSignatureVersion ){
   echo "定義ファイルは最新です。"   
}else{
   echo "定義ファイルを更新します。"

   # 更新処理
   Start-Process $cmd -Wait
}


