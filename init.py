#!/usr/bin/env python3
'''
    File name: init.py
    Author: Shamal Roy <shamal.roy@gmail.com>
    Version: 1.0
'''

import time
import http.client
import shutil
import os
import subprocess

def checkAEM():
    try:
        conn = http.client.HTTPConnection("localhost", 4502)
        conn.request("GET", "/")
        res = conn.getresponse()
        print ("HTTP status code: {}".format(res.status))
        if res.status == 401:
            print ("AEM started.")
            if os.path.isdir("/var/aem/crx-quickstart/_install"):
                print ("valid dir")
                shutil.move("/var/aem/crx-quickstart/_install", "/var/aem/crx-quickstart/install")
                print ("moved: _install dir to install.")
        else:
            time.sleep(5)
            print ("wait...")
            checkAEM()
    except:
        print ("connection failed. trying again ...")
        time.sleep(10)
        checkAEM()

subprocess.call("pwd")
subprocess.call("./bin/start")
checkAEM()
