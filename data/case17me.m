function mpc = case17me
%CASE17me  Power flow data for 18 bus distribution system from Mendoza et
%    al, Please see CASEFORMAT for details on the case file format.
%
%    Data from ...
%    Mendoza J, Morales D, L?pez R, et al (2007) Multi-objective Location
%    of Automatic Voltage Regulators in a Radial Distribution Network Using
%    a Micro Genetic Algorithm. IEEE Trans Power Syst 22:404ñ411.

%% MATPOWER Case Format : Version 2
mpc.version = '2';

%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 100;

%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm	Va	baseKV	zone	Vmax	Vmin
mpc.bus = [ 													
    1	3	0	0	0	0	1	1	0	23	1	1	1
    2	1	0.8	0.6	0	0	1	1	0	23	1	1.1	0.9
    3	1	0.8	0.6	0	0	1	1	0	23	1	1.1	0.9
    4	1	0.8	0.6	0	0	1	1	0	23	1	1.1	0.9
    5	1	0.8	0.64	0	0	1	1	0	23	1	1.1	0.9
    6	1	1.2	0.16	0	0	1	1	0	23	1	1.1	0.9
    7	1	0.8	-0.16	0	0	1	1	0	23	1	1.1	0.9
    8	1	0.6	0.48	0	0	1	1	0	23	1	1.1	0.9
    9	1	1.6	1.08	0	0	1	1	0	23	1	1.1	0.9
    10	1	2	0.72	0	0	1	1	0	23	1	1.1	0.9
    11	1	0.4	0.36	0	0	1	1	0	23	1	1.1	0.9
    12	1	0.24	-0.2	0	0	1	1	0	23	1	1.1	0.9
    13	1	1.8	0.8	0	0	1	1	0	23	1	1.1	0.9
    14	1	0.4	0.36	0	0	1	1	0	23	1	1.1	0.9
    15	1	0.4	-0.44	0	0	1	1	0	23	1	1.1	0.9
    16	1	0.4	0.36	0	0	1	1	0	23	1	1.1	0.9
    17	1	0.84	-0.32	0	0	1	1	0	23	1	1.1	0.9
    ];


%% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mpc.gen = [
	1	0	0	10	-10	1	100	1	10	0	0	0	0	0	0	0	0	0	0	0	0;
];
												
%% branch data													
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [ 													
    1	2	0.05	0.05	0	0	0	0	0	0	1	-360	360
    2	3	0.11	0.11	0	0	0	0	0	0	1	-360	360
    3	4	0.15	0.11	0	0	0	0	0	0	1	-360	360
    4	5	0.08	0.11	0	0	0	0	0	0	1	-360	360
    4	6	0.11	0.11	0	0	0	0	0	0	1	-360	360
    6	7	0.04	0.04	0	0	0	0	0	0	1	-360	360
    7	8	0.8     0.11	0	0	0	0	0	0	1	-360	360
    8	9	0.075	0.1     0	0	0	0	0	0	1	-360	360
    8	10	0.09	0.18	0	0	0	0	0	0	1	-360	360
    10	11	0.04     0.04	0	0	0	0	0	0	1	-360	360
    3	12	0.11	0.11	0	0	0	0	0	0	1	-360	360
    12	13	0.04	0.04	0	0	0	0	0	0	1	-360	360
    13	14	0.09	0.12	0	0	0	0	0	0	1	-360	360
    14	15	0.11	0.11	0	0	0	0	0	0	1	-360	360
    14	16	0.08	0.11	0	0	0	0	0	0	1	-360	360
    16	17	0.04	0.04	0	0	0	0	0	0	1	-360	360
];

%%-----  OPF Data  -----%%
%% generator cost data
%	1	startup	shutdown	n	x1	y1	...	xn	yn
%	2	startup	shutdown	n	c(n-1)	...	c0
mpc.gencost = [
	2	0	0	3	0	20	0;
];

% %% convert branch impedances from Ohms to p.u.
% [PQ, PV, REF, NONE, BUS_I, BUS_TYPE, PD, QD, GS, BS, BUS_AREA, VM, ...
%     VA, BASE_KV, ZONE, VMAX, VMIN, LAM_P, LAM_Q, MU_VMAX, MU_VMIN] = idx_bus;
% 
% [F_BUS, T_BUS, BR_R, BR_X, BR_B, RATE_A, RATE_B, RATE_C, ...
%     TAP, SHIFT, BR_STATUS, PF, QF, PT, QT, MU_SF, MU_ST, ...
%     ANGMIN, ANGMAX, MU_ANGMIN, MU_ANGMAX] = idx_brch;
% 
% 
% [GEN_BUS, PG, QG, QMAX, QMIN, VG, MBASE, GEN_STATUS, PMAX, PMIN, ...
%     MU_PMAX, MU_PMIN, MU_QMAX, MU_QMIN, PC1, PC2, QC1MIN, QC1MAX, ...
%     QC2MIN, QC2MAX, RAMP_AGC, RAMP_10, RAMP_30, RAMP_Q, APF] = idx_gen;
% 
% Vbase = mpc.bus(1, BASE_KV) * 1e3;      %% in Volts
% Sbase = mpc.baseMVA * 1e6;              %% in VA
% mpc.branch(:, [BR_R BR_X]) = mpc.branch(:, [BR_R BR_X]) / (Vbase^2 / Sbase);

%% convert loads from kW to MW
% mpc.bus(:, [PD, QD]) = mpc.bus(:, [PD, QD]) / 1e3;