function iterative_hanoi(n)
    initial_state = {[n:-1:1] [] []};
    if mod(n, 2) == 0
        iterative_hanoi_helper(n, 1, 3, 2, initial_state);
    else
        iterative_hanoi_helper(n, 1, 2, 3, initial_state);
    end
end

function iterative_hanoi_helper(n, source, auxiliary, target, state)
    total = 2 ^ n - 1;
    i = 1;
    while (i + 2 <= total)
        state = move_disk(source, target, state);
        state = move_disk(source, auxiliary, state);
        state = move_disk(auxiliary, target, state);
        i = i + 3;
    end
    if i <= total
        state = move_disk(source, target, state);
        i = i + 1;
    end
    if i <= total
        move_disk(source, auxiliary, state);
    end
end

function state = move_disk(peg1, peg2, state)
    if isempty(state{peg1}) || (~isempty(state{peg2}) && state{peg1}(end) > state{peg2}(end))
        peg_to = peg1;
        peg_from = peg2;
    else
        peg_from = peg1;
        peg_to = peg2;
    end
    state{peg_to}(end + 1) = state{peg_from}(end);
    state{peg_from} = state{peg_from}(1 : end - 1);
%     global g_print_flag;
%     if g_print_flag
%         fprintf('Move disk %d from peg %d to peg %d\n',[state{peg_to}(end), peg_from, peg_to]);
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