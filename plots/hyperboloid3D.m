% MATLAB Script to Plot a 3D Hyperboloid
% Author: Jackson Saunders
% Date: 7/14/24

% Clear variables and close figures
clear all; close all; clc;

%% ================== Important Parameters (Edit these to define your hyperboloid) ==================

% Method selection (Uncomment the method you want to use)
method = 'one_sheet';
% method = 'two_sheets';

% Parameters for Hyperboloid
a = 5;          % Semi-axis length along x-axis
b = 3;          % Semi-axis length along y-axis
c = 4;          % Semi-axis length along z-axis

% Grid size for plotting
gridSize = 50;  % Adjust the density of the grid

% Range for x and y (adjust if necessary)
x_min = -10; x_max = 10;
y_min = -10; y_max = 10;

%% =============================== Plotting the Hyperboloid =========================================

switch method
    case 'one_sheet'
        % ----- Hyperboloid of One Sheet -----
        % Equation: (x^2)/(a^2) + (y^2)/(b^2) - (z^2)/(c^2) = 1
        % We will solve for z
        
        % Create a grid of x and y
        x = linspace(x_min, x_max, gridSize);
        y = linspace(y_min, y_max, gridSize);
        [X, Y] = meshgrid(x, y);
        
        % Calculate Z squared
        Z_squared = ((X.^2)/(a^2) + (Y.^2)/(b^2) - 1) * c^2;
        
        % Only keep real values where Z_squared >= 0
        valid = Z_squared >= 0;
        
        % Calculate Z (positive and negative roots)
        Z_pos = sqrt(Z_squared);
        Z_neg = -sqrt(Z_squared);
        
        % Set invalid points to NaN for plotting
        Z_pos(~valid) = NaN;
        Z_neg(~valid) = NaN;
        
        % Plotting
        figure;
        surf(X, Y, Z_pos);
        hold on;
        surf(X, Y, Z_neg);
        hold off;
        title('Hyperboloid of One Sheet: (x^2)/(a^2) + (y^2)/(b^2) - (z^2)/(c^2) = 1');
        
    case 'two_sheets'
        % ----- Hyperboloid of Two Sheets -----
        % Equation: (x^2)/(a^2) + (y^2)/(b^2) - (z^2)/(c^2) = -1
        % We will solve for z
        
        % Create a grid of x and y
        x = linspace(x_min, x_max, gridSize);
        y = linspace(y_min, y_max, gridSize);
        [X, Y] = meshgrid(x, y);
        
        % Calculate Z squared
        Z_squared = ((X.^2)/(a^2) + (Y.^2)/(b^2) + 1) * c^2;
        
        % Only keep real values where Z_squared >= 0
        valid = Z_squared >= 0;
        
        % Calculate Z (positive and negative roots)
        Z_pos = sqrt(Z_squared);
        Z_neg = -sqrt(Z_squared);
        
        % Set invalid points to NaN for plotting
        Z_pos(~valid) = NaN;
        Z_neg(~valid) = NaN;
        
        % Plotting
        figure;
        surf(X, Y, Z_pos);
        hold on;
        surf(X, Y, Z_neg);
        hold off;
        title('Hyperboloid of Two Sheets: (x^2)/(a^2) + (y^2)/(b^2) - (z^2)/(c^2) = -1');
        
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
