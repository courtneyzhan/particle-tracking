# Particle-Tracking
A part of UQ's Winter Research Program 2021, __Machine Learning of Biological Swimmers__.
Undertaken from 21-Jun-2021 to 23-Jul-2021, supervised by Dr Alex Stilgoe.

# Full Summary of Work
[Notion Progress](https://courtneyzhan.notion.site/Winter-Research-Program-Update-c8dee9e6c5d94b8d9a0744a3be407cd2)

## Image Generation
Using MATLAB under `attic/`, synthetic images of particles are generated alongside a labelled dataset. An example run of the MATLAB files are under `data.zip`. 

## Models Used
Three single-output CNNs based off [DeepTrack 2.0's framework](https://github.com/softmatterlab/DeepTrack-2.0) were used to predict the angle and x- and y-coordinates of particles.  

![Sample Image Output. Predicted (red) against gold standard (yellow) coordinate and angles](https://raw.githubusercontent.com/courtneyzhan/particle-tracking/main/images/file043.png)  
Sample Image Output. Predicted (red) against gold standard (yellow) coordinate and angles. 

https://user-images.githubusercontent.com/18273126/126738447-f3ae449e-49a0-44d3-b316-a426b206972c.mp4

Short Animation of Model Predictions (red) against gold standard (yellow) for a simple walk.  
