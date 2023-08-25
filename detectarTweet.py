from numpy import asarray
from PIL import Image
from sklearn.metrics import classification_report, confusion_matrix
import random
from tensorflow.python.keras.utils.np_utils import to_categorical
import numpy as np
import pandas as pd
from tensorflow.python import keras
from tensorflow.python.keras.models import Sequential
from tensorflow.python.keras.layers import Dense, Flatten, Conv2D, Dropout
from keras.preprocessing.image import ImageDataGenerator
from matplotlib import pyplot as plt
import matplotlib.image as mpimg

train = pd.read_csv('train_limpios.csv')
test = pd.read_csv('test_limpios.csv')
xTrain = train.fillna(0)
xTest = test.fillna(0)


yTrain = (xTrain['target'].values.tolist())
del xTrain['target']

xTrain = xTrain.values.tolist()
xTest = xTest.values.tolist()


# model = Sequential()
# model.add(Dense(12, input_shape=(4,), activation='relu'))
# model.add(Dense(8, activation='relu'))
# model.add(Dense(1, activation='softmax'))
# model.compile(loss=keras.losses.categorical_crossentropy,
#               optimizer='adam', metrics=['accuracy'])

# model.fit(xTrain, yTrain, steps_per_epoch=500, epochs=20)

model = Sequential()

model.add(Dense(12, input_shape=(4,), activation='relu'))
model.add(Dense(8, activation='relu'))
model.add(Dense(1, activation='softmax'))
# model.add(Conv2D(20, kernel_size=(1, 1),
#           activation='relu'))

# model.add(Conv2D(20, kernel_size=(1, 1), activation='relu'))
# model.add(Dropout(.25))
# model.add(Conv2D(20, kernel_size=(1, 1), activation='relu'))
# model.add(Conv2D(20, kernel_size=(1, 1), activation='relu'))
# model.add(Dropout(.25))
# model.add(Flatten())
# model.add(Dense(10, activation='softmax'))

model.compile(loss='binary_crossentropy',
              optimizer='adam', metrics=['accuracy'])

model.fit(xTrain, yTrain, epochs=150, batch_size=10)


# model.add(Conv2D(20, kernel_size=(1, 1), activation='relu'))
# model.add(Dropout(.25))
# model.add(Conv2D(20, kernel_size=(1, 1), activation='relu'))
# model.add(Conv2D(20, kernel_size=(1, 1), activation='relu'))
# model.add(Dropout(.25))
# model.add(Flatten())
# model.add(Dense(10, activation='softmax'))

# model.compile(loss=keras.losses.categorical_crossentropy,
#               optimizer='adam', metrics=['accuracy'])

# model.fit(xTrain, yTrain, steps_per_epoch=500, epochs=20)
