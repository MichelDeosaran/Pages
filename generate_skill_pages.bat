@echo off
setlocal enabledelayedexpansion

REM Make sure "skills" folder exists
if not exist skills mkdir skills

REM List of skill file names and titles
set skills=concierge, sanitation, condrain, alta, snowboard, chairlift

for %%s in (%skills%) do (
    set "skill=%%s"
    set "filename=%%s"
    set "filename=!filename: =-!"
    echo Generating !filename!.html

    (
        for /f "delims=" %%l in (template.html) do (
            set "line=%%l"
            set "line=!line:{{TITLE}}=%%s!"
            echo !line!
        )
    ) > !filename!.html
)

echo All skill pages generated in /skills
pause
