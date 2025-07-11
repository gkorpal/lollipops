\\ Must set maximal stack size as big as possible. 
\\ A safe value is half of the system memory.
\\ This script was tested with parisizemax = 8G.
\\ By default all variables are global.

D=180658;
x=56481599004467333072908231275414842979583674079035946;
if(!issquare(((3*x-2)^2+8)/(3*D)), error("assertion failed"));
if(!issquare((4*(x^2-x+1)-x^2)/D), error("assertion failed"));

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
ECalhat=ellinit([alpha,0]);
if(!(ellcard(ECalhat) == (p^2+1)), error("assertion failed")); 
if(!((p^2+1) % q == 0), error("assertion failed")); 


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct E
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
a=2303038870540328217187531505620047942857924081697306597998565459881367424872326681378598895138380878565040;
b=1774264311122234026558613049117462394391784544069405142011905271580392245722059450421085706031667605027862;
E=ellinit([a,b],p);
h=49992456550511609467578402491318795176805849602;
r=63813047932104426082453413797282569427015011539084559319113;
if(!ispseudoprime(r), error("assertion failed")); 
N=h*r;
if(!(ellmul(E,random(E),N) == [0]), error("assertion failed")); 
if(!(polcyclo(4,p)%r == 0), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold and Eboldhat left and right: D=-3
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rhat_left=63813047932104426082453413797741598558327689972782272862771;
rhat_right=63813047932104426082453413796870275386988438007159089802987;

Ebold_left=ellinit([0,-5], r); 
if(!(ellcard(Ebold_left) == rhat_left), error("assertion failed"));

Eboldhat_left=ellinit([0,-5], rhat_left); 
if(!(ellcard(Eboldhat_left) == r), error("assertion failed"));

Ebold_right=ellinit([0,28], r); 
if(!(ellcard(Ebold_right) == rhat_right), error("assertion failed"));

Eboldhat_right=ellinit([0,28], rhat_right); 
if(!(ellcard(Eboldhat_right) == r), error("assertion failed"));

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_W
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
b=7193;
Ebold_W=ellinit([-3,b],r);
N_W=63813047932104426082453413797284857424091899924243953147677;
Ebold_Wt=ellinit(elltwist(Ebold_W));
N_Wt=63813047932104426082453413797280281429938123153925165490551;
if(!ispseudoprime(N_W), error("assertion failed")); 
if(!ispseudoprime(N_Wt), error("assertion failed")); 
if(!(ellmul(Ebold_W, random(Ebold_W), N_W) == [0]), error("assertion failed")); 
if(!(ellmul(Ebold_Wt, random(Ebold_Wt), N_Wt) == [0]), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_Ed
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
d=128421;
Ebold_Ed=ellfromeqn(-'X^2+'Y^2-(1+d*'X^2*'Y^2));
E_Ed=ellinit(Ebold_Ed, r);
r_Ed=15953261983026106520613353449256168076057068846093018823731;
E_Edt=ellinit(elltwist(E_Ed));
r_Edt=7976630991513053260306676724692558318725218461724630417913;
if(!ispseudoprime(r_Ed), error("assertion failed")); 
if(!ispseudoprime(r_Edt), error("assertion failed")); 
N_Ed=2^2*r_Ed;
N_Edt=2^3*r_Edt;
if(!(ellmul(E_Ed, random(E_Ed), N_Ed) == [0]), error("assertion failed")); 
if(!(ellmul(E_Edt, random(E_Edt), N_Edt) == [0]), error("assertion failed")); 
