 # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Isaac Hoyt

  ## Summary of Findings
  <Show the variations studied in a table>

  Summarized what was accomplished in this study.  Describe 2-4 observations from simulating the flight path.
  Reference the figures below as needed.

  *If the analysis falls short of the goal, this is your chance to explain what was done or what were the barriers.*
 
  # Code Listing

  [Fig. 1](./caseA.m) Simulates and plots Figure 1

  [Fig. 2](./caseB.m) Simulates and plots Figure 2

  [Fig. 3](./derivatives.m) Performs derivative calculations and plots Figure 3

  # Figures

  ## Fig. 1: Single Parameter Variation

![image](https://github.com/IHOYTUMN/AEM3103FinalProject/assets/167821413/605d2810-0476-4ae4-bb66-926a1b801aad)

In this figure you see two sets of three simulations. The first set shows a standard flight profile with three simulations run with the nominal, and lower and higher initial values of initial velocity (shown in black, red and green respectively).
The second set shows a similar procedure this time modifying the initial flight path angle.



  ## Fig. 2: Monte Carlo Simulation

  ![image](https://github.com/IHOYTUMN/AEM3103FinalProject/assets/167821413/93c1d9fa-f4d8-4b3e-b307-4d415801048e)

This figure shows a randomly produced set of 100 flight profiles, where each had a randomized initial velocity and initial flight path angle. The initial values of the two variables are associated with the color of each individual trial, as described in the legend. (where V is velocity and Gam is the flight path angle gamma).

Overlaid on top of the simulations is a 5th degree line of fit for the 100 flights (yellow) and an average (by time) flight path (magenta).

 ## Fig. 3: Time Derivatives
 <Time-derivative of height and range for the fitted trajectory>
  
![image](https://github.com/IHOYTUMN/AEM3103FinalProject/assets/167821413/a38604e4-f084-433b-ac6e-3af996e1c03b)

This figure shows the time derivative of the Height and Range of the two lines of fit seen in Fig. 2. The Red line (formerly magenta) is the average fit, the Blue line (formerly yellow) is the 5th degree polynomial fit.


