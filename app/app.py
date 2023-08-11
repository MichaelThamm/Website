import emailer
import sys
from flask import Flask, request, render_template, send_from_directory

app = Flask(__name__)


@app.route('/')
def index():
    # If a URL request has ? followed by key value pairs and there is a method key
    # it was generated with the form's hidden id
    if request.args.get("method") == "emailer.py":
        emailer.run(request.args)

    # Run the index HTML code
    return render_template('index.html')


@app.route('/.well-known/acme-challenge/<file>')
def acme_challenge(file):
    directory = 'public/.well-known/acme-challenge'
    return send_from_directory(directory, file)


if __name__ == "__main__":
    print(sys.path)
    # app.config.update(
    #     TESTING=True,
    #     ENV='development'
    # )
    # app.run(debug=True)