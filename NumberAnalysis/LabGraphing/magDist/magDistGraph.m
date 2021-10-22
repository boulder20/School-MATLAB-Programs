data = importdata("MagDist.csv");
values = data.data;
magnitude = values(:,4);
distance = 2:2:20;
plot(distance, magnitude);
xlabel("distance (cm)");
ylabel("magnitude (tesla)");
title("magnitude of magnetic field strength vs distance");
