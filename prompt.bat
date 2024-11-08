@echo off
setlocal

:prompt
echo Apakah Anda ingin melanjutkan? (Y/N)
set /p choice="Pilihan Anda: "
if /i "%choice%"=="Y" goto yes
if /i "%choice%"=="N" goto no
echo Pilihan tidak valid. Silakan coba lagi.
goto prompt

:yes
echo Anda memilih "Yes". Melanjutkan proses...
REM Tambahkan perintah yang ingin Anda jalankan di sini
goto end

:no
echo Anda memilih "No". Menghentikan proses...
REM Tambahkan perintah yang ingin dijalankan jika memilih "No" di sini
goto end

:end
echo Proses selesai.
endlocal
pause
