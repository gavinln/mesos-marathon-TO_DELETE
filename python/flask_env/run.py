#!/usr/bin/python

import os
from app import app


if os.environ.get('PORT', 5000):
    app.run(host='0.0.0.0', debug=True, port=int(os.environ.get('PORT')))
