import cv2
import numpy as np
from PIL import Imagem
import os

prototxt = 'C:\git\Projetos\IA\face_recognition\webcam_face_detection\deploy.prototxt.txt'
model = 'C:\git\Projetos\IA\face_recognition\webcam_face_detection\res10_300x300_ssd_iter_140000.caffemodel'

imagem_teste = 'C:\git\Projetos\IA\face_recognition\webcam_face_detection\images'
imagem = Image.open(test_image).convert('L')
imagem_np = np.array(image, 'uint8')

network = cv2.dnn.readNetFromCaffe(prototxt, model)

def detecta_face(network, path_imagem, conf_min = 0.7):
    imagem = Image.open(path_imagem).convert('L')
    imagem = np.array(imagem, 'uint8')
    imagem = cv2.cvtColor(imagem, cv2.COLOR_GRAY2BGR)

    (h,w) = imagem.shape[:2]

    blob = cv2.dnn.blobFromImage(imagem, 1.0, (100,100), (104.0, 117.0, 123.0))

    network.setInput(blob)

    deteccoes = network.forward()
    face = None

    for i in range(0, deteccoes.shape[2]):
        confianca = deteccoes[0,0, i, 2]

    if confianca > conf_min:
        box = deteccoes[0, 0, i, 3:7] * np.array([w,h,w,h])
        (start_x, start_y, end_x, end_y) = box.astype("int")

    #aqui temos a região de interesse da imagem
    roi = imagem[start_y:end_y, start_x:end_x]
    roi = cv2.resize(roi,(60,80))

    cv2.rectangle(imagem, (start_x, start_y), (end_x, end_y), (0,255,0), 2)
    face = cv2.cvtColor(roi, cv2.COLOR_BGR2GRAY)

return face,imagem
