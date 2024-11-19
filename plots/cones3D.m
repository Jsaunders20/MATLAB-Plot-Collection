% MATLAB Script to Plot a 3D Cone Using Various Definitions
% Author: Jackson Saunders
% Date: 7/13/24

% Clear variables and close figures
clear all; close all; clc;

%% ================== Important Parameters (Edit these to define your cone) ==================

% Method selection (Uncomment the method you want to use)
% method = 'circular';
method = 'elliptical';

% Parameters for Circular Cone
z_min = -10; z_max = 10;     % Range for z-axis

% Parameters for Elliptical Cone
a = 5;                       % Semi-major axis length at base
b = 3;                       % Semi-minor axis length at base
c = 10;                      % Height parameter in (z^2)/(c^2) = (x^2)/(a^2) + (y^2)/(b^2)

% Grid size for plotting
gridSize = 50;               % Adjust the density of the grid

%% =============================== Plotting the Cone =========================================

switch method
    case 'circular'
        % ----- Circular Cone -----
        % Equation: z^2 = x^2 + y^2
        % Parameterization:
        % x = z * cos(theta)
        % y = z * sin(theta)
        % z from z_min to z_max

        % Create a grid of theta and z
        theta = linspace(0, 2*pi, gridSize);
        z = linspace(z_min, z_max, gridSize);
        [Theta, Z] = meshgrid(theta, z);

        % Calculate X, Y
        X = Z .* cos(Theta);
        Y = Z .* sin(Theta);

        % Plotting
        surf(X, Y, Z);
        title('Circular Cone: z^2 = x^2 + y^2');

    case 'elliptical'
        % ----- Elliptical Cone -----
        % Equation: (z^2)/(c^2) = (x^2)/(a^2) + (y^2)/(b^2)
        % Parameterization:
        % x = (z / c) * a * cos(theta)
        % y = (z / c) * b * sin(theta)
        % z from -c to c

        % Create a grid of theta and z
        theta = linspace(0, 2*pi, gridSize);
        z = linspace(-c, c, gridSize);
        [Theta, Z] = meshgrid(theta, z);

        % Calculate X, Y
        X = (Z / c) * a .* cos(Theta);
        Y = (Z / c) * b .* sin(Theta);

        % Plotting
        surf(X, Y, Z);
        title('Elliptical Cone: (z^2)/(c^2) = (x^2)/(a^2) + (y^2)/(b^2)');

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
