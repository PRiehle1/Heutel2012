function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
% function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = heutel_2012.static_g1_tt(T, y, x, params);
    end
    residual = heutel_2012.static_resid(T, y, x, params, false);
    g1       = heutel_2012.static_g1(T, y, x, params, false);

end
