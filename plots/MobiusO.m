% Define parameters
u = linspace(0, 2*pi, 100); % Parameter along the strip
v = linspace(-0.5, 0.5, 20); % Width of the strip
[U, V] = meshgrid(u, v);

% Define the Möbius strip equations
X = (1 + V.*cos(U/2)).*cos(U);
Y = (1 + V.*cos(U/2)).*sin(U);
Z = V.*sin(U/2);

% Plot the Möbius strip
surf(X, Y, Z);
colormap jet; % Color the strip based on its height
shading interp; % Smooth the color transition
axis equal; % Equal scaling for all axes
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Möbius Strip');

% Adjust viewing angle for better visualization
view([-45 30]);
