from flask import Flask, jsonify, request
from PIL import Image
import base64
import io

from flask_cors import cross_origin, CORS

from yolo import YOLO

app = Flask(__name__)


@app.route('/ai', methods=['POST'])
@cross_origin()
def hello_world():

    data = request.get_json()

    base64str = data.get('img')


    #base64str = request.form['img']

    img = Image.open(io.BytesIO(base64.b64decode(base64str)))

    yolo = YOLO()
    r_image, flag = yolo.detect_image(img, crop=False)
    r_image.show()

    if flag:
        print('存在重大作弊嫌疑，立刻上报！')
    else:
        print('系统未能检测出违规物品。')

    print('img: ', img.size)

    return jsonify({'text': 'Success'})


if __name__ == '__main__':
    app.run()
