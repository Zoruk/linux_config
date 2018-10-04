#!/usr/bin/python3

#pip install git+https://github.com/Azelphur/pyPushBullet.git
from pushbullet.pushbullet import PushBullet
from pprint import pprint
import datetime
import cv2
import os
import uuid
import http.client, urllib
import time
import pickle
import sys
import socket
import ftplib
import io


PB_TOKEN = ''
PB_EMAIL = ''
REMOTE_SERVER = ""
FTP_USER = ""
FTP_PASS = ""
PKL_DIRECTORY = '/tmp/faillog'

def getPict():
    try:
        # initialize the camera
        cam = cv2.VideoCapture(0)   # 0 -> index of camera
        for _ in range(30):
            s, img = cam.read()
        if s:    # frame captured without any errors
            return img
    except:
        return None

def getEnviron():
    environ = {}
    for k in os.environ:
        environ[k] = os.environ.get(k)
    return environ

def is_connected(hostname):
    try:
        # see if we can resolve the host name -- tells us if there is
        # a DNS listening
        host = socket.gethostbyname(hostname)
        # connect to the host -- tells us if the host is actually
        # reachable
        s = socket.create_connection((host, 80), 2)
        s.close()
        return True
    except:
        return False

def upload_pic(img, uid):
    if img is None:
        return
    data = cv2.imencode('.png', img)[1].tostring()
    ftp_connection = ftplib.FTP(REMOTE_SERVER, FTP_USER, FTP_PASS)
    ftp_connection.storbinary('STOR {}.png'.format(uid), io.BytesIO(data))
    ftp_connection.sendcmd('SITE CHMOD 0640 {}.png'.format(uid))
    ftp_connection.close()

def upload_notify(data):
    if not is_connected(REMOTE_SERVER):
        return False
    env = 'Login failed on {} \n'.format(os.uname()[1])
    env += 'Time {}\n'.format(datetime.datetime.fromtimestamp(data['time']).strftime('%d-%m-%Y %H:%M:%S'))
    for k, v in data['env'].items():
        if 'PAM_' in k:
            env += '{0:15} {1}\n'.format(k[4:], v)
    pb = PushBullet(PB_TOKEN)
    if data['pic'] is not None:
        iobytes = io.BytesIO(cv2.imencode('.png', data['pic'])[1].tostring())
        pb.pushFile(PB_EMAIL, file_name='capture.png', body=env, file=iobytes, recipient_type='email')
    else:
        pb.pushNote(PB_EMAIL, title=env.split('\n')[0], body='\n'.join(env.split('\n')[1:]), recipient_type='email')
    return True
    #conn = http.client.HTTPSConnection("api.pushover.net:443")
    #reqdata =  {
    #        "token": "aceu463rbhmbb6hpggoscfzxcnkwgn",
    #        "user": "ugjgazutqraz8riv8rvn3y2qkbs4hr",
    #        "title": "Login failed on {}".format(os.uname()[1]),
    #        "message": env,
    #        "timestamp": int(data['time']),
    #}
    #if data['pic'] is not None:
    #    upload_pic(data['pic'], data['uid'])
    #    reqdata['url'] =  "https://home.haikou.ch/pic/{}.png".format(data['uid'])
    #    reqdata['url_title'] = 'Picture'

    #conn.request("POST", "/1/messages.json", urllib.parse.urlencode(reqdata),
    #    { "Content-type": "application/x-www-form-urlencoded" })
    #conn.getresponse()
    #return True

def process_waiting():
    if not is_connected(REMOTE_SERVER):
        return
    for fname in os.listdir(PKL_DIRECTORY):
        filepath = os.path.join(PKL_DIRECTORY, fname)
        try:
            with open(filepath, 'rb') as f:
                data = pickle.load(f)
            if upload_notify(data):
                os.unlink(filepath)
        except:
            os.unlink(filepath)


def main():
    uid = str(uuid.uuid4())
    data = {
        'time': time.time(),
        'env': getEnviron(),
        'pic': getPict(),
        'uid': uid
    }

    #print(data)
    try:
        if not os.path.exists(PKL_DIRECTORY):
            os.makedirs(PKL_DIRECTORY)
        if not upload_notify(data):
            with open(PKL_DIRECTORY + '/' + str(uid) + '.pkl', 'wb') as f:
                pickle.dump(data, f)
    except Exception as e:
        print(e)
        pass

    exit(0)



if __name__ == "__main__":
    if len(sys.argv) > 1:
        process_waiting()
    else:
        main()

