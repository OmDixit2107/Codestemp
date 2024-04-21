% First, initialize the current amplitudes (21 values in the range 0-60 A)
ia = (0:20) * 3;

% Now initialize all other values
v_phase = zeros(1, 21);
e_a = 277.0;
x_s = 1.0;
theta = 36.57 * (pi / 180); % Converted to radians

% Now calculate v-phase for each current level
for ii = 1:21
    v_phase(ii) = sqrt((e_a + (x_s * ia(ii) * cos(theta)))^2 + (x_s * ia(ii) * sin(theta))^2);
end

% Calculate terminal voltage from the phase voltage
v_t = v_phase * sqrt(3);

% Plot the terminal characteristic, remembering the
% the line current is the same as ia
plot(ia, v_t, 'Color', 'k', 'Linewidth', 2.0);
xlabel('Line Current (A)', 'Fontweight', 'Bold');
ylabel('Terminal Voltage (V)', 'Fontweight', 'Bold');
title('Terminal Characteristic for O.S PF Lagg load', 'Fontweight', 'Bold');
grid on;
axis([0 60 400 550]); % Adjusted the axis limits
