import emailer
from flask import Flask, request, render_template, Response
import time

app = Flask(__name__, static_url_path='/static')


@app.route('/')
def index():
    # If a URL request has ? followed by key value pairs and there is a method key
    # it was generated with the form's hidden id
    if request.args.get("method") == "emailer.py":
        emailer.run(request.args)

    # Run the index HTML code
    return render_template('index.html')


@app.route('/health-check-stream')
def health_check_stream():
    def generate_health_status():
        while True:
            health_status = "ERROR" if time.time() % 2 == 0 else "OK"
            yield f"data: {health_status}\n\n"
            time.sleep(1)
            
    return Response(generate_health_status(), mimetype='text/event-stream')


if __name__ == "__main__":
    app.config.update(
        TESTING=True,
        ENV='development'
    )
    app.run(debug=True)
