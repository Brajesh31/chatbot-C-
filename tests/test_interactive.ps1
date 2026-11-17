param(
    [Parameter(Mandatory = $true)]
    [string]$AppPath
)

$ErrorActionPreference = "Stop"
$script:Executable = (Resolve-Path -LiteralPath $AppPath).Path

function Invoke-ChatbotInput {
    param([Parameter(Mandatory = $true)][AllowEmptyString()][string]$InputText)

    $startInfo = New-Object System.Diagnostics.ProcessStartInfo
    $startInfo.FileName = $script:Executable
    $startInfo.UseShellExecute = $false
    $startInfo.RedirectStandardInput = $true
    $startInfo.RedirectStandardOutput = $true
    $startInfo.RedirectStandardError = $true

    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $startInfo
    [void]$process.Start()

    $process.StandardInput.Write($InputText)
    $process.StandardInput.Close()

    $output = $process.StandardOutput.ReadToEnd()
    $errors = $process.StandardError.ReadToEnd()
    $process.WaitForExit()

    if ($process.ExitCode -ne 0) {
        throw "Chatbot exited with code $($process.ExitCode). stderr: $errors"
    }

    return $output
}

function Assert-Contains {
    param([string]$Text, [string]$Expected, [string]$Scenario)
    if (-not $Text.Contains($Expected)) {
        throw ("[$Scenario] Expected output not found: " + $Expected + [Environment]::NewLine + "Actual output:" + [Environment]::NewLine + $Text)
    }
}

function Assert-NotContains {
    param([string]$Text, [string]$Unexpected, [string]$Scenario)
    if ($Text.Contains($Unexpected)) {
        throw ("[$Scenario] Unexpected output found: " + $Unexpected + [Environment]::NewLine + "Actual output:" + [Environment]::NewLine + $Text)
    }
}

$warning = "Please keep your message to 255 bytes or fewer."
$line254 = "x" * 254
$line255 = "x" * 255
$line256 = "x" * 256
$newline = [Environment]::NewLine

$conversation = Invoke-ChatbotInput ("HELLO" + $newline + "how are you?" + $newline + "bye" + $newline)
Assert-Contains $conversation "Hello! How can I help you today?" "conversation"
Assert-Contains $conversation "I'm just a program, but thanks for asking!" "conversation"
Assert-Contains $conversation "Goodbye! Have a great day!" "conversation"

$substring = Invoke-ChatbotInput ("goodbye" + $newline + "bye" + $newline)
Assert-Contains $substring "I'm sorry, I don't understand that." "exact exit matching"
Assert-Contains $substring "Goodbye! Have a great day!" "exact exit matching"

$eof = Invoke-ChatbotInput ""
Assert-Contains $eof "Input closed. Goodbye!" "empty input"

$limitWithNewline = Invoke-ChatbotInput ($line255 + $newline + "bye" + $newline)
Assert-Contains $limitWithNewline "I'm sorry, I don't understand that." "255 bytes with newline"
Assert-NotContains $limitWithNewline $warning "255 bytes with newline"

$limitAtEof = Invoke-ChatbotInput $line255
Assert-Contains $limitAtEof "I'm sorry, I don't understand that." "255 bytes at EOF"
Assert-Contains $limitAtEof "Input closed. Goodbye!" "255 bytes at EOF"
Assert-NotContains $limitAtEof $warning "255 bytes at EOF"

$overLimit = Invoke-ChatbotInput ($line256 + $newline + "bye" + $newline)
Assert-Contains $overLimit $warning "256 bytes with newline"
Assert-Contains $overLimit "Goodbye! Have a great day!" "256 bytes with newline"

$overLimitAtEof = Invoke-ChatbotInput $line256
Assert-Contains $overLimitAtEof $warning "256 bytes at EOF"
Assert-Contains $overLimitAtEof "Input closed. Goodbye!" "256 bytes at EOF"

$shortAtEof = Invoke-ChatbotInput $line254
Assert-Contains $shortAtEof "I'm sorry, I don't understand that." "254 bytes at EOF"
Assert-Contains $shortAtEof "Input closed. Goodbye!" "254 bytes at EOF"
Assert-NotContains $shortAtEof $warning "254 bytes at EOF"

Write-Host "Windows interactive chatbot tests passed."
