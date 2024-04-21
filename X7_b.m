% Set up basic parameters
bmax = 1; % Normalize bmax to 1
freq = 60; % 60 Hz
w = 2*pi*freq; % angular velocity (rad/s)
t = 0:1/6000:1/60;

% Generate the three component magnetic fields of the stator
Baa = sin(w*t) .* (cos(0) + 1i*sin(0));
Bbb = sin(w*t - 2*pi/3) .* (cos(2*pi/3) + 1i*sin(2*pi/3));
Bcc = sin(w*t + 2*pi/3) .* (cos(-2*pi/3) + 1i*sin(-2*pi/3));

% Calculate the net magnetic field produced by the stator
Bnet_stator = Baa + Bbb + Bcc;

% Parameters for the rotor
rotor_radius = 0.5; % Radius of the rotor loop
rotor_current = 1; % Current in the rotor loop

% Calculate the magnetic field produced by the rotor
rotor_magnetic_field = zeros(size(t));
for ii = 1:length(t)
    % Magnetic field produced by a current-carrying loop
    rotor_magnetic_field(ii) = rotor_current * rotor_radius^2 / (2 * (rotor_radius^2 + (rotor_radius*sin(w*t(ii)))^2)^(3/2));
end

% Plot the magnitude and direction of the stator's magnetic field (Bnet_stator)
figure;
for ii = 1:length(t)
    % Plot the stator's rotating magnetic field
    plot([0 real(Bnet_stator(ii))], [0 imag(Bnet_stator(ii))], 'r', 'LineWidth', 2);
    hold on;

    % Plot the rotor's magnetic field
    plot([0 rotor_magnetic_field(ii)*cos(w*t(ii))], [0 rotor_magnetic_field(ii)*sin(w*t(ii))], 'b', 'LineWidth', 2);

    % Plot rotor loop
    theta = linspace(0, 2*pi, 100);
    x_rotor = rotor_radius * cos(theta);
    y_rotor = rotor_radius * sin(theta);
    plot(x_rotor, y_rotor, 'k--');

    axis square;
    axis([-1.5 1.5 -1.5 1.5]);
    xlabel('X');
    ylabel('Y');
    title('Interaction of Stator and Rotor Magnetic Fields');
    legend('Stator Magnetic Field', 'Rotor Magnetic Field', 'Rotor Loop');
    drawnow;
    hold off;
end
