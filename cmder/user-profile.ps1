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

function e. { explorer . }
function env { ls variable:* }
New-Alias g git

# Docker Composer path fix for Windows, see
# https://github.com/docker/compose/issues/4240
$Env:COMPOSE_CONVERT_WINDOWS_PATHS = 1