%Much like FindLengths, not strictly necessary, just finding the angles for
%additional data/performance measures
P0 = O; %[Ox, Oy];
P1 = A; %[Ax, Ay];
P2 = B; %[Bx, By];
P3 = C;
n1 = (P2 - P0) / norm(P2 - P0);  % Normalized vectors
n2 = (P1 - P0) / norm(P1 - P0);
n3 = (P3 - P0) / norm(P3 - P0);

%angle1 = acos(dot(n1, n2));                        % Instable at (anti-)parallel n1 and n2
%angle2 = asin(norm(cross(n1, n2)));                % Instable at perpendiculare n1 and n2
angle1 = rad2deg(atan2(norm(det([n2; n1])), dot(n1, n2)));  % Stable
angle2 = rad2deg(atan2(norm(det([n1; n3])), dot(n3, n1)));
fprintf('The angles are %.2f and %.2f \n', angle1, angle2)