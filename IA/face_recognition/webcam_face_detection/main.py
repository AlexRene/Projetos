import cv2

# Carrega o Haarcascade para detectar rostos
faceCascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')

# Configura a conexão com a câmera IP
ip = "10.37.80.233"
port = 8080
cap = cv2.VideoCapture("https://" + ip + ":" + str(port) + "/video")

# Loop infinito para capturar imagens
while True:

    # Captura uma imagem da câmera
    ret, frame = cap.read()

    # Converte a imagem para escala de cinza
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Detecta os rostos na imagem
    faces = faceCascade.detectMultiScale(gray, 1.1, 5, minSize=(30, 30))

    # Exibe os rostos na imagem
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)

    # Exibe a imagem
    cv2.imshow('Imagem com rostos detectados', frame)

    # Aguarda uma tecla ser pressionada
    key = cv2.waitKey(1)

    # Se a tecla `q` for pressionada, o loop é encerrado
    if key == ord('q'):
        break

# Fecha a câmera
cap.release()
