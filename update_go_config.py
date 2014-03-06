#!/usr/bin/env python

import json
import sys
import time
import urllib2
from StringIO import StringIO
from xml.dom import minidom


GO_SERVER_URL = 'http://127.0.0.1:8153'
CONFIG_XML_PATH = '/go/api/admin/config_xml'
AGENTS_JSON_PATH = '/go/api/agents'
NO_OF_AGENTS = 2


def get_server_id():
    while True:
        try:
            page = urllib2.urlopen(GO_SERVER_URL + CONFIG_XML_PATH).read()
            data = minidom.parseString(page).getElementsByTagName('server')
            return data[0].attributes['serverId'].value
        except:
            sys.stderr.write("Waiting for the server...\n")
            time.sleep(1)


def get_agent_uuids():
    while True:
        try:
            page = urllib2.urlopen(GO_SERVER_URL + AGENTS_JSON_PATH).read()
            agents_data = json.load(StringIO(page))
            return [agents_data[i]['uuid'] for i in range(NO_OF_AGENTS)]
        except:
            sys.stderr.write("Waiting for the agents...\n")
            time.sleep(1)


if __name__ == "__main__":
    print("%s %s %s" % tuple([get_server_id()] + get_agent_uuids()))
