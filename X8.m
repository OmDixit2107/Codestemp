% Generator parameters
VT = 480; % Terminal voltage at no-load (V)
IA_range = linspace(0, 60, 100); % Range of armature current (A)
XS = 1.0; % Synchronous reactance (ohm)

% Power factors to consider
lagging_power_factors = [0.2, 0.4, 0.6, 0.8];
leading_power_factors = [0.2, 0.4, 0.6, 0.8];

% Plot terminal characteristics for lagging power factors
figure;
hold on;
for lagging_pf = lagging_power_factors
    % Calculate terminal voltage for lagging power factor
    theta_lagging = acosd(-lagging_pf); % Power factor angle (degrees)
    Vt_lagging = sqrt((VT + XS * IA_range * cosd(theta_lagging)).^2 + (XS * IA_range * sind(theta_lagging)).^2);
    
    % Plot terminal characteristics for lagging power factors
    plot(IA_range, Vt_lagging, 'DisplayName', sprintf('PF Lagging %.1f', lagging_pf));
end
hold off;

xlabel('Armature Current (A)');
ylabel('Terminal Voltage (V)');
title('Terminal Characteristics of Synchronous Generator (Lagging Power Factors)');
legend('Location', 'best');
grid on;

% Plot terminal characteristics for leading power factors
figure;
hold on;
for leading_pf = leading_power_factors
    % Calculate terminal voltage for leading power factor
    theta_leading = acosd(leading_pf); % Power factor angle (degrees)
    Vt_leading = sqrt((VT + XS * IA_range * cosd(theta_leading)).^2 + (XS * IA_range * sind(theta_leading)).^2);
    z
    % Plot terminal characteristics for leading power factors
    plot(IA_range, Vt_leading, 'DisplayName', sprintf('PF Leading %.1f', leading_pf));
end
hold off;

xlabel('Armature Current (A)');
ylabel('Terminal Voltage (V)');
title('Terminal Characteristics of Synchronous Generator (Leading Power Factors)');
legend('Location', 'best');
grid on;