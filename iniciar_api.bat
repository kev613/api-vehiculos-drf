@echo off
cd /d "%~dp0"
set DB_NAME=vehiculos_db
set DB_USER=api_user
set DB_PASSWORD=Vehiculos2026
set DB_HOST=127.0.0.1
set DB_PORT=3306
where py >nul 2>&1 && (set PYX=py) || (set PYX=python)
if not exist .venv (
  %PYX% -m venv .venv
)
call .venv\Scripts\activate.bat
python -m pip install -q -r requirements.txt
python manage.py migrate
python manage.py runserver 8000
pause
