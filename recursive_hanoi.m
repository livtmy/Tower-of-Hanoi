function recursive_hanoi(n)
    initial_state = {[n:-1:1] [] []};
    recursive_hanoi_helper(n, 1, 2, 3, initial_state);
end

function state = recursive_hanoi_helper(n, from, with, to, state)
    if (n ~= 0)
        state = recursive_hanoi_helper(n - 1, from, to, with, state);
        state = move_disk_state(n, from, to, state);
        state = recursive_hanoi_helper(n - 1, with, from, to, state);
    end
end

function state = move_disk_state(n, from, to, state)
    state{to}(end+1) = state{from}(end);
    state{from} = state{from}(1:end-1);
%     global g_print_flag;
%     if g_print_flag
%        fprintf('Move disk %d from peg %d to peg %d\n',[n, from, to]);
%     end
%     global g_plot_flag;
%     global g_wait_for_click_flag;
%     if g_plot_flag
%         display_state(state);
%         if g_wait_for_click_flag
%             waitforbuttonpress
%         else
%             pause(1);
%         end
%     end
end