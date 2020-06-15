import tensorflow as tf

from tensorflow.keras import datasets, layers, models
import matplotlib.pyplot as plt
import numpy as np
import glob, re

classes = []
samples = {}

for dataset in glob.glob("dataset/*.npy"):
    class_name = re.search('.*?full_numpy_bitmap_(.*).npy', dataset)
    if class_name:
        name = class_name.group(1)
        samples[name] = np.load(dataset)
        classes.append(name)

NUM_CLASSES = len(classes)

x_data = []
y_data = []

for i, name in enumerate(classes):
    x_data.append(samples[name])
    y = np.zeros((NUM_CLASSES, samples[name].shape[1]))
    y[:,i] = 1
    y_data.append(y)

