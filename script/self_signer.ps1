$MyPs1 = $Args[0];

# ファイルのフルパスを取得
$ScriptFileFullPath = Get-Command $MyPs1 | select $_.FullName

# 自己証明書を用意
$Cert = New-SelfSignedCertificate `
  -Subject "CN=PowerShell Script by myself, OU=Self-signed RootCA" `
  -KeyAlgorithm RSA `
  -KeyLength 4096 `
  -Type CodeSigningCert `
  -CertStoreLocation Cert:\CurrentUser\My\ `
  -NotAfter ([datetime]"2099/01/01")

# 作成した自己証明書をルートに移動
Move-Item "Cert:\CurrentUser\My\$($Cert.Thumbprint)" Cert:\CurrentUser\Root

# ルート証明書として自己署名
$RootCert = @(Get-ChildItem cert:\CurrentUser\Root -CodeSigningCert)[0]
Set-AuthenticodeSignature $ScriptFileFullPath.Source $RootCert