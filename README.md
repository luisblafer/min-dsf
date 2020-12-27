# Métodos de Integración Numérica

Repositorio con el código fuente del proyecto en Matlab y Simulink para el práctico de Métodos de Integración Numérica.


<!-- GETTING STARTED -->
## Inicio Rápido

1. Clonar el repositorio

   ```sh
   git clone https://github.com/luisblafer/min-dsf.git
   ```

2. Ejecutar en Matlab los scripts que resuelven los ejercicios.  

---  

<!-- MATLAB -->
### Simulaciones en Matlab

#### Métodos de Paso Fijo

* `DSF_TP0_S21_EULER` - Simulación circuito RL con Método de Euler.
* `DSF_TP0_S22_HEUN` - Simulación circuito RL con Método de Heun.
* `DSF_TP0_S23_BACK` - Simulación circuito RL con Método de Backward Euler.

##### Extra

* `DSF_TP0_S2C_ERROR` - Comparación de errores de los métodos


#### Métodos de Paso Fijo Generalizados

* `DSF_TP0_S24` - Simulación del circuito RL empleando los métodos de Euler y Heun.


<!-- SIMULINK -->
### Simulaciones en Simulink

#### Péndulo con Fricción

* `DSF_TP0_S31_FIXED` - Simulación del péndulo empleando los métodos de Euler y Heun.
* `DSF_TP0_S32_ODE45` - Simulación del péndulo con el Método de Dormand-Prince (ode45).
* `DSF_TP0_S32_ODE45_DECIMADO` - Simulación del péndulo con el Método de Dormand-Prince (ode45) | _Refinamiento 1:3_.
* `DSF_TP0_S32_ODE15s` - Simulación del péndulo con el Método de NDF (ode15s).


#### Circuito RLC Stiff

* `DSF_TP0_S332_ODE45` - Simulación del sistema stiff con el Método de Dormand-Prince (ode45).
* `DSF_TP0_S333_ODE15s` - Simulación del sistema stiff con el Método NDF (ode15s).



<!-- CONTACT -->
## Contacto

Luis Fernandez Blanco - [@luisblafer](https://twitter.com/luisblafer)

Link del Proyecto: [https://github.com/luisblafer/min-dsf](https://github.com/luisblafer/min-dsf)
