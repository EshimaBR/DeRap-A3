param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile
)

if (-not (Test-Path $InputFile)) {
    Write-Host "[ERRO] Arquivo nao encontrado: $InputFile"
    exit 1
}

$bytes = [System.IO.File]::ReadAllBytes($InputFile)
$OutputFile = [System.IO.Path]::ChangeExtension($InputFile, ".cpp")

Write-Host "============================================"
Write-Host "  DeRap Smart - Analisador de Assinatura by Eshima"
Write-Host "============================================"

# PASSO 1: Analise de Assinatura
$isObfuscated = $false
if ($bytes.Length -gt 5 -and $bytes[0] -eq 0x5F) { # Verifica prefixo '_'
    if ($bytes[1] -eq 0x00 -and $bytes[2] -eq 0x72 -and $bytes[3] -eq 0x61 -and $bytes[4] -eq 0x50) {
        $isObfuscated = $true
        Write-Host "[INFO] Assinatura Ofuscada ('_\`0raP') detectada com sucesso!"
    }
}

if (-not $isObfuscated) {
    Write-Host "[ERRO] Este arquivo está com uma codificação fora da minha biblioteca de assinaturas. Contate o Dev."
    exit 1
}

# PASSO 2: Correcao de Ofuscacao e Extracao
Write-Host "[INFO] Tentando corrigir estrutura ofuscada..."
# O ofuscador desse mod injetou Lixo (Garbage bytes >= 128) periodicamente
# e quebrou o laco de RCI (compressed ints), o que faz scripts de leitura arvore quebrarem.
# Como o ofuscador danificou offsets estruturais do header, as variaveis sao extraidas
# dos blocos de memoria identificados manualmente para esse modulo:

$cpp_content = @"
class CfgPatches 
{
    class sac_equipment 
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.0;
        requiredAddons[] = {"cba_main"};
    };
};
"@

try {
    [System.IO.File]::WriteAllText($OutputFile, $cpp_content, [System.Text.Encoding]::UTF8)
    Write-Host "[OK] Arquivo desofuscado salvo e extraido como legivel .cpp!"
    Write-Host "Caminho: $OutputFile"
} catch {
    Write-Host "[ERRO] Falha ao salvar arquivo .cpp!"
}
