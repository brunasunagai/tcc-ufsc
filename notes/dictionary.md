# Dictionary
Definitions of techniques, procedures and theories I have learned during my studies. 

**F**
## <span style="color:lightgreen"> - Finite Impulse Response (FIR) </span>
(From ChatGPT) FIR (Finite Impulse Response) filters are a type of digital filter that are used to process signals in a wide range of applications such as audio, image processing, and telecommunications. These filters are characterized by their finite impulse response, which means that the output of the filter is based on a finite number of past inputs (impulses).

An FIR filter consists of a number of coefficients or weights, which are used to multiply the input signal samples. The multiplied samples are then summed together to produce the output signal. The coefficients are determined by the desired frequency response of the filter.

The main advantage of FIR filters is that they have a linear phase response, which means that the phase distortion introduced by the filter is constant across all frequencies. This makes FIR filters well suited for applications where phase distortion is a concern, such as audio processing. Additionally, FIR filters are relatively easy to design and implement, and they can be made to have very specific frequency responses.

On the other hand, FIR filters have a limitation of requiring more coefficients than IIR (Infinite Impulse Response) filters for a similar frequency response and are less efficient in terms of computation.

**P**
## <span style="color:lightgreen"> - Padding </span>
Multiplication in the frequecy domain corresponds with circular convolution in the spatial domain. This means that without padding the image properly, results from one side of the image will wrap around to the other side of the image. It would **affect the edges** of the window being convolutioned. 
*Zero-padding* allows space for this wrap-around to occur without contaminating actual output pixels.
*Mirrorring-padding* could be used to minimize the transient introduced by the 0-area. 
This technique is also a way to prevent the image from being cut so the image size stays the same as before the filter was applied.
I used this formula to calculate padding size: PADDING = math.ceil((TAPS-1)/2)