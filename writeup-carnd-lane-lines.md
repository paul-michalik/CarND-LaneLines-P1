# **Finding Lane Lines on the Road** 

---

**Finding Lane Lines on the Road**

The goals / steps of this project are the following:
* Make a pipeline that finds lane lines on the road
* Reflect on your work in a written report

---

### Reflection

### 1. Describe your pipeline. As part of the description, explain how you modified the draw_lines() function.
My pipeline consisted of 5 steps:
1. Converted the images to grayscale
2. Blurred the image by applying a Gaussian smoothing function
3. Applied the Canny edge detection algorithm
4. Masked the unimportant regions from the image
5. Apply the Hough transform and extracted candidate edges 
 In order to draw a single line on the left and right lanes, I modified the draw_lines() function as follows:
1. Filtered the set of candidate edges based on slope yielding two sets of edges representing fragments of the left and right lanes with negative and positive slopes. The values had to be non-zero and contained in a specified interval detected by experiment. Helper function separate_edges
2. Approximated the line segments by a polynomial applying a least square. Experimented with linear and quadratic polynomials. Helper functions unpack_lines, poly1d.
3. Determined the range for evaluation of the polynomial and extrapolated the curves representing the left and right lanes. After conversion to integers drew lines onto given image. Helper function draw_full_lanes

### 2. Identify potential shortcomings with your current pipeline
The performance of the algorithm depends on a set of parameters determined by experiments. However the data set for experimentation was quite limited as was the time to perform a more thorough analysis. Therefore I assume that the performance of this pipeline would be degrading if the data deviates from observed samples. The data set challenge.mp4 proves this assumption quite well.
The pipeline implementation does only rudimentary error handling and does not provide exception safety guarantees. Presumably, some parts of the implementation could have been done more “pythoniac” if I had more time to explore Python patterns and libraries.

### 3. Suggest possible improvements to your pipeline

A possible improvement would be to try to stabilize the edge extraction and filtering algorithm by using more intelligent filters. The simple slope based filter isn’t sufficient. This is particularly visible on the challenge test sequence in which many false positively detected edges arise from the sharp contrasts between shadow and sunny regions on the road. It would be advantageous to apply further filters to reduce contrasts in these regions yielding less edges.
Another category of improvements would be to track the detected lanes by incorporating some sort of prediction for the next frame(s) based on previous detections and verify the observation from Hough algorithm against these predictions. This could help to avoid outliers and physically infeasible changes in the detected lanes.

