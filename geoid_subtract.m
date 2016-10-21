% This script is to calculate Titan's geoid defined in Iess et al. (2010)
% and subtract the geoid from topography.
% Subtracting an oblate spheroid from the topography can obtain the 
% geopotential surface.
% Reference: Iess, L., Rappaport, N. J., Jacobson, R. A., Racioppa, P.,
% Stevenson, D. J., Tortora, P., ... and Asmar, S. W. (2010). 
% Gravity field, shape, and moment of inertia of Titan. Science, 
% 327(5971), 1367-1369.
% This script was created by Zac Yung-Chun Liu; zacycliu@asu.edu
% Last modified 02/26/2016
clc
clear all
close all
% Load data
filename = 'sar_topo_T95.txt'; % <-----------------------------------------
[mData,delimiterOut] = importdata(filename);
vSize = size(mData);

for k = 1:vSize(1)
    lon(k) = mData(k,1);
    lat(k) = mData(k,2);
    z(k) = mData(k,3);
end

% Set up parameters a, b, c
% SOL1
a = 2575.239;
b = 2574.932;
c = 2574.829;

% SOL2
% a = 2574.969;
% b = 2574.662;
% c = 2574.559;

% Calculate geoid and subtract it from topography
for k = 1:vSize(1)
        r_geoid(k) = (a*b*c)/(((b*c*cosd(lat(k))*cosd(lon(k)))^2+ ...
            (c*a*cosd(lat(k))*sind(lon(k)))^2+(a*b*sind(lat(k)))^2)^0.5);
        r_geoid(k) = (r_geoid(k)-2575)*1000;
        r_geoid_subtract(k) = z(k) - r_geoid(k);
end

% Write data to a new txt file
Data_s = [lon; lat; r_geoid_subtract];
fid=fopen('sar_topo_T95_s.txt','w'); % <-----------------------------------
fprintf(fid, '%f %f %f \n', Data_s);
fclose(fid);