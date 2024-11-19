clear;

% Parameters for the Möbius strip
u = linspace(0, 2*pi, 1000); % Parameter u goes around the strip
v = linspace(-0.5, 0.5, 500); % Parameter v goes from one edge to the other
n = 3; % Number of half-twists. Change this for more or fewer twists

[U, V] = meshgrid(u, v); 

% Möbius strip parameterization with n half-twists
x = (1 + V.*cos(n*U/2)).*cos(U);
y = (1 + V.*cos(n*U/2)).*sin(U);
z = V.*sin(n*U/2);

% Plot the Möbius strip
surf(x, y, z);
colormap('jet'); 
shading interp; 
axis equal; 
xlabel('X');
ylabel('Y');
zlabel('Z');
title(['Möbius Strip with ', num2str(n), ' Half-Twists']);
