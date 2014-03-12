#!/usr/bin/env python

import json


artifacts = json.load(open('artifacts.json'))
artifact_url = [e['url'] for e in artifacts if e['type'] == 'file'][0]
open('download-link.txt', 'w').write(artifact_url)
