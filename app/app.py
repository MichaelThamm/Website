import emailer
import sys
from flask import Flask, render_template, request

app = Flask(__name__)


@app.route('/')
def index():
    # If a URL request has ? followed by key value pairs and there is a method key
    # it was generated with the form's hidden id
    if request.args.get("method") == "emailer.py":
        emailer.run(request.args)

    # Run the index HTML code
    return render_template('index.html')


if __name__ == "__main__":
    print(sys.path)
    # app.config.update(
    #     TESTING=True,
    #     ENV='development'
    # )
    # app.run(debug=True)