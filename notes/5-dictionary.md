# Dictionary
Definitions of techniques, procedures and theories I have learned during my studies. 

**B**
## <span style="color:lightgreen"> - Block partitioning for VVC </span>
(From *Block Partitioning Strutucture in the VVC Standard* pdf)
For **inter prediction** CUs, PUs and TUs are completely decoupled and can be independently chosen by an encoder.
For **intra prediction** CUs, it does not happen because no PB boundaries can appear inside any TB. 
- Coding tree unit (**CTU**) = the basic compression unit. 
  - Each CTU contains: 1 luma CTB + 2 chroma CTBs. 
  - The size is specified in the sequence parameter set (SPS) as 64x64, 32x32 or 16x16 in units of luma samples. 
  - Smaller CTU sizes can reduce ecoding complexity.
- Quartenary tree (**QT**) = a recursive QT split can may be applied to a CTU. If the encoder decides to split, the QT node is further divided into 4 square child QT nodes of equal size.
- Coding unit (**CU**) = every CTU is either treated as one CU or split into multiple CUs.
  - Sizes: 64x64, 32x32, 16x16 or 8x8.
- Coding tree block (**CTB**) = 
- Macroblock = 16 x 16 (pixels? sub-blocks?)
- Prediction units (**PU**) = the basic unit for prediction within a CU.
  - Each CU can be either treated as one PU or further divided into multiple PUs.
  - Only one type of prediction process can be applied inside each PU.
  - One PU contains: 1 luma PB + 2 chroma PB.
- Prediction block (**PB**) = sub-division for PU categorized into luma and chroma. 
- Transform unit (**TU**) = it is the basic unit for performing transform, quantization and residual coding. 
  - Each CU can be either treated as one TU or further divided into multiple TUs. 
  - Similar to the CTU, a recursive QT split may be applied to the TU. In this case, the latter QT split is often called RQT.
  - One TU contains: 1 luma TB + 2 chroma TB. 
- Residual quartenary tree (**RQT**) = at each RQT node, an encoder can select either non-split or split. If the encoder decides to split, the RQT is further divided into 4 square child of equal sizes.
- Transform block (**TB**) = is the subdivision of a TU and can be a luma or chroma TU. 

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