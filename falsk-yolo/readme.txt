flask-yolo为监控服务器，采用python-flask搭建，是独立于微服务之外的单独服务器，只负责监考摄像头检测。

主文件夹下:
 - app.py 为flask入口文件
 - predict.py 为yolo v4的预测函数
 - yolo.py 为yolo模型

utils 存放需要的工具类：
 - callback.py 神经网络前向反馈工具类
 - dataloader.py 数据预处理工具类
 - utils.py 工具类
 - utils_bbox.py 检测框工具类
 - utils_fit.py 预测填充工具类
 - utils_map.py 预测工具类

templates flask默认生成的静态模板文件夹，没有使用

static flask默认生成静态资源文件夹，没有使用

nets 存放yolo网络结构：
 - __init__.py 初始化函数
 - CSPdarknet.py 定义v4 darknet函数
 - yolo.py yolo模型
 - yolo_training.py 模型训练函数

model_data 存放训练好的模型：
 - coco_classes.txt 可以检测的物体标签
 - simhei.ttf 表示字体库
 - yolo4_weights.pth 权重
 - yolo_anchors.txt 预测框初始配置

img 文件夹下存放早期测试使用的图片