@echo off
echo Deletando Pasta CACHE...
echo -
rd /s /q "cache"

cd /d/BODERP/cfx-server-data/server-data
..\FXServer.exe +exec server.cfg