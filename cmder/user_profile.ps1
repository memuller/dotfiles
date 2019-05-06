# Use this file to run your own startup commands

## Prompt Customization
<#
.SYNTAX
    <PrePrompt><CMDER DEFAULT>
    λ <PostPrompt> <repl input>
.EXAMPLE
    <PrePrompt>N:\Documents\src\cmder [master]
    λ <PostPrompt> |
#>

[ScriptBlock]$PrePrompt = {

}

# Replace the cmder prompt entirely with this.
# [ScriptBlock]$CmderPrompt = {}

[ScriptBlock]$PostPrompt = {

}

## <Continue to add your own>

if (! $ENV:REPOS_DIR ) {
    $ENV:REPOS_DIR = Resolve-Path "C:\Users\memuller\Repos"
}

if (! $ENV:DOTFILES_DIR ) {
    $ENV:DOTFILES_DIR = Join-Path $ENV:REPOS_DIR "env\dotfiles"
}

function e. { explorer . }
function env { ls variable:* }

Set-Alias g git
Set-Alias dc docker-compose

# Docker Composer path fix for Windows, see
# https://github.com/docker/compose/issues/4240
$Env:COMPOSE_CONVERT_WINDOWS_PATHS = 1