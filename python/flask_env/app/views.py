from app import app
import os
import time


@app.route('/')
@app.route('/index')
def index():
    lines = ['%s: %s' % (key, value) for key, value in os.environ.items()]
    return "Hello from port <b>%s</b><br/><br/>%s" % (
        os.environ['PORT'], '<br/>'.join(lines))
