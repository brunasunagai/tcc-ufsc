# Dictionary
Definitions of techniques, procedures and theories I have learned during my studies. 

**P**
##### <span style="color:green"> - Padding </span>
Multiplication in the frequecy domain corresponds with circular convolution in the spatial domain. This means that without padding the image properly, results from one side of the image will wrap around to the other side of the image. It would **affect the edges** of the window being convolutioned. 
*Zero-padding* allows space for this wrap-around to occur without contaminating actual output pixels.
*Mirrorring-padding* could be used to minimize the transient introduced by the 0-area. 
This technique is also a way to prevent the image from being cut so the image size stays the same as before the filter was applied.
I used this formula to calculate padding size: PADDING = math.ceil((TAPS-1)/2)