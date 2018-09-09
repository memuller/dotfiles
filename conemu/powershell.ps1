if (! $ENV:DOTFILES_ROOT ) {
  $ENV:DOTFILES_ROOT = resolve-path( "X:\Repos\env\dotfiles" )
}

$UserProfilePath = Join-Path $env:DOTFILES_ROOT "conemu\user-profile.ps1"
if ( Test-Path $UserProfilePath ) {
  . "$UserProfilePath"
}