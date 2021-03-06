function D_kl = kl_hmm(w, u)
    % D_kl = kl_hmm(w, u)
    %
    % Calculates Kullback-Leiber divergence
    %
    %   D_kl(q(theta) || p(theta)) = D_kl(q(mu, l) || p(mu, l)) 
    %                                + D_kl(q(A) || p(A)) 
    %                                + D_kl(q(pi) || p(pi))

    % get dimensions
    [K D] = size(w.mu);

    % D_kl(q(pi) || p(pi)) = sum_l (w.pi(l) - u.pi(l)) 
    %                              (psi(w.pi(l)) - psi(u.pi(l)))
    D_kl_pi = kl_dir(w.pi, u.pi);

    % D_KL(q(A) || p(A)) = sum_{k,l} (w.A(k,l) - u.A(k,l)) 
    %                                (psi(w.A(k,l)) - psi(u.A(k,l)))
    D_kl_A = kl_dir(w.A, u.A);

    % Calculate Dkl(q(mu, L | w) || p(mu, L | u)) 
    D_kl_mu_L = kl_nw(w, u);

    % D_kl(q(theta | w) || p(theta | u))
    D_kl = sum(D_kl_mu_L) + sum(D_kl_A) + sum(D_kl_pi);