function [TorF, vstr, rdate] = have_feature_most()
%HAVE_FEATURE_MOST  Detect availability/version info for MOST
%
%   Used by HAVE_FEATURE.

%   MP-Opt-Model
%   Copyright (c) 2004-2020, Power Systems Engineering Research Center (PSERC)
%   by Ray Zimmerman, PSERC Cornell
%
%   This file is part of MP-Opt-Model.
%   Covered by the 3-clause BSD License (see LICENSE file for details).
%   See https://github.com/MATPOWER/mp-opt-model for more info.

TorF = exist('most', 'file') == 2;
if TorF
    v = mostver('all');
    vstr = v.Version;
    rdate = v.Date;
else
    vstr = '';
    rdate = '';
end
