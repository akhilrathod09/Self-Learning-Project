% Define the range for x and y variables (from -5 to 5, incremented by 0.5)
x = -5:0.5:5;  
y = -5:0.5:5;

% Create a grid of (x, y) points for plotting
[X, Y] = meshgrid(x, y);

% Define the objective function for the surface (example: z = x^2 + y^2)
Z = X.^2 + Y.^2;%Example

% Plot a 3D surface of the objective function
figure;
surf(X, Y, Z); % Create the 3D surface plot
title('Surface Plot of z = x^2 + y^2'); % Title of the plot
xlabel('X-axis'); % Label for x-axis
ylabel('Y-axis'); % Label for y-axis
zlabel('Z-axis'); % Label for z-axis (function value)
colormap('jet'); % Apply a color map for better visualization
colorbar; % Add color bar to show value scales

% Plot contour lines of the function
figure;
contour(X, Y, Z, 20); % 20 specifies the number of contour levels to plot
title('Contour Plot of z = x^2 + y^2'); % Title of the contour plot
xlabel('X-axis');
ylabel('Y-axis');
colorbar; % Display a color bar for contour levels

% Define the objective function again (z = x^2 + y^2)
Z_obj = X.^2 + Y.^2;

% Define a constraint function (example: x + y - 5 = 0)
Z_constr = X + Y - 5;

% Plot the objective function and constraint surface in 3D
figure;
surf(X, Y, Z_obj); % Plot the 3D surface for the objective function
hold on; % Hold the plot to overlay another plot
surf(X, Y, Z_constr, 'FaceAlpha', 0.5); % Overlay constraint surface with transparency
title('3D Plot of Objective Function and Constraint'); % Plot title
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
legend('Objective Function', 'Constraint (x + y - 5 = 0)'); % Add legend for clarity
hold off; % Release the hold on the plot

% Plot the contours of the objective function and constraint
figure;
contour(X, Y, Z_obj, 20); % Contour plot for the objective function
hold on;
contour(X, Y, Z_constr, [0 0], 'r', 'LineWidth', 2); % Plot the constraint contour at level 0
title('Contour Plot of Objective Function and Constraint'); % Title of contour plot
xlabel('X-axis');
ylabel('Y-axis');
legend('Objective Function Contours', 'Constraint (x + y - 5 = 0)'); % Add legend
colorbar; % Add color bar for reference
hold off; % Release the plot hold
