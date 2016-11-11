function [res] = FWHM(f,range)
%
%
    symsf   = symvar(f);
    f       = symfun(f,symsf);
    x       = linspace(min(range),max(range));
    y       = double(f(x));
    yMax    = max(double(y));
    gHalf   = yMax/2;
    g       = @(x) f(x)-gHalf;
    x0      = mean(x(y==yMax));
    plot(x,g(x));
    a = Bisection(g,x(1),x0,0.1)
    b = Bisection(g,x0,x(end),0.1)
    res = abs(b-a);
end