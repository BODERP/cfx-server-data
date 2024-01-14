@echo off
echo Deletando Pasta CACHE...
echo -
rd /s /q "cache"
..\FXServer.exe +exec server.cfg