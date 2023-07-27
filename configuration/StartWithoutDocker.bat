:: Install requirements
pip install -r app/requirements.txt
:: Set the name of the Flask app
set FLASK_APP=app
:: Set the environment level of the Flask app
set FLASK_ENV=development
:: Set the local webpage location
set url="http://localhost:5000"
:: Start webpage in Google Chrome
start chrome %url%
:: Start the web application
flask run

EXIT