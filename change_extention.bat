@echo off
setlocal

REM Menentukan folder tempat file .txt berada (bisa diubah sesuai kebutuhan)
set "folder_path=E:\test-ransom"

REM Masuk ke folder yang ditentukan
cd /d "%folder_path%"

REM Mengganti ekstensi .txt menjadi .enc
for %%f in (*.txt) do (
    ren "%%f" "%%~nf.enc"
)
:end
echo Semua file .txt telah diubah menjadi .enc
endlocal
pause
