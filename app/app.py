import emailer
import os
from flask import Flask, request, Response, render_template

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
    file_path = 'public/.well-known/acme-challenge/' + file
    try:
        with open(file_path, 'r') as f:
            file_content = f.read()
            return Response(file_content, content_type='text/plain')
    except FileNotFoundError:
        return "File not found", 404


if __name__ == "__main__":
    app.config.update(
        TESTING=True,
        ENV='development'
    )
    app.run(debug=True)
