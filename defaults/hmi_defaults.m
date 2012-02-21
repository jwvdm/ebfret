function opts = hmi_defaults()
    opts = struct(...
             'hstep', 'ml', ...
             'restarts', 20, ...
             'do_restarts', 'init', ...
             'threshold', 1e-5, ...
             'max_iter', 100, ...
             'display', 'off');