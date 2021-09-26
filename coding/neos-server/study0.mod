var XM;
var XE;
maximize Profit: 25 * XM + 30 * XE;
subject to Time: (1/20) * XM + (1/14) * XE <= 40;
subject to M_limit: 0 <= XM <= 600;
subject to E_limit: 0 <= XE <= 400;
