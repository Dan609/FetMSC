# Replicative senescence in human embryo bone marrow MSCs is characterized by changes in cell motility and subcellular localization of Rac1 and RhoA GTPases

Correspondence: bobkov@incras.ru

Citation: Lukacheva A.V., Gorb A.I., Musorina A.S., Kriger D.V., Poljanskaya G.G., Bobkov D.E., Replicative senescence in human embryo bone marrow MSCs is characterized by changes in cell motility and subcellular localization of Rac1 and RhoA GTPases, Russian Journal of Bioorganic Chemistry, 2023, Vol. 59, Suppl. 1, pp. S224–S240. DOI: 10.1134/S106816202312018X



Data and scripts for FetMSC cells analysis:

1) Cell morphology analysis
Area.csv – cell area data measured at different passages in ImageJ
Roundness.csv – cell roundness

2) Actin cytoskeleton structure analysis
LCFD.csv – Local Connected Fractal Dimension measured in ImageJ FracLac plugin

4) Kendall's Tau-b colocalization coefficients calculated for RhoA and Rac-1 small GTPases co-localized with F-actin (stained with rhodamine-phalloidin) and with cell nuclei.
Rac1_F-Actin.csv 
Rac1_nucleus.csv
RhoA_F-Actin.csv
RhoA_nucleus.csv

5) FetMSC_/passage number/_motility_/serum percentage_/experimental condition/_*.csv – this files contain X-Y coordinates from cell 24h motility trackes, time step = 15 min, 1 px = 0.6525 microns

6) R scripts for cell motility analysis. To calculate the mobility parameters, put the track *.csv files in separate folders corresponding to each experimental point.

7) *.pzfx GraphPad Prism files with calculated motility data, statistical calculations and plots



