@echo off
setlocal

REM Menentukan folder yang akan dipantau
set "folder_path=E:\test-ransom"

REM Menginisialisasi variabel awal
set /a count=0
set prompt_shown=0

:restart
REM Mulai memantau folder
echo Memulai pemantauan folder untuk perubahan ekstensi file .txt dalam kurun waktu 5 detik...

:loop
REM Mendapatkan daftar file dengan ekstensi yang sudah berubah ke .enc dalam folder yang dipantau
set /a count=0
for %%f in ("%folder_path%\*.enc") do (
    set /a count+=1
)

REM Mengecek jika ada perubahan ekstensi file lebih dari atau sama dengan 5 file
if %count% GEQ 5 (
    
    REM Mengecek apakah prompt sudah ditampilkan sebelumnya
    if %prompt_shown% EQU 0 (
        REM echo Terjadi perubahan ekstensi pada %count% file dalam kurun waktu 5 detik.
        echo Terjadi perubahan ekstensi pada %count% file dalam kurun waktu 5 detik.
        set prompt_shown=1
        REM Menampilkan prompt Yes/No
        :prompt
        echo Apakah Anda ingin melanjutkan pemantauan? Y/N
        REM Validasi untuk memastikan input tidak kosong
        set /p choice="Pilihan Anda: "
        if "%choice%"=="" (
             REM Jika kosong pada percobaan pertama, coba ulangi prompt
            set /p choice="Masukkan Kembali Pilihan Anda Y/N: "
        )
        if /i "%choice%"=="Y" (
            set prompt_shown=0
            goto restart
        ) else (
            if /i "%choice%"=="N" (
                goto end
            ) else (
                goto prompt
            )
        )
    )
) else (
    echo Tidak ada perubahan signifikan pada ekstensi file dalam batas waktu.
)

REM Menunggu 5 detik sebelum memulai pengecekan lagi
timeout /t 5 >nul
goto loop

:end
echo Pemantauan dihentikan.
endlocal
pause
