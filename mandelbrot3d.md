# Mandelbrot 3D

## 2D Mandelbrot

$$\begin{aligned}
\mathbf{z}_{i+1} &= (x + y\ \mathbf{e}_1)^2  + \mathbf{c}\\
&= x^2 + xy\ \mathbf{e}_{1} + xy\ \mathbf{e}_{1} + y^2\ \mathbf{e}_{22} + \mathbf{c}\\
&= x^2 - y^2 + 2xy\ \mathbf{e}_{1} + \mathbf{c}
\end{aligned}$$

More generalized:

$$\begin{aligned}
\mathbf{z}_{i+1} &= A (x + y\ \mathbf{e}_1)^2 + B (x + y \mathbf{e}_1) + \mathbf{c}\\
&= A (x^2 + xy\ \mathbf{e}_{1} + xy\ \mathbf{e}_{1} + y^2\ \mathbf{e}_{22} ) + B(x + y\ \mathbf{e}_1) + \mathbf{c} \\
&= A (x^2 - y^2 + 2xy\ \mathbf{e}_{1}) + B (x + y\ \mathbf{e}_1) + \mathbf{c}
\end{aligned}$$

## 3D Mandelbrot

$$\begin{aligned}
\mathbf{z}^2 &= (x\mathbf{e}_1 + y\mathbf{e}_2 + z\mathbf{e}_3)^2 \\
&= x^2\mathbf{e}_{11} + xy\mathbf{e}_{12} + xz\mathbf{e}_{13} + xy\mathbf{e}_{21} + y^2\mathbf{e}_{22} + yz\mathbf{e}_{23} + xz\mathbf{e}_{13} + yz\mathbf{e}_{23} + z^2\mathbf{e}_{33} \\
&= x^2\mathbf{e}_{11} + x^2\mathbf{e}_{22} + x^2\mathbf{e}_{33} + 2xy \mathbf{e}_{12}
\end{aligned}$$