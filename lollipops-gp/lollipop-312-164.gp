\\ Must set maximal stack size as big as possible. 
\\ A safe value is half of the system memory.
\\ This script was tested with parisizemax = 8G.
\\ By default all variables are global.

D=6110889;
x=88548362472645954052294301731040588229291306280; 
if(!(x % 12 == 4), error("assertion failed"));
p=x^2-x+1;
q=x^2+1;
if(!ispseudoprime(p), error("assertion failed")); 
if(!ispseudoprime(q), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ecalcal
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
u=ffgen(ffinit(q,3), 'u);
Ecal=ellinit([0,1], u);
if(!(ellcard(Ecal) == (q^3+1)), error("assertion failed")); 
if(!((q^3+1) % p == 0), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ecal
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
mu=ffgen('x^2 + Mod(13,p), 'mu);
[root, map]=ffextend(mu, 'x^2-mu, 'nu);
nu=ffgen(root);
bCalhat=(1579068720131648942720078455656310773074752682189626704073136042532690845866515755228530304718*root^2 +     4581727373665814458881199404108521279143490971182947103932047139724242629117010257278337181242)*root +     (1863714896694460132915469204283761501615857581610826279741681680158489049360020519774904286679*root^2 +     6018993779663854272341694592090289123781211508552699798952940528645977640738820382310757124661);
aCalhat= (3441720760619346169788335177559000968998067714462269923929891758089056900959282481485131184817*root^2 +     4433126477580285416300824744983692266263999436623601882977515525042106518822495174161423655533)*root +     (5403286718293628588466310798786335333137092521468306632377305479733936489451502241320311856517*root^2 +    5628133598253202686598669176746454764851328357278419730653467047944716433197453684173585763401);
ECalhat=ellinit([aCalhat,bCalhat], nu);
if(!(ellmul(ECalhat, random(ECalhat), (p^2+1)^2) == [0]), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct E
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
a=4918196760020528488957309274160637989552623006853379633776038146580726449393830562995388116463;
b=5845231473133131617905468256555351120971165286345867575128945905148493187776434528728176031316;
E=ellinit([a,b],p);
h=479174866017344482422371790835673988426974474;
r=16363154774280844370399386199393878581235093199333;
if(!ispseudoprime(r), error("assertion failed")); 
N=h*r;
if(!(ellmul(E,random(E),N) == [0]), error("assertion failed")); 
if(!(polcyclo(4,p)%r == 0), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold and Eboldhat: D=-192547
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rhat=16363154774280844370399380579099997217150097132267;
if(!ispseudoprime(rhat), error("assertion failed")); 
bbold=10130730649810940861865736770518294535982648011430;
abold=11297789449375373939466517814134731313243769193618;
Ebold=ellinit([abold,bbold],r);
bboldhat=11866290165562893738812085996745646179055374195229;
aboldhat=2428427089943051900625431744980848291493254941149;
Eboldhat=ellinit([aboldhat,bboldhat], rhat);

if(!(ellmul(Ebold, random(Ebold), rhat) == [0]), error("assertion failed")); 
if(!(ellmul(Eboldhat, random(Eboldhat), r) == [0]), error("assertion failed")); 


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_W
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
b=6457;
Ebold_W=ellinit([-3,b],r);
N_W=16363154774280844370399391583683206277266055021737;
Ebold_Wt=ellinit(elltwist(Ebold_W));
N_Wt=16363154774280844370399380815104550885204131376931;
if(!ispseudoprime(N_W), error("assertion failed")); 
if(!ispseudoprime(N_Wt), error("assertion failed")); 
if(!(ellmul(Ebold_W, random(Ebold_W), N_W) == [0]), error("assertion failed")); 
if(!(ellmul(Ebold_Wt, random(Ebold_Wt), N_Wt) == [0]), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_Ed
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
d=2709;
Ebold_Ed=ellfromeqn(-'X^2+'Y^2-(1+d*'X^2*'Y^2));
E_Ed=ellinit(Ebold_Ed, r);
r_Ed=2045394346785105546299923814239245827060627786917;
E_Edt=ellinit(elltwist(E_Ed));
r_Edt=4090788693570211092599845471218447636496291025833;
if(!ispseudoprime(r_Ed), error("assertion failed")); 
if(!ispseudoprime(r_Edt), error("assertion failed")); 
N_Ed=2^3*r_Ed;
N_Edt=2^2*r_Edt;
if(!(ellmul(E_Ed, random(E_Ed), N_Ed) == [0]), error("assertion failed")); 
if(!(ellmul(E_Edt, random(E_Edt), N_Edt) == [0]), error("assertion failed")); 
