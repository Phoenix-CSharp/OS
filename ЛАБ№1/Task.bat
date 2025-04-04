@echo off
setlocal EnableDelayedExpansion


goto start

:check_filename
    set "filename=%~1"

    if /i "%filename%"=="task.bat" (
        echo .Bat file, skip
        exit /b -1
    )
    exit /b 0


:start

for %%f in (*) do (
    if not "%%f"=="" (
        call :check_filename "%%f"

        if errorlevel 0 (
            set "name=%%f"
            set "symbol=!name:~0,1!"
            set "isLetter=0"

            for %%l in (a A b B c C d D e E f F g G h H i I j J k K l L m M n N o O p P q Q r R s S t T u U v V w W x X y Y z Z а А б Б в В г Г д Д е Е ё Ё ж Ж з З и И й Й к К л Л м М н Н о О п П р Р с С т Т у У ф Ф х Х ц Ц ч Ч ш Ш щ Щ ъ Ъ ы Ы ь Ь э Э ю Ю я Я) do (

                if "%%l"=="!symbol!" set "isLetter=1"

            )

            if !isLetter! equ 1 (
                if not exist "!symbol!" mkdir "!symbol!"
                move "%%f" "!symbol!"
            )
        )
    )
)
pause

endlocal