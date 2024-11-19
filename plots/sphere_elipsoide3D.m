% MATLAB Script to Plot a 3D Sphere or Ellipsoid
% Author: Jackson Saunders
% Date: 7/13/24

% Clear variables and close figures
clear all; close all; clc;

%% ================== Important Parameters (Edit these to define your sphere or ellipsoid) ==================

% Method selection (Uncomment the method you want to use)
method = 'sphere';
% method = 'ellipsoid';

% Parameters for Sphere
r = 5;                      % Radius of the sphere

% Parameters for Ellipsoid
a = 5;                      % Semi-axis length along x
b = 3;                      % Semi-axis length along y
c = 2;                      % Semi-axis length along z

% Grid size for plotting
gridSize = 50;              % Adjust the density of the grid

%% =============================== Plotting the Sphere or Ellipsoid =========================================

% Create a grid of spherical coordinates
theta = linspace(0, 2*pi, gridSize);   % Azimuthal angle
phi = linspace(0, pi, gridSize);       % Polar angle
[Theta, Phi] = meshgrid(theta, phi);

switch method
    case 'sphere'
        % ----- Standard Sphere -----
        % Equation: x^2 + y^2 + z^2 = r^2
        % Parameterization:
        % x = r * sin(phi) * cos(theta)
        % y = r * sin(phi) * sin(theta)
        % z = r * cos(phi)
        
        % Calculate X, Y, Z
        X = r * sin(Phi) .* cos(Theta);
        Y = r * sin(Phi) .* sin(Theta);
        Z = r * cos(Phi);
        
        % Plotting
        surf(X, Y, Z);
        title(['Sphere: x^2 + y^2 + z^2 = ', num2str(r^2)]);
        
    case 'ellipsoid'
        % ----- Ellipsoid -----
        % Equation: (x^2)/(a^2) + (y^2)/(b^2) + (z^2)/(c^2) = 1
        % Parameterization:
        % x = a * sin(phi) * cos(theta)
        % y = b * sin(phi) * sin(theta)
        % z = c * cos(phi)
        
        % Calculate X, Y, Z
        X = a * sin(Phi) .* cos(Theta);
        Y = b * sin(Phi) .* sin(Theta);
        Z = c * cos(Phi);
        
        % Plotting
        surf(X, Y, Z);
        title('Ellipsoid: (x^2)/(a^2) + (y^2)/(b^2) + (z^2)/(c^2) = 1');
        
    otherwise
        error('Invalid method selected.');
end

% ----- Enhance Plot Appearance -----
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
axis equal;
grid on;
shading interp;
colormap jet;
colorbar;

% ----- Adjust View -----
view(3);  % 3D view
