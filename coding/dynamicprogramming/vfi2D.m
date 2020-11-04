%pAlpha, pAlpha_m, pTheta, pGamma_n, pC0, pEta, pDelta, pRho_x, pMu_m, pGamma, pBeta

% Structural parameters
global pAlpha = 0.36;
global pAlpha_m = 0.40;
global pTheta = 1;
global pGamma_n = -1/1.25;
global pC0 = 0.005;
global pEta = 1;
global pDelta = 0.022;
global pRho_x = 0.07;
global pMu_m = 1;
global pGamma = 0.05;
global pBeta = 0.99;

% Computing the steady state


% 1  2  3  4  5    6     7
% c, v, s, k, n, lambda, mu
function y = f(x)
 
% Model parameters
%pAlpha = 0.36;
%pAlpha_m = 0.40;
%pTheta = 1;
%pGamma_n = -1/1.25;
%pC0 = 0.005;
%pEta = 1;
%pDelta = 0.022;
%pRho_x = 0.07;
%pMu_m = 1;
%pGamma = 0.05;
%pBeta = 0.99;
 
 y(1) = x(4)^pAlpha*x(5)^(1-pAlpha) -pDelta*x(4) -pC0*x(3)^pEta*(1-x(5))-pGamma*x(2)-x(1);
 y(2) = (1-pRho_x)*x(5) + pMu_m*x(2)^(1-pAlpha_m)*( x(3)*(1-x(5)) )^pAlpha_m - x(5);
 y(3) = pBeta*( pAlpha*x(4)^(pAlpha-1)*x(5)^(1-pAlpha) + (1-pDelta) ) - 1;
 y(4) = pBeta*( -pTheta*x(5)^(-pGamma_n) + x(6)*( (1-pAlpha)*x(4)^pAlpha*x(5)^(-pAlpha)+pC0*x(3)^pEta ) + x(7)*( (1-pRho_x)-pMu_m*pAlpha_m*x(2)^(1-pAlpha_m)*x(3)^pAlpha_m*(1-x(5))^(pAlpha_m-1) ) ) - x(7);
 y(5) = 1/x(1) - x(6);
 y(6) = x(7)*( pMu_m*(1-pAlpha_m)*x(2)^(-pAlpha_m)*( x(3)*(1-x(5)) )^(pAlpha_m) )-pGamma*x(6);
 y(7) = x(7)*pMu_m*x(2)^(1-pAlpha_m)*pAlpha_m*x(3)^(pAlpha_m-1)*(1-x(5))^pAlpha_m-x(6)*pC0*pEta*x(3)^(pEta-1)*(1-x(5));
 
endfunction

[x, info] = fsolve ("f", [2.5; 0.03; 1.9; 30; 0.8; 1; 0.1; 0.02; 1])


% The steady state values
dCss = x(1);
dVss = x(2);
dSss = x(3);
dKss = x(4);
dNss = x(5);
dLambda_ss = x(6);
dMu_ss = x(7);


% Algorithm parameters
iIter = 2000; % maximum number of iterations
Grid.nK = 3;
Grid.nN = 2;
iToler	= 10e-6;  % convergence criterion

% Bounds of state space
dKmin	= dKss * 0.9;
dKmax	= dKss * 1.1;
dNmin = dNss * 0.9;
dNmax = dNss * 1.1;
 
% Create a grid for K and N
Grid.K = linspace(dKmin, dKmax,Grid.nK)';
Grid.N = linspace(dNmin, dNmax,Grid.nN)';

% Storage space for consumption
mC = ones( (Grid.nN-1)*Grid.nK , Grid.nK);
mY = ones( Grid.nN, Grid.nK );

for iNp=1:Grid.nN
    for iN=1:Grid.nN
        for iKp=1:Grid.nK
            for iK=1:Grid.nK
                mY( iN, iK ) = Grid.K(iK)^pAlpha*Grid.N(iN)^(1-pAlpha);
                % For given n and n', solve for v and s:
                % 1 2
                % v s
                REF = [Grid.N(iNp), Grid.N(iN), pAlpha, pAlpha_m, pTheta, pGamma_n, pC0, pEta, pDelta, pRho_x, pMu_m, pGamma, pBeta];
                function y = functionVS(x, REF)
                  %
                  np = REF(1); 
                  n = REF(2);
                  pAlpha = REF(3);
                  pAlpha_m = REF(4);
                  pTheta = REF(5);
                  pGamma_n = REF(6);
                  pC0 = REF(7);
                  pEta = REF(8);
                  pDelta = REF(9);
                  pRho_x = REF(10);
                  pMu_m = REF(11);
                  pGamma = REF(12);
                  pBeta = REF(13);
                  %
                  y(1) = ( (np-(1-pRho_x)*n)*pMu_m^(-1)*( x(2)*(1-n) )^(-pAlpha_m) )^(1/(1-pAlpha_m)) - x(1);
                  y(2) = ( pC0*pEta*pGamma^(-1)*pAlpha_m^(-1)*(1-pAlpha_m)*(1-n)*x(1)^(-1) - x(2)^(-pEta);
                endfunction
                [M, info] = fsolve ("functionVS", [0.03;1.9])
                dV = M(1);
                dS = M(2);
                % Compute the consumption
                mC( (iN-1)*Grid.nK+iKp, iK ) = Grid.K(iK)^pAlpha*Grid.N(iN)^(1-pAlpha) - Grid.K(iKp) + (1-pDelta)*Grid.K(iK) - pC0*dS^pEta*(1-Grid.N(iN)) - pGamma*dV;
            end
        end
    end
end





