# DSO
# Deep Sleep Optimizer

In this project, a novel human-based optimizer, Deep Sleep Optimizer (DSO) is developed. DSO mimics the sleeping patterns of humans to solve optimisation problems. The DSO is modelled on the rise and fall of homeostatic pressure during the human sleep process. Human sleep is often modelled on the four sleep stages and the deep
sleep stage is employed in this work. The mathematical model of sleep homeostatic pressure is employed to simulate and determine the deep sleep state. The performance of DSO is demonstrated by employing 23 traditional functions (i.e., unimodal, multimodal, and fixed multi-modal functions), six composite functions, three engineering design problems, and a set of NP-Hard problems such as Travelling Salesman Problem and Knapsack problems. Additionally, the performance is evaluated in terms of accuracy, computational running time, the Wilcoxon rank sum, and the Friedman test. Lastly, the DSO is compared with 11 other metaheuristics, including GA, PSO, TLBO, and GWO. The DSO fares comparably well and, in most instances, it outperforms other metaheuristics.

# Main Paper
The codes herein are applicable to the manuscript titled: The Deep Sleep Optimiser: A Human-Based Metaheuristic Approach, IEEE ACCESS 2023


#  DSO Algorithm
DSO algorithm is located in the DSO_TPM_v7.m script. It is based on the Two-Process approach. It has 6 inputs, namely: the objective function, Lower Bounds, Upper Bounds, dimension of the decision variables, number of search agents, and the number of run times.

# Inputs
The major inputs of DSO are the objective function to be optimized and the respective constraints. The objective function and the constraints are stated in the myFitn.m script. In the case of TSP, the objective function are loaded as separate scripts which may contain the cooordinates of the locations/points or a distance matrix.

# Outputs
The key outputs are the values of the decision variables, convergence curves, cost function, or the path cost and path for TSP. The convergence curves and path are in graphical format. Though the convergence curves may be suppressed as the case may be.

# Parameters
The parameters herein are categorised into two:  1. Problems params which are the 6 inputs of DSO, and 2. DSO Tuning params.

DSO Tuning Params are:
- Minimum inital homeostatic value of search space, H0_minus
- Maximum inital homeostatic value of search space, H0_plus
- Circadian cost per unit fuction, a
- Sleep power index, xs
- Wake power index, xw
- Maximum sleep duration of agent, T

# Requirements
The following are the requirements of DSO
- MATLAB 2016a and later versions
- 8GB RAM size
- 256GB Hard disk size
- CPU
The size of DSO_TPM_v7.m script is about 5KB and the myFitn.m script is about 1KB depending on the objective functions and constraints.

# Design Flow
After setting the parameters of DSO, the design flow is summarised as follows:
 - Set the minimum and maximum homeostatic value threshold.
 - Randomly select an asymptote homeostatic value within the minimum and maximum homeostatic values.
 - Determine the candidate solution based on the asymptote value and best solution.
 - Compute candidate solution based on sleep-wake cycle.
 - Bound candidate solution wrt lower and upper bounds of the decision variables.

# How to use
- Stete the objective function and constraints in myFitn.m scripts
- Go to the DSO_TPM_v7.m script and change the DSO tuning params if you so desire. The params are at default values.
- Go to the main.m script and set the number of search agents, max. number of iterations, Monte Carlo runs, dimension of the problem.
- Run the main script.


# Authors and Contributors
- Sunday O. Oladejo: School for Data Science and Computational Thinking, University of Stellenbosch, Stellenbosch, South Africa (e-mail: sunday@sun.ac.za)
- Stephen O. Ekwe:  Department of Electrical Engineering, University of Cape Town, Cape Town, South Africa (e-mail: ekwste001@myuct.ac.za)
- Lateef A. Akinyemi: Department of Electronic and Computer Engineering, Lagos State University, Epe, Nigeria (e-mail: lateef.akinyemi@lasu.edu.ng) 
- Seyedali A. Mirjalili: 4Centre for Artificial Intelligence Research and Optimisation, Torrens University Australia, Fortitude Valley, Brisbane, QLD 4006, Australia (e-mail: ali.mirjalili@torrens.edu.au)
