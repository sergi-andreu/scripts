import os
from glob import glob
dataP="L://Animesh/ChestX-ray14/"
imgs = glob(os.path.join(dataP+'images', "*.png")) #https://nihcc.app.box.com/v/ChestXray-NIHCC/file/221185642661
imgs[2]

import cv2
import matplotlib.pylab as plt
cvimg = cv2.imread(imgs[1000],1)
plt.imshow(cvimg)

import numpy as np
Xrays256 = np.array([cv2.resize(cv2.imread(img,0), (256, 256), interpolation = cv2.INTER_AREA)/255 for img in imgs[:]])
print(Xrays256.shape)

import pandas as pd
validation = pd.read_table(dataP+'labels/val_list.txt.sel', sep=' ', header=None, index_col=0)
train = pd.read_table(dataP+"labels/train_list.txt.sel", sep=' ',index_col=0,header=None)
test = pd.read_table(dataP+"labels/test_list.txt.sel", sep=' ',index_col=0,header=None)
print(validation, train, test)

#https://stanfordmlgroup.github.io/projects/chexnet/
pathology_list = ['Atelectasis','Cardiomegaly','Effusion','Infiltration','Mass','Nodule','Pneumonia','Pneumothorax','Consolidation','Edema','Emphysema','Fibrosis','Pleural_Thickening','Hernia']
print(len(pathology_list))
sample_labels=validation.append([train, test],ignore_index=True)
sample_labels.columns=pathology_list
print(sample_labels.shape)


import tensorflow as tf
learning = 0.01
epochs = 100
hidden_1 = 256
hidden_2 = 256
input = 256*256
classes = 14
print(learning,epochs,batch,step,hidden_1,hidden_2,input,classes)

X = tf.placeholder("float", [None, input])
Y = tf.placeholder("float", [None, classes])

weights = {
    'h1': tf.Variable(tf.random_normal([input, hidden_1])),
    'h2': tf.Variable(tf.random_normal([hidden_1, hidden_2])),
    'out': tf.Variable(tf.random_normal([hidden_2, classes]))
}
biases = {
    'b1': tf.Variable(tf.random_normal([hidden_1])),
    'b2': tf.Variable(tf.random_normal([hidden_2])),
    'out': tf.Variable(tf.random_normal([classes]))
}

def mlp(x):
    layer_1 = tf.add(tf.matmul(x, weights['h1']), biases['b1'])
    layer_2 = tf.add(tf.matmul(layer_1, weights['h2']), biases['b2'])
    out_layer = tf.matmul(layer_2, weights['out']) + biases['out']
    return out_layer

logits = mlp(X)

# Define loss and optimizer
loss_op = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(
    logits=logits, labels=Y))
optimizer = tf.train.AdamOptimizer(learning_rate=learning_rate)
train_op = optimizer.minimize(loss_op)
init = tf.global_variables_initializer()

with tf.Session() as sess:
    sess.run(init)
    for epoch in range(epochs):
        avg_cost = 0.
        sess.run([train_op, loss_op], feed_dict={X: Xrays256, Y: sample_labels})
        avg_cost += c / total_batch
        print("Epoch:", '%04d' % (epoch+1), "cost={:.9f}".format(avg_cost))

    pred = tf.nn.softmax(logits)  # Apply softmax to logits
    correct_prediction = tf.equal(tf.argmax(pred, 1), tf.argmax(Y, 1))
    # Calculate accuracy
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, "float"))
    print("Accuracy:", accuracy.eval({X: mnist.test.images, Y: mnist.test.labels}))