import cv2
import numpy as np


from helper_functions import resize_video

network = cv2.dnn.readNetFromCaffe("deploy.prototxt.txt", "res10_300x300_ssd_iter_140000.caffemodel")

max_width = 1200


def detecta_face_ssd(network, orig_frame, show_conf=True, conf_min=0.7):
    frame = orig_frame.copy()  # mantendo os frames originais caso queiramos salvar mais tarde
    (h, w) = frame.shape[:2]
    blob = cv2.dnn.blobFromImage(cv2.resize(frame, (300, 300,)), 1.0, (300, 300), (104.0, 117.0, 123.0))
    network.setInput(blob)
    face_detections = network.forward()

    for i in range(0, face_detections.shape[2]):
        confidence = face_detections[0, 0, i, 2]
        if confidence > conf_min:
            box = face_detections[0, 0, i, 3:7] * np.array([w, h, w, h])
            (start_x, start_y, end_x, end_y) = box.astype("int")

            # condicao para garantir que o programa nao vai encerrar, pois algumas vezes se a face esta nas bordas da area de captura
            # pode retornar valores negativos e parar o programa
            if (start_x < 0 or start_y < 0 or end_x > w or end_y > h):
                continue

            cv2.rectangle(frame, (start_x, start_y), (end_x, end_y), (0, 255, 0), 2)
            if show_conf:
                text_conf = "{:.2f}%".format(confidence * 100)
                cv2.putText(frame, text_conf, (start_x, start_y - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)

    return frame



cam = cv2.VideoCapture(0) # 0 para camera integrada 1 para webcam externa
#ip = 'https://10.21.105.172:8080/video'
#ip = 'https://192.168.101.16:8080/video'
#cam.open(ip)

while (True):
    ret, frame = cam.read()

    if not ret:
        sprint("Can't receive frame (stream end?). Exiting...")
        break

    if max_width is not None:
        video_width, video_height = resize_video(frame.shape[1], frame.shape[0], max_width)
        frame = cv2.resize(frame, (video_width, video_height))

        processed_frame = detecta_face_ssd(network, frame)

        cv2.imshow("Detecting faces", processed_frame)

        # Adicionada a tecla 'q' para parar a execução:
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
        #cv2.waitKey(1)

print("Acabou")
cam.release()
cv2.destroyAllWindows()
