import numpy as np
import random
import cv2

def sp_noise(image,prob):
    '''
    Add salt and pepper noise to image
    prob: Probability of the noise
    '''
    output = np.zeros(image.shape,np.uint8)
    thres = 1 - prob 
    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            rdn = random.random()
            if rdn < prob:
                output[i][j] = 0
            elif rdn > thres:
                output[i][j] = 255
            else:
                output[i][j] = image[i][j]
    return output


file_number = 1
probability = 0.1 # increase for more noise

# for file_number in range(1, 1001): # loop here to do all images
image = cv2.imread('data/dataset/image' + str(file_number) + '.jpg',0) 
noise_img = sp_noise(image, probability)
cv2.imwrite('noise' + str(file_number) + '.jpg', noise_img)