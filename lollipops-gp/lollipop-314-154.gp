\\ Must set maximal stack size as big as possible. 
\\ A safe value is half of the system memory.
\\ This script was tested with parisizemax = 8G.
\\ By default all variables are global.

D=8162838387;
x=135291617420619872112751781485200134095300092426; 
if(!(x % 12 == 6), error("assertion failed"));
p=x^2-x+1;
q=x^2+1;
if(!ispseudoprime(p), error("assertion failed")); 
if(!ispseudoprime(q), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ecalhat
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
u=ffgen(ffinit(q,3), 'u);
Ecal=ellinit(ellfromj(Mod(8000,q)), u);
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
a=5064290769459898582208668613767650426510501885481055887941469672159248590541526810792737109744;
b=8175240205367577293438529262139138372585624261346115020528628026770915470614224162818668345989;
E=ellinit([a,b],q);
h=1122802646516678525727619619400231274145384512567;
r=16301904703442006645510971103655842159455254409;
if(!ispseudoprime(r), error("assertion failed")); 
N=h*r;
if(!(ellmul(E,random(E),N) == [0]), error("assertion failed")); 
if(!(polcyclo(6,q)%r == 0), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold and Eboldhat: D=-67
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rhat=16301904703442006645511207541928330293077277787;
if(!ispseudoprime(rhat), error("assertion failed")); 

abold=3957254978293817915309205794304708781713941023;
bbold=8387394746854370814892559515046424596027372363;
Ebold=ellinit([abold,bbold],r);

aboldhat=9922049768246127253165759871026313902451805752;
bboldhat=12759709870391758784690895341804032781250944070;
Eboldhat=ellinit([aboldhat,bboldhat], rhat);

if(!(ellmul(Ebold, random(Ebold), rhat) == [0]), error("assertion failed")); 
if(!(ellmul(Eboldhat, random(Eboldhat), r) == [0]), error("assertion failed")); 


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_W
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
b=17221;
Ebold_W=ellinit([-3,b],r);
N_W=16301904703442006645511066439252790128850480963;
Ebold_Wt=ellinit(elltwist(Ebold_W));
N_Wt=16301904703442006645510875768058894190060027857;
if(!ispseudoprime(N_W), error("assertion failed")); 
if(!ispseudoprime(N_Wt), error("assertion failed")); 
if(!(ellmul(Ebold_W, random(Ebold_W), N_W) == [0]), error("assertion failed")); 
if(!(ellmul(Ebold_Wt, random(Ebold_Wt), N_Wt) == [0]), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_Ed
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
d=4468;
Ebold_Ed=ellfromeqn(-'X^2+'Y^2-(1+d*'X^2*'Y^2));
E_Ed=ellinit(Ebold_Ed, r);
r_Ed=4075476175860501661377790579776077182723202747;
E_Edt=ellinit(elltwist(E_Ed));
r_Edt=2037738087930250830688847486025921948502212229;
if(!ispseudoprime(r_Ed), error("assertion failed")); 
if(!ispseudoprime(r_Edt), error("assertion failed")); 
N_Ed=2^3*r_Ed;
N_Edt=2^2*r_Edt;
if(!(ellmul(E_Ed, random(E_Ed), N_Ed) == [0]), error("assertion failed")); 
if(!(ellmul(E_Edt, random(E_Edt), N_Edt) == [0]), error("assertion failed")); 
