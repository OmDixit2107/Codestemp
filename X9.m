% M-file, torque_speed_curve.m
% M-file create a plot of the torque-speed curve of the
% induction motor of Example 7-5.
% First, initialize the values needed in this program.
rl = 0.641; % Stator resistance
xl = 1.10; % Stator reactance
r2 = 0.332; % Rotor resistance
x2 = 0.464;
xm = 26.3;
v_phase = 460 / sqrt(3);
n_sync = 1800;
w_sync = 188.5;
% Calculate the Thevenin voltage and impedance from Equations 7-41a and 7-43.
v_th = v_phase * (rl + j*xl) / ((rl + j*xl) + j*xm);
z_th = ((j*xm) * (r2 + j*x2)) / ((j*xm) + (r2 + j*x2));
r_th = real(z_th);
x_th = imag(z_th);

% Now calculate the torque-speed characteristic for many slips between 0 and 1.
% Note that the first slip value is set to 0.001 instead of exactly 0 to avoid divide-by-zero problems.
s = (0:1:50) / 50;
s(1) = 0.001; % Slip
run = (1 - s) * n_sync; % Mechanical speed

% Calculate torque for original rotor resistance
for ii = 1:51
    t_ind1(ii) = (3 * v_th^2 * r2 / s(ii)) / ...
        (w_sync * ((r_th + r2 / s(ii))^2 + (x_th + x2)^2));
end

% Calculate torque for doubled rotor resistance
for ii = 1:51
    t_ind2(ii) = (3 * v_th^2 * (2*r2) / s(ii)) / ...
        (w_sync * ((r_th + (2*r2)/s(ii))^2 + (x_th + x2)^2));
end

% Calculate torque for halved rotor resistance
for ii = 1:51
  t_ind3(ii) = (3 * v_th^2 * (0.5*r2) / s(ii)) / ...
    (w_sync * ((r_th + (0.5*r2)/s(ii))^2 + (x_th + x2)^2));
end

% Plot the torque-speed curve
plot(run, t_ind1, 'Color', 'k', 'LineWidth', 2.0);
hold on;
plot(run, t_ind2, 'Color', 'k', 'LineWidth', 2.0, 'LineStyle', '-.');
plot(run, t_ind3, 'Color', 'k', 'LineWidth', 2.0, 'LineStyle', '--');
xlabel('\it{n_{m}}', 'FontWeight', 'Bold');
ylabel('\tau_{ind}', 'FontWeight', 'Bold');
title('Induction motor torque-speed characteristic', ...
  'FontWeight', 'Bold');
legend('Original R_2', 'Doubled R_2', 'Halved R_2');
grid on;
hold off;