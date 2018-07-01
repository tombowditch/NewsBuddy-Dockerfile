#!/bin/sh

su -c "cd /home/archiveteam/NewsGrabber-Warrior/; run-pipeline pipeline.py --concurrent 20 --port 8888 --address '127.0.0.1' tombowditch" archiveteam
