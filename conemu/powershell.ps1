if (! $ENV:DOTFILES_ROOT ) {
  $ENV:DOTFILES_ROOT = resolve-path( "C:\Users\memuller\Repos\env\dotfiles" )
}

$UserProfilePath = Join-Path $env:DOTFILES_ROOT "conemu\user-profile.ps1"
if ( Test-Path $UserProfilePath ) {
  . "$UserProfilePath"
}