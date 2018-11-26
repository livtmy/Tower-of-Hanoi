clear;
close all;

print_flag = false;
plot_flag = false;
wait_for_click = false;
global_flags(print_flag, plot_flag, wait_for_click);

start_n = 10;
end_n = 22;
repeat = 10;
inputs = linspace(start_n, end_n, end_n - start_n + 1);


recursive_times = zeros(1, length(inputs));
iterative_times = zeros(1, length(inputs));
for i = 1:length(inputs)
    n = inputs(i);
    fprintf("Running recursive test with n = %d\n", n);
    t = cputime;
    for r = 1:repeat
        recursive_hanoi(n);
    end
    e = cputime - t;
    fprintf("Elapsed time: %f\n", e);
    
    recursive_times(i) = e / repeat;
    fprintf("Running iterative test with n = %d\n", n);
    t = cputime;
    for r = 1:repeat
        iterative_hanoi(n);
    end
    e = cputime - t;
    fprintf("Elapsed time: %f\n", e);
    iterative_times(i) = e / repeat;
end

recursive_times
iterative_times
hold on;
plot(inputs, recursive_times);
plot(inputs, iterative_times);
hold off;
legend("recursive", "iterative")
xlabel('N Inputs')
ylabel('Time(n)')
title('Time x Input size')


