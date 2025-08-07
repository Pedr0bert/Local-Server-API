@echo off
title Instalador de API Local - ESP32

REM Guarda o caminho onde o .bat está
set BASE_DIR=%~dp0

echo Instalando Node.js e PM2...
echo -----------------------------------

REM Verifica se o Node.js está instalado
where node >nul 2>nul
IF ERRORLEVEL 1 (
    echo Node.js nao encontrado.
    echo Baixe e instale manualmente do site: https://nodejs.org
    pause
    exit /b
)
echo Node.js encontrado.

REM Verifica se o NPM está instalado
where npm >nul 2>nul
IF ERRORLEVEL 1 (
    echo NPM nao encontrado.
    echo Baixe e instale manualmente do site: https://nodejs.org
    pause
    exit /b
)
echo NPM encontrado.
echo -----------------------------------

cd /D "%BASE_DIR%api"
echo Inicializando package.json...
call npm init -y
echo Package.json criado com sucesso!
echo -----------------------------------

REM Instala dependências da API
echo Instalando dependencias do projeto...
call npm install mongoose cors express body-parser dotenv

IF %ERRORLEVEL% NEQ 0 (
    echo Erro na instalacao das dependencias!
    pause
    exit /b
)

echo Dependências instaladas com sucesso!
echo -----------------------------------

cd /D "%BASE_DIR%"

REM Verifica se o PM2 está instalado
where pm2 >nul 2>nul
IF ERRORLEVEL 1 (
    echo PM2 nao encontrado.
    echo Instalando PM2 globalmente...
) ELSE (
    echo PM2 ja esta instalado.
)
echo -----------------------------------

REM Instala PM2 globalmente
call npm install -g pm2

REM Inicia a API com PM2 (usando caminho absoluto)
echo Iniciando API com PM2...
call pm2 start "%BASE_DIR%api\api.js" --name api-esp32

REM Salva o estado atual
call pm2 save
echo API iniciada com sucesso!

echo -----------------------------------
echo Tudo pronto!
echo A API esta rodando e vai iniciar automaticamente com o computador.
pause
