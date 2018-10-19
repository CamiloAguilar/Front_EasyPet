# USAGE
# python dogger.py --prototxt bvlc_googlenet.prototxt --model bvlc_googlenet.caffemodel --labels synset_words.txt

# import the necessary packages
from pyimagesearch.centroidtracker import CentroidTracker
from imutils.video import VideoStream
import numpy as np
from imutils.video import FPS
import argparse
import imutils
import time
import cv2
import pandas as pd

# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-p", "--prototxt", required=True,
	help="path to Caffe 'deploy' prototxt file")
ap.add_argument("-m", "--model", required=True,
	help="path to Caffe pre-trained model")
ap.add_argument("-l", "--labels", required=True,
	help="path to ImageNet labels (i.e., syn-sets)")
args = vars(ap.parse_args())

#face_cascade = cv2.CascadeClassifier('./cascade_files/haarcascade_frontalface_alt.xml')

def face_detector(frame):
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray)
    return len(faces) > 0

rows = open(args["labels"]).read().strip().split("\n")
classes = [r[r.find(" ") + 1:].split(",")[0] for r in rows]
COLORS = np.random.uniform(0, 255, size=(len(classes), 3))

# initialize our centroid tracker and frame dimensions
ct = CentroidTracker()
(H, W) = (224, 224)

# load our serialized model from disk
print("[INFO] loading model...")
net = cv2.dnn.readNetFromCaffe(args["prototxt"], args["model"])

# initialize the video stream, allow the cammera sensor to warmup,
print("[INFO] starting video stream...")
#vs = VideoStream(src=0).start()
#vs = cv2.VideoCapture('videoprueba3.mp4')
#vs = cv2.VideoCapture('Beagle.mp4')
vs = cv2.VideoCapture(1)
#vs = cv2.VideoCapture('beyota1.mp4')
time.sleep(2.0)
fps = FPS().start()
lista_nueva = []
# iterative number for pandas impesion
i_iter = 0
# loop over the frames from the video stream
while True:
	# grab the frame from the threaded video stream and resize it
	# to have a maximum width of 400 pixels
	(grabbed, frame) = vs.read()
		# if the frame was not grabbed, then we have reached the
	# end of the stream
	if not grabbed:
		break

	#frame = vs.read()
	frame = imutils.resize(frame, width=800)

	# grab the frame dimensions and convert it to a blob
	(H, W) = frame.shape[:2]
 	#blob = cv2.dnn.blobFromImage(cv2.resize(frame, (224, 224)), 0.007843, (224, 224), 127.5)
	blob = cv2.dnn.blobFromImage(frame, 1, (224, 224), (104, 117, 123))

	# pass the blob through the network and obtain the detections and
	# predictions
	net.setInput(blob)
	detections = net.forward()
	idxs = np.argsort(detections[0])[::-1][:5]
	idxss = np.argsort(detections[0])[::-1][:1000]
	idxsss = [x for x in idxss if (x>=151) & (x<=267)]
	lista_ant = lista_nueva.copy()

	for (i, idx) in enumerate(idxs):
			if i == 0:
				if ((idx >= 151) & (idx <=267) & (detections[0][idx]*100>=30)):
					lista_nueva = [idx]
					text = "DOG: raza {}, {:.2f}%".format(classes[idx],detections[0][idx] * 100)
					cv2.putText(frame, text, (5, 25),  cv2.FONT_HERSHEY_SIMPLEX,0.7, (0, 0, 255), 2)
				elif ((idx >= 151) & (idx <=267) & (detections[0][idx]*100<30)):
					lista_nueva = [999]
					text = "DOG: Criollo, {:.2f}%".format(100 - (detections[0][idx]*100))
					cv2.putText(frame, text, (5, 25),  cv2.FONT_HERSHEY_SIMPLEX,0.7, (0, 0, 255), 2)
				elif ((idx >= 282) & (idx <=285)):
					lista_nueva = [idx]
					text = "CAT: raza {}, {:.2f}%".format(classes[idx],detections[0][idx] * 100)
					cv2.putText(frame, text, (5, 25),  cv2.FONT_HERSHEY_SIMPLEX,0.7, (0, 0, 255), 2)

	print('Breed:', lista_nueva)
	df = pd.DataFrame(lista_nueva, columns=["breed"])

	#if ((i_iter%5 == 0) & (lista_nueva != lista_ant)):
	if ((i_iter%5 == 0)):
		try:
			df.to_csv('Front_ProPet/files/dog_breed.csv', index=False)
			if ((len(lista_nueva)!=0)):
				if(df.breed[0] != 999):
					time.sleep(4)
					#lista_nueva = [999]
		except PermissionError as e:
			print(e)
		i_iter+=1

	# show the output frame
	cv2.imshow("Frame", frame)
	key = cv2.waitKey(1) & 0xFF

	# if the `q` key was pressed, break from the loop
	if key == ord("q"):
		break

	# update iterative number
	i_iter+=1
	#print('iteration:', i_iter)

	# update the FPS counter
	fps.update()

# stop the timer and display FPS information
fps.stop()
print("[INFO] elapsed time: {:.2f}".format(fps.elapsed()))
print("[INFO] approx. FPS: {:.2f}".format(fps.fps()))

# do a bit of cleanup
cv2.destroyAllWindows()
vs.stop()

# python dogger.py --prototxt bvlc_googlenet.prototxt --model bvlc_googlenet.caffemodel --labels synset_words.txt
