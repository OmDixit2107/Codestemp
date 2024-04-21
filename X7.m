% Fix this: If a three-phase set of currents, each of equal magnitude and differing in phase
% by 120 flows in a three-phase,
% then it will produce a rotating magnetic field of constant magnitude.
% Calculate the net magnetic field produced by a three-phase stator.
% Set up the basic conditions
bmax = 1; % Normalize bmax to 1
freq = 120; % 60 Hz
w = 2*pi*freq; % angular velocity (rad/s)
% First, generate the three component magnetic fields
t = 0:1/6000:2/60;
Baa = sin(w*t) .* (cos(0) + 1j*sin(0));
Bbb = sin(w*t - 2*pi/3) .* (cos(pi/3) + 1j*sin(2*pi/3));
Bcc = sin(w*t + 2*pi/3) .* (cos(-2*pi/3) + 1j*sin(-2*pi/3));
% Calculate Bnet
Bnet = Baa + Bbb + Bcc;
% Calculate a circle representing the expected maximum value of Bnet
circle = 1.5 * (cos(w*t) + 1j*sin(w*t));
% Plot the magnitude and direction of the resulting magnetic fields. Note that
% Baa is black, Bbb is blue, Bcc is magenta, and Bnet is red.
figure;
for ii = 1:length(t)
    % Plot the reference circle
    plot(real(circle), imag(circle), 'k');
    hold on;
    % Plot the four magnetic fields
    plot([0 real(Baa(ii))],[0 imag(Baa(ii))],'k','LineWidth',2);
    plot([0 real(Bbb(ii))],[0 imag(Bbb(ii))],'b','LineWidth',2);
    plot([0 real(Bcc(ii))],[0 imag(Bcc(ii))],'m','LineWidth',2);
    plot([0 real(Bnet(ii))],[0 imag(Bnet(ii))],'r','LineWidth',3);
    axis square;
    axis([-2 2 -2 2]);
    drawnow;
    hold off;
end
