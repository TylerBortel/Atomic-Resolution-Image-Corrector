%Finds the distances between the origin and points
%Not load bearing in any capacity, strictly providing additional data and a
%performance measure
LA = sqrt(Ax^2+Ay^2);
LB = sqrt(Bx^2+By^2);
LC = sqrt(Cx^2+Cy^2);
fprintf('The lengths are %.2f, %.2f, and %.2f \n',LA,LB,LC)