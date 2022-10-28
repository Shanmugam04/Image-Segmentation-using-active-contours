# Image-Segmentation-using-active-contours
INTRODUCTION

In this Project I am trying to implement active contours algorithm for character segmentation. Generally active contours are used in the medical field to segement any desired part X-Ray or CEG. Since most of the desired part of these images are smooth we get a very accurate segemented output which is used for other downstream tasks. However, I tried to implement the same algorithm to see how this algorithm works for images have sharp edges. 

HOW DOES IT WORK

The algorithm works by creating a initial contour around the segmentation part with the users help. It iteratively deforms the initial contour so that it is closer to pixel with higher gradient. In order to make the contour latch itself onto the sgementation part, we perform gradient magnitude square of that part, and blur it so that it acts as a force field on the contour, and the contour latches itself into the boundry, this is called the image energy. However, since this is a greedy algorithm we apply some constraints to it which makes it act in two ways:-
  1. It can act like a elastic rubber band and smooth to make it fit the shape of the object
  2. We can also make it act like a baloon where the inital contour is blown like a baloon.
  
These are basically the internal bending energy of the contour. Therefore, we calculate the bending energy of the contour which is the elastic and smoothness of the contour, and add it with the image energy, to get the total energy. This is the general idea of how the contour works.

WHAT THIS PROJECT REPOSITORY CONTAINS

The GUI image file is the simple GUI I created using MATLAB, where browse and display button is used to add the path of the image from our local computer to the text field and the segment button us used to perform the segmentation task, i.e., perform the active contour algorithm. The MATLAB files contains the code for the algorithm.
