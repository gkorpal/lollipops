\\ Must set maximal stack size as big as possible. 
\\ A safe value is half of the system memory.
\\ This script was tested with parisizemax = 8G.
\\ By default all variables are global.

D=54105234;
x=8004046504391788107635887004283725454478544674; 
if(!(x % 12 == 10), error("assertion failed"));
p=x^2-x+1;
q=x^2+1;
if(!ispseudoprime(p), error("assertion failed")); 
if(!ispseudoprime(q), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ecalhat
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
u=ffgen(ffinit(q,3), 'u);
Ecal=ellinit([0,1], u);
if(!(ellcard(Ecal) == (q^3+1)), error("assertion failed")); 
if(!((q^3+1) % p == 0), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ecal
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
mu=ffgen('x^2 + Mod(1,p), 'mu);
alpha=mu+1;
ECalhat=ellinit([alpha,0], mu);
if(!(ellcard(ECalhat) == (p^2+1)), error("assertion failed")); 
if(!((p^2+1) % q == 0), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct E
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
a=11875228336988574493882712067711066361723405878662955689469453989104183434229646197784790728;
b=44530775641606776770556944911003809865281631340093296710155954546346967839351469608314023792;
E=ellinit([a,b],p);
h=241268331607910700786843106086978860074363930;
r=265533234376483119496574875659819072867998144101;
if(!ispseudoprime(r), error("assertion failed")); 
N=h*r;
if(!(ellmul(E,random(E),N) == [0]), error("assertion failed")); 
if(!(polcyclo(4,p)%r == 0), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold and Eboldhat: D=-3
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rhat=265533234376483119496575739829042558313583244851;
Ebold=ellinit([0,2],r);
if(!ispseudoprime(rhat), error("assertion failed")); 
if(!(ellmul(Ebold, random(Ebold), rhat) == [0]), error("assertion failed")); 
Eboldhat=ellinit([0,2],rhat);
if(!(ellmul(Eboldhat, random(Eboldhat), r) == [0]), error("assertion failed")); 

\\ Endomorphism/GLV stuff
lambda=201995564210763657561150927151636529199003909898;
if(!(Mod(lambda,r)^2 + Mod(lambda,r) + Mod(1,r) == 0), error("assertion failed")); 
lambdahat=74004447349370358008673518004330011864009742077;
if(!(Mod(lambdahat,rhat)^2 + Mod(lambdahat,rhat) + Mod(1,rhat) == 0), error("assertion failed")); 
P=random(Ebold);
if(!(ellmul(Ebold, P, lambdahat) == [lambda*P[1], P[2]]), error("assertion failed")); 
Q=random(Eboldhat);
if(!(ellmul(Eboldhat, Q, lambda) == [lambdahat*Q[1], Q[2]]), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_W
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
b=7032;
Ebold_W=ellinit([-3,b],r);
N_W=265533234376483119496574734837097781926465080331;
Ebold_Wt=ellinit(elltwist(Ebold_W));
N_Wt=265533234376483119496575016482540363809531207873;
if(!ispseudoprime(N_W), error("assertion failed")); 
if(!ispseudoprime(N_Wt), error("assertion failed")); 
if(!(ellmul(Ebold_W, random(Ebold_W), N_W) == [0]), error("assertion failed")); 
if(!(ellmul(Ebold_Wt, random(Ebold_Wt), N_Wt) == [0]), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_Ed
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
d=7821;
Ebold_Ed=ellfromeqn(-'X^2+'Y^2-(1+d*'X^2*'Y^2));
E_Ed=ellinit(Ebold_Ed, r);
r_Ed=33191654297060389937071768190248354565572759639;
E_Edt=ellinit(elltwist(E_Ed));
r_Edt=66383308594120779874143901449412827302853552773;
if(!ispseudoprime(r_Ed), error("assertion failed")); 
if(!ispseudoprime(r_Edt), error("assertion failed")); 
N_Ed=2^3*r_Ed;
N_Edt=2^2*r_Edt;
if(!(ellmul(E_Ed, random(E_Ed), N_Ed) == [0]), error("assertion failed")); 
if(!(ellmul(E_Edt, random(E_Edt), N_Edt) == [0]), error("assertion failed")); 
