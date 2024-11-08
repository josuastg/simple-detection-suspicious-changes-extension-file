@echo off
setlocal enabledelayedexpansion

:: Folder tempat file akan disimpan
set "output_folder=E:\test-ransom"

:: Memulai angka prefix dari 1
set /a counter=1

:: Perulangan tanpa batas
:loop

 :: Menyusun nama file dengan angka urut
    set "filename=%counter%_file.txt"
    set "filename=test_%counter%.txt"
    
   :: Membuat file .txt kosong di folder output dengan angka urut di awal nama
    echo File number %counter% generated at %date% %time% > "%output_folder%\%filename%"
    
    :: Menambah angka urut
    set /a counter+=1

    :: Menunggu 2 detik sebelum membuat file baru
    timeout /t 2 /nobreak >nul
goto loop
