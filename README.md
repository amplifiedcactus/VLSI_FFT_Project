# VLSI_FFT_Project
    The implementation of an FFT (Fast Fourier Transform) system using the Radix-2 Cooley-Tukey
algorithm represents a significant leap forward in the realm of digital signal processing and
computational techniques. This algorithm efficiently transforms time-domain signals into the
frequency domain, dramatically reducing processing time and complexity, making it invaluable for
real-time applications such as telecommunications, audio signal processing, and image analysis.
Engaging in this project which is centered around the Radix-2 Cooley-Tukey FFT not only deepens
one’s understanding of advanced algorithms but will also enhances practical skills in HDL
programming, simulation, FPGA implementation, and debugging. These abilities are crucial for
career in Digital Design and Embedded System
    This project involves designing a 16-point Fast Fourier Transform (FFT) chip using a finite state
machine (FSM) for control. The core computation leverages a Radix-2 butterfly unit and performs
the computation in multiple stages. The chip will process 16-bit complex numbers, with 16 bits
dedicated to both the real and imaginary components. A 32-bit data bus will be used to transfer
one full complex number (real and imaginary) in a single clock cycle. The chip includes a 16-point
SRAM for storing input data and output results. A small cache will optimize access to intermediate
results during FFT computations, minimizing memory latency. The core FFT computations will be
performed by a Radix-2 butterfly unit. The FSM will control state transitions between input
loading, cache operations, FFT computation, and output stages. Peripheral components include
input/output interfaces, clock/reset logic, and control signals. The design ensures efficient data
flow and synchronization, making it suitable for digital signal processing (DSP) applications. This
architecture is optimized for simplicity, low power consumption, and performance in embedded
systems.