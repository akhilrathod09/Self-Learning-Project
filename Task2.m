% This program calculates the boundaries of the
% interval that includes the minimum point of
% an unimodal function, whose minimum point is 
% located in the positive domain of the x-axis.

% Open a file to save results
fp = fopen('Task2_results.txt', 'w'); % Open a text file to write results
fprintf(fp, 'BOUNDARIES\n'); % Write the title for the output file
fprintf(fp, 'This program calculates the boundaries of the\n');
fprintf(fp, 'interval that includes the minimum point for\n');
fprintf(fp, 'an unimodal function located in the positive domain of the x-axis.\n\n');

% Initialize variables
Xa = 0.0; % Starting point of the interval (left bound)
Tau = 0.381966; % Golden ratio constant (used for interval division)
Xb = Tau; % Right bound of the interval (initially set to golden ratio)
Fa = f(Xa); % Function value at Xa
Fb = f(Xb); % Function value at Xb
fprintf(fp, 'xa=%f  xb=%f  fa=%f   fb=%f\n', Xa, Xb, Fa, Fb); % Log initial values

% Check if the function value at Xa is less than that at Xb
if Fa < Fb
   Left_bound = Xa; % If so, set the left bound to Xa
   Right_bound = Xb; % Set the right bound to Xb
end

% Arrays to store points for plotting
x_vals = [Xa]; % Array to hold x-values for plotting
f_vals = [Fa]; % Array to hold corresponding function values

% Iteratively refine the interval boundaries to find the minimum
while Fa > Fb
    X1 = Xb; % Store the previous right bound
    F1 = Fb; % Store the previous function value
    % Calculate the next point Xb using the golden ratio
    Xb = (1 + Tau) * X1 + Tau * Xa;
    Fb = f(Xb); % Evaluate the function at the new point Xb
    fprintf(fp, 'xa=%f   xb=%f   fa=%f    fb=%f\n', Xa, Xb, Fa, Fb); % Log current values

    % Append current points to arrays for plotting
    x_vals = [x_vals, Xb];
    f_vals = [f_vals, Fb];

    % Check if the previous point gives a greater or equal function value
    if F1 >= Fb
        Xa = X1; % Update the left bound to the previous right bound
        Fa = F1; % Update the function value at the new left bound
    else
        Left_bound = Xa; % If not, set the left bound to Xa
        Right_bound = Xb; % Set the right bound to Xb
        break; % Exit the loop once the minimum is found
    end
end

% Print the final results to file
fprintf(fp, '\nFinal results:\n');
fprintf(fp, 'left bound=%f    right bound=%f\n', Left_bound, Right_bound); % Log final bounds

% Close the file
fclose(fp); % Close the output file

% Plotting the results
figure;
fplot(@f, [0, Xb + 1]); % Plot the function f(x) over a range that includes the bounds
hold on;

% Plot the calculated points where the interval was refined
plot(x_vals, f_vals, 'ro', 'MarkerSize', 6, 'DisplayName', 'Calculated Points');

% Highlight the left and right bounds on the plot
y_left = f(Left_bound); % Function value at the left bound
y_right = f(Right_bound); % Function value at the right bound
plot(Left_bound, y_left, 'bs', 'MarkerSize', 8, 'DisplayName', 'Left Bound'); % Plot the left bound
plot(Right_bound, y_right, 'gs', 'MarkerSize', 8, 'DisplayName', 'Right Bound'); % Plot the right bound

% Add labels and a legend to the plot
xlabel('x');
ylabel('f(x)');
title('Unimodal Function and Calculated Interval for Minimum');
legend('Function f(x)', 'Calculated Points', 'Left Bound', 'Right Bound');
grid on; % Add grid to the plot for clarity
hold off; % Release the hold on the plot

% Function definition for f(x), the unimodal function
function [val] = f(x)
    % The evaluation of function f at a point x
    % f(x) represents the objective function
    % Example function: f(x) = x^2 - 5*x + 6;
    val = x.^2 - 5.*x + 6; % Element-wise operations for vectorized function
end
