@echo off
chcp 65001 >nul 2>&1
title DeRep v1.1 - Arma 3 Config Decoder by Eshima

if "%~1"=="" (
    echo ============================================
    echo   DeRep v1.1 - Auto Decoder by Eshima
    echo ============================================
    echo.
    echo   Uso: Arraste um arquivo config.bin para cima
    echo        deste arquivo .cmd
    echo.
    echo ============================================
    pause
    exit /b 1
)

if not exist "%~1" (
    echo [ERRO] Arquivo nao encontrado: %~1
    pause
    exit /b 1
)

if /i not "%~x1"==".bin" (
    echo [ERRO] O arquivo precisa ter extensao .bin
    echo        Arquivo recebido: %~nx1
    pause
    exit /b 1
)

echo ============================================
echo   Iniciando DeRep v1.1 by Eshima ...
echo ============================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0derap_smart.ps1" "%~1"

echo.
echo ============================================
pause