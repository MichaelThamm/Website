
# Welcome
This is a repo to host a website using:
* [Flask](https://flask.palletsprojects.com/en/3.0.x/) - Python web framework
* [Docker](https://www.docker.com/) - containerization
* [Heroku](https://dashboard.heroku.com/apps) - hosting provider
* [GitHub Actions](https://github.com/MichaelThamm/website/actions/workflows/heroku-deploy.yml) - automation & integration
  * [Lighthouse](https://github.com/marketplace/actions/lighthouse-ci-action) - web anaylsis tool

## Hosted on the Web
* My page can be found at [www.michaelthamm.com](http://www.michaelthamm.com) which uses some of the Youtube videos to set up a paid custom domain or you can do it free using the herokuapp.com domain.

## Hosted Locally
* To run the web page locally, run [run-docker.sh](https://github.com/MichaelThamm/website/blob/main/run-docker.sh).

## CI/CD Automation
* The generic workflow follows:
  * __build__
    * Test the website page reference URLs for failure.
    * Build the docker image
    * Push the docker image to DockerHub
  * __deploy__
    * Push the application to Heroku resource
  * __test-deployed__
    * Run lighthouse to test the metrics of the deployed webpage

# Supporting References
- [Docker-Flask](https://www.freecodecamp.org/news/how-to-dockerize-a-flask-app/)
- [Flask-Web-App](https://www.digitalocean.com/community/tutorials/how-to-make-a-web-application-using-flask-in-python-3)
- [Heroku-Flask](https://realpython.com/flask-by-example-part-1-project-setup/)
- [Website-Templates](https://www.w3schools.com/w3css/w3css_templates.asp)
- [This-Website's-Template](https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_templates_parallax&stacked=h)
