\\ Must set maximal stack size as big as possible. 
\\ A safe value is half of the system memory.
\\ This script was tested with parisizemax = 8G.
\\ By default all variables are global.

D=8310359121;
x=18730795424809979326402376689387157903286098711640760; 
if(!(x % 12 == 4), error("assertion failed"));
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
mu=ffgen('x^2 + Mod(7,p), 'mu);
[root, map]=ffextend(mu, 'x^2-mu, 'nu);
nu=ffgen(root);
bCalhat=(169016281573142671854143564787848026375919429824516587272659623946419686131415531131697064393139908516866*root^2 + 86187152153407984573987448965434036624964597453498028225292129840144528345189376073367297868415381289903)*root +     (272212539623685209762065144458269743622624984595069886584074106292890663544222298755326989746482267600361*root^2 +    145376408732160817796671059917558926943546511140084414048888616030656865226329426887966617118675322169071);
aCalhat= (168974080964038956231283636531346923966819141472136259520329258817975356275552764707548265780013822921506*root^2 + 310349600540799582979134954262380938303781887572205721169109609019625552584820323567244258384975249055921)*root +     (213470260072318221565168009785716069311369696026006878656141317640576345507667312063131780921722112101269*root^2 + 268204501298734254867773262509560740089817960839490859151260690102468657815760831898958196660219639647661);
ECalhat=ellinit([aCalhat,bCalhat], nu);
if(!(ellmul(ECalhat, random(ECalhat), (p^2+1)^2) == [0]), error("assertion failed")); 


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct E
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
a=342835129323924499008655004799016019971966028270472859177952722490480493914165216596373482769595669340485;
b=16015135844315909778051082125555442284010212748867744323807222916213874759053806302247353371673824792712;
E=ellinit([a,b],p);
h=1067012066356924401175091606503601567727718410178378282;
r=328808556442999639694811652149369705894374078352901;
if(!ispseudoprime(r), error("assertion failed")); 
N=h*r;
if(!(ellmul(E,random(E),N) == [0]), error("assertion failed")); 
if(!(polcyclo(4,p)%r == 0), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold and Eboldhat: D=-43
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rhat=328808556442999639694811678498803847904551001194911;
if(!ispseudoprime(rhat), error("assertion failed")); 

bbold=252740258330072390876526638281348564737456972318352;
abold=202438427277963444256548333008695423525645592193725;
Ebold=ellinit([abold,bbold],r);

bboldhat=128609755086274286277341274592192719840667413396585;
aboldhat=277892116594404060417859195672195872889613282570644;
Eboldhat=ellinit([aboldhat,bboldhat], rhat);

if(!(ellmul(Ebold, random(Ebold), rhat) == [0]), error("assertion failed")); 
if(!(ellmul(Eboldhat, random(Eboldhat), r) == [0]), error("assertion failed")); 


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_W
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
b=26688;
Ebold_W=ellinit([-3,b],r);
N_W=328808556442999639694811656686137563768670250283477;
Ebold_Wt=ellinit(elltwist(Ebold_W));
N_Wt=328808556442999639694811647612601848020077906422327;
if(!ispseudoprime(N_W), error("assertion failed")); 
if(!ispseudoprime(N_Wt), error("assertion failed")); 
if(!(ellmul(Ebold_W, random(Ebold_W), N_W) == [0]), error("assertion failed")); 
if(!(ellmul(Ebold_Wt, random(Ebold_Wt), N_Wt) == [0]), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_Ed
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
d=78971;
Ebold_Ed=ellfromeqn(-'X^2+'Y^2-(1+d*'X^2*'Y^2));
E_Ed=ellinit(Ebold_Ed, r);
r_Ed=41101069555374954961851454584629740070294024716789;
E_Edt=ellinit(elltwist(E_Ed));
r_Edt=82202139110749909923702916905425372806598989742873;
if(!ispseudoprime(r_Ed), error("assertion failed")); 
if(!ispseudoprime(r_Edt), error("assertion failed")); 
N_Ed=2^3*r_Ed;
N_Edt=2^2*r_Edt;
if(!(ellmul(E_Ed, random(E_Ed), N_Ed) == [0]), error("assertion failed")); 
if(!(ellmul(E_Edt, random(E_Edt), N_Edt) == [0]), error("assertion failed")); 
