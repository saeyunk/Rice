PRESENT AND FUTURE MERCURY CONCENTRATIONS IN CHINESE RICE: INSIGHTS FROM MODELING

Developer & corresponding author: Sae Yun Kwon (saeyunk@mit.edu)


Background information

The rice paddy biogeochemical cycle model for mercury is used to simulate sources, biogeochemical processes, and fate of mercury in rice paddies and to assess uncertainties in simulated processes. The rice paddy model takes atmospheric mercury deposition, simulated from a global atmospheric-chemistry-transport model (GEOS-Chem), and soil and irrigable surface water mercury concentrations from literature. Atmospheric deposition assumes input of only inorganic mercury (IHg). Irrigation assumes input of both IHg and methyl mercury (MeHg). Mercury transfer between the model reservoirs and biogeochemical rates within individual reservoirs are based on first-order differential equations. We simulate IHg and MeHg separately. 

The overall structure of the rice paddy model is illustrated in Figure 2. Table 1 summarizes all the mercury inputs and rate coefficients implemented in the rice paddy model as well as uncertainty ranges from literature.


Rice paddy model codes

The rice paddy biogeochemical cycle model for mercury consists of two sets of MATLAB scripts (shown below).
The model uses MATLAB ODE15s solver to solve first-order differential equations.

dY/dt (mercury flux in kg/year or kg/month) = k (rate coefficient in 1/year or 1/month) x y (IHg or MeHg mass in kg)

The ks implemented in the model are listed in the MATLAB scripts and the associated uncertainty ranges are shown in Table 1 of the manuscript. The ks are set as time-invariant parameters. Both the ys and dY/dt are time-variant parameters and are solved by MATLAB ODE15s. The initial ys and time spans are assigned in the run files of the MATLAB scripts (run_riceboxmodel.m & run_monthly.m).

The model has a total Chinese rice paddy area of 30 x 10^4 km^2. Steady-state mercury masses shown in Figure 2 are scaled down to 1 ha of Chinese rice paddy area. Note that mercury masses in rice plants are converted to mercury concentrations in rice grain using the information described in the manuscript (section 2.3).


1) Model calibration: riceboxmodel.m & run_riceboxmodel.m

These scripts are used for model calibration.
The model begins at low mercury concentrations and runs forward in time to reach steady-state under present-day mercury inputs.

Parameters:
k = rate coefficient (1/year)
y = IIHg or MeHg masses in reservoirs (kg)
t = time in years
dY/dt = IHg or MeHg fluxes (kg/yr)
m = MeHg
i = IHg

riceboxmodel.m contains 
1) the list of ks used in the model
2) defines ys
3) the list of differential equations
4) present-day IHg and MeHg inputs. These values are assigned in the differential equations and held constant for each time step until reaching steady-state.

run_riceboxmodel.m is used to run the model forward in time and contains
1) initial mercury masses (y0)
2) sets time span
3) calls for ODE15s solver
4) codes to plot figures (time vs mercury masses in individual reservoirs)


2) Dynamic run: monthlyrice.m & run_monthlyrice.m

These codes are used to run the model dynamically for 5 months, evaluate the model, and conduct sensitivity analyses as discussed in the manuscript. 
The model beings at steady-state and runs forward in time for 5 months.

Parameters:
k = rate coefficient (1/month)
y = IIHg or MeHg masses in reservoirs (kg)
t = time in months
dY/dt = IHg or MeHg fluxes (kg/month)
m = MeHg
i = IHg

monthlyrice.m contains
1) the list of ks used in the model
2) defines ys
3) the list of differential equations
4) present-day IHg and MeHg inputs. These values are assigned in the differential equations and held constant for each time step. 

run_monthlyrice.m is used to run the model forward in time and contains
1) initial mercury masses (y0)
2) sets time span
3) calls for ODE15S solver
4) codes to plot figures (time vs mercury masses in individual reservoirs)

**In the case of the dynamics runs, mercury inputs (in differential equations) and soil mercury concentrations (in y0) are adjustable depending on the types of experiments that users wish to perform.
