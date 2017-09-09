from __future__ import print_function

import os
import numpy as np

from skimage.io import imsave, imread

data_path = 'raw/'

image_rows = 512
image_cols = 512

def create_train_data():
    train_data_path = os.path.join(data_path, 'train')
    images = os.listdir(train_data_path)
    total = len(images) / 2

    imgs = np.ndarray((total, image_rows, image_cols), dtype=np.uint8)
    imgs_mask = np.ndarray((total, image_rows, image_cols), dtype=np.uint8)
