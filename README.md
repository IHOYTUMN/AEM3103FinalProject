 # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Isaac Hoyt

  ## Summary of Findings


 
![Untitled drawing](https://github.com/IHOYTUMN/AEM3103FinalProject/assets/167821413/27f324bd-11f1-490f-8986-4f1147d796da)
"variations studied in a table"^

  In this study we investigated the effects of Initial velocity and Initial flight path angle on the flight profile of a paper airplane. Thanks to the plots, we were able to make a few notable observations. 
 
  From the first figure, we can see that initial velocity has a much greater effect on range compared to initial flight path angle. As seen in the lower section of fig.1, varying flight path angles tend to stablize rather quickly to the nominal value.

  From the second figure, we can see that the furthest flying simulations came from the black and cyan paths. Both black and cyan paths have a high initial velocity, the difference being the initial flight path angle. This again supports the idea that initial velocity is a more influential factor to range than initial path angle.

  From the third figure, we can see that both lines of fit tend to stablize towards a single value for vertical and horizontal velocity (about -0.6m/s and 3.5m/s respectively).

  Also in the third figure, we can see the 5th degree polynomial fit (blue) for d/dt of height ramps up towards the end of the time range. This is an inherent flaw for polynomial fits. Because of this error, we decided to also include a line representing the average values for the 100 trials. At a cursory glance, this seems to well represent the sample, however it's accuracy is outside the scope of this study.

 
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


