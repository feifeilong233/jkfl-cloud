from PIL import Image

from yolo import YOLO

if __name__ == "__main__":
    yolo = YOLO()
    mode = "predict"
    crop = False
    test_interval = 100


    '''
    dir_origin_path指定了用于检测的图片的文件夹路径
    dir_save_path指定了检测完图片的保存路径
    dir_origin_path和dir_save_path仅在mode='dir_predict'时有效
    '''
    dir_origin_path = "img/"
    dir_save_path = "img_out/"


    if mode == "predict":
        '''
        1、如果想要进行检测完的图片的保存，利用r_image.save("img.jpg")即可保存，直接在predict.py里进行修改即可。 
        2、如果想要获得预测框的坐标，可以进入yolo.detect_image函数，在绘图部分读取top，left，bottom，right这四个值。
        3、如果想要利用预测框截取下目标，可以进入yolo.detect_image函数，在绘图部分利用获取到的top，left，bottom，right这四个值
        在原图上利用矩阵的方式进行截取。
        4、如果想要在预测图上写额外的字，比如检测到的特定目标的数量，可以进入yolo.detect_image函数，在绘图部分对predicted_class进行判断，
        比如判断if predicted_class == 'book': 即可判断当前目标是否为书本，然后记录数量即可。利用draw.text即可写字。
        '''
        while True:
            img = input('Input image filename:')
            try:
                image = Image.open(img)
            except:
                print('Open Error! Try again!')
                continue
            else:
                r_image = yolo.detect_image(image, crop=crop)
                r_image.show()

    else:
        raise AssertionError("Please specify the correct mode: 'predict', 'video', 'fps' or 'dir_predict'.")
