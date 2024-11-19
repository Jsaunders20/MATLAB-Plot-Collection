clear;

% Define the parameters
t = linspace(0, 2*pi, 1000); % Parameter t, defining the curve

% 3D Lemniscate of Bernoulli equations
a = 2; % Scale factor, adjust as needed for size
x = a * cos(t);
y = a * sin(2*t) / 2;
z = a * sin(t);

% Plotting the 3D figure-eight
plot3(x, y, z, 'LineWidth', 2);
grid on; % Turn on the grid for better visualization
xlabel('X');
ylabel('Y');
zlabel('Z');
title('3D Figure-Eight');
axis equal; % Ensure equal scaling for visual accuracy

% View adjustment for better 3D perception
view(35, 45); % Adjust the viewing angle for better perception of 3D shape
