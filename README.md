# titan-topography-sar
Calculate the geoid of Saturn's moon Titan, defined in Iess et al. (2010) and subtract the geoid from topography data (Cassini SARTopo).
Iess et al. (2010) showed that Titan's gravity field is consistent with a hydrostatically relaxed body shaped by tidal and rotational effects, making it slightly oblate. Subtracting an oblate spheroid from the topography can obtain the geopotential surface.

Reference: Iess, L., Rappaport, N. J., Jacobson, R. A., Racioppa, P., Stevenson, D. J., Tortora, P., ... and Asmar, S. W. (2010). Gravity field, shape, and moment of inertia of Titan. Science, 327(5971), 1367-1369.

MATLAB scripts:
geoid.m: calculate and plot geoid based on the note #5 equation in Iess et al. (2010) paper
geoid.png: output image from executing geoid.m
geoid_subtract.m: calculate geoid and subtract it from Cassini SARTopo data; save the processed topography data as sar_topo_Txx_s.txt format

Note: Cassini SARTopo datasets need to be converted to .txt format before importing. Only X, Y, Z columns are needed.
