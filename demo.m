clear;
close all;

print_flag = true;
plot_flag = true;
wait_for_click = true;
global_flags(print_flag, plot_flag, wait_for_click);
disp("Demo recursive hanoi tower:")
recursive_hanoi(4);
disp("Demo iterative hanoi tower:")
iterative_hanoi(4);
close all;