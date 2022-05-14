pkg load data-smoothing;

M = csvread("Data/data.csv");
N = csvread("Data/data2.csv");

[M1, lambda] = regdatasmooth(M(1:end,1), M(1:end,2));







M = [U(1:end,1), U(1:end,2), Us];
csvwrite("output.csv", M);