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

![Sample Test Run on a Simple Walk](https://github.com/courtneyzhan/particle-tracking/blob/efb734cdc936d3111685d07151339de462c7b49e/images/short_animation.mp4)