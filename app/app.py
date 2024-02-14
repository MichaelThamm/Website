import asyncio
import emailer
import os.path
import tornado


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        # Run the index HTML code
        self.render('index.html')

    def post(self):
        # Handle form submissions
        method_value = self.get_argument("method", None)
        if method_value == "emailer.py":
            emailer.run(self.request.arguments)


def make_app():
    return tornado.web.Application([
        (r"/", MainHandler)
    ],
    template_path=os.path.join(os.path.dirname(__file__), "templates"),
    debug = True,
    autoreload = True)


if __name__ == "__main__":
    app = make_app()
    app.listen(5000)
    tornado.ioloop.IOLoop.current().start()
