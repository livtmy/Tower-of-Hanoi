function display_state(state)
    base_pos = [0 0];
    base_size = [100 1];
    
    disk_spacing = 5;
    peg_width = 2;
    base_attrs = [base_pos base_size];
    plot(100, 40);
    hold off
    axis off;
    draw_rec(base_attrs);
    pegs = state;
    n_pegs = length(pegs);
    N = 0;
    for peg = 1:n_pegs
        N = N + length(pegs{peg});
    end
    for peg = 1:n_pegs
        draw_peg(peg, n_pegs, base_size, disk_spacing); 
        disks = pegs{peg};
        for n_in_peg = 1:length(disks)
            disk = disks(n_in_peg);
            draw_disk(base_size, disk, peg, 0.8, n_in_peg, N);
        end
    end
end

function draw_rec(attrs)
    rectangle('Position', attrs)
end

function draw_peg(peg, n_pegs, base_size, disk_spacing)
    y = base_size(2);
    h = 10;
    w = 2;
    disk_width = base_size(1) - (4 * disk_spacing);
    disk_width = disk_width/3;
    center = (peg * disk_spacing) + ((peg - 1) * disk_width) + (disk_width/2);
    x = center - (w / 2);
    draw_rec([x y w h]);
end

function draw_disk(base_size, disk, peg, shrink_rate, n_in_peg, N)
    h = 1.1;
    disks_spacing = 5;
    y = base_size(2) + ((n_in_peg - 1) * h);
    
    w = base_size(1) - (4 * disks_spacing);
    w = w/3;
    center = (peg * disks_spacing) + ((peg - 1) * w) + (w/2);
    
    w = w * (shrink_rate ^ (N - disk));
    x = center - (w / 2);
    draw_rec([x y w h]);
end