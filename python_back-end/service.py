import base64


import requests
from flask import Flask, request, jsonify, json


app = Flask(__name__)


@app.route('/registraFace', methods=['POST'])
def registraFace():

    foto= request.files.get('photo', '')
    # key= request.get_json('key', '')
    print(request.form["key"])
    (type(foto))
    # (type(key))

    r = requests.post(

        'https://heimdallr.sao01.containers.appdomain.cloud/register',
        data={'workspace': request.form["workspace"], 'key': request.form["key"]},
        files={'photo': foto}

    )
    resp = r.json()
    print(resp)
    print("Chegou Saporra")

    return resp


@app.route('/procuraFace', methods=['POST'])
def procuraFace():
    foto = request.files.get('photo', '')
    r = requests.post(

        'https://heimdallr.sao01.containers.appdomain.cloud/search',
        data={'workspace': request.form["workspace"]},
        files={'photo': foto}

    )

    resp = r.json()
    print(resp)

    if resp["status"] == "success":
        return resp["data"]["similars"][0]
    else:
        print(resp["data"]["message"])
        return resp["data"]["message"][0]

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=3000, debug=True)

