:: Change dir into the project root
cd ..
:: Delete the containers from previous builds
for /f %%i in ('docker ps -qf "name=Flask-Docker"') do (
    docker stop %%i
    docker rm %%i
)
:: Build Docker image
docker build -t michaelthamm/github-projects:Flask-Docker .
:: Run the Docker container in detached mode to allow access to port 5000
docker run --name Flask-Docker -d -p 5000:5000 michaelthamm/github-projects:Flask-Docker
:: Set the local webpage location
set url="http://localhost:5000"
:: Start webpage in Google Chrome
start chrome %url%
:: Show the images and containers created
docker ps -af "name=Flask-Docker")

EXIT