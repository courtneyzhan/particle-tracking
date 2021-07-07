import numpy as np
import matplotlib.pyplot as plt
import sys

np.set_printoptions(threshold=sys.maxsize)

# A_flat = np.array([0,1,2,3,4,5,6,7,8,9,10,11])
# A = np.reshape(A_flat, (3,2,-1))
#
# #this WORKS:
# B = np.pad(A, ((1,1),(1,1),(1,1)), mode='constant')
#
# print(A)
#
# print(B)
# # # this DOES NOT WORK:
# # C = np.pad(B, ((-1,1),(1,1),(1,1)), mode='constant')
#
# C = np.pad(B, ((0,1),(1,1),(1,1)), mode='constant')[1:,...]
# print(C)
#
# C = B[1:-1, 1:-1, 1:-1]
# print(C)

from matplotlib import image
from random import randint 

max_width = 101

C = [] # 57x57
# random range is 0-44
for i in range(600, 605):
    img_data = image.imread('/Users/zhimin/Courtney/winter_research/data/dataset/image' + str(i) + '.jpg')
    # print(img_data)
    C = img_data[22:-22, 22:-22]
# print(C)
    plt.imshow(np.squeeze(C), cmap='gray')
    rand_x = randint(0, 44)
    rand_y = randint(0, 44)
    
    D = np.pad(C, ((rand_x, max_width - 44 - rand_x), (rand_y, max_width - 44 - rand_y)), 'constant')
    plt.imshow(np.squeeze(D), cmap='gray')
    plt.show()
print(C.shape)
# And now I need to pad 
# Generate 2 random numbers rand_x, rand_y
# pad ((rand_x, max - width - rand_x), (rand_y, max - width - rand_y))
