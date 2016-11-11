function [x0] = Bisection(f,a,b,pre)
%% bisection finds the zero point of data array f 
%  it searches within the range x:[a,b] returning x0 as the 
%  midpoint onces the range is within the precision pre.
%  Returns an error if there is no solution inside the range.

%% Connor Blandford
%  24/02/16
%  Bisection

%% 
Fa = f(a); Fa = sign(Fa);
Fb = f(b); Fb = sign(Fb);
range = abs(b-a);
mid = a+range/2;
Fmid = f(mid);
if Fmid == 0
    x0 = mid;
    return
end
Fmid = sign(Fmid);
if range<pre
    %fprintf('The base');
    x0 = mid;
    return
elseif Fmid == Fa
    %fprintf('right');
    x0 = Bisection(f,mid,b,pre);
else % Fmid ==Fb
    %fprintf('left');
    x0 = Bisection(f,a,mid,pre);
end





