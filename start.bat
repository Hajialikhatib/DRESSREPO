@echo off
echo ============================================
echo   Dressing and Design Management System
echo ============================================
echo.

echo [1/4] Activating Python environment...
cd /d "%~dp0backend"
call venv\Scripts\activate

echo [2/4] Running Django migrations...
python manage.py makemigrations
python manage.py migrate

echo [3/4] Starting Django backend on port 8000...
start "Django Backend" cmd /k "call venv\Scripts\activate && python manage.py runserver"

echo [4/4] Starting React frontend on port 3000...
cd /d "%~dp0frontend"
start "React Frontend" cmd /k "npm start"

echo.
echo ============================================
echo  Backend:  http://localhost:8000
echo  Frontend: http://localhost:3000
echo  Admin:    http://localhost:8000/admin/
echo ============================================
pause
