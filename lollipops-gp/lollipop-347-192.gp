\\ Must set maximal stack size as big as possible. 
\\ A safe value is half of the system memory.
\\ This script was tested with parisizemax = 8G.
\\ By default all variables are global.

D=118564569;
x=14505229446120628393631280380693372180812753922328580; 
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
mu=ffgen('x^2 + Mod(2,p), 'mu);
[root, map]=ffextend(mu, 'x^2-mu, 'nu);
nu=ffgen(root);
bCalhat=(55696157999656799703064027609539558258596517402326996423305474034093609596333463258769421536215530397688*root^2 +        118337944135574455973933406963131619176074966572889859144358137195962232671102196728693470596636413595036)*root +        3040763573036970196577244633507418859214479405125375629904440644225086655309322933760742452485533331159*root^2 +        134528876705761600192708147766336653911167437740221807687082988955892921996945421562317159412526771826172;
aCalhat= (165078167554756045522081480249972274782325811208406171940294285361301795842067883362849079841238916292802*root^2 +        128875293673607767411159154587345353840501070066384098475055072057032035620949642325671293341851301280758)*root +        99387678070294495403855592846626772314128507128494190420627733444864579844779389252409287590678959019486*root^2 +        83302251388064223879552338528734433908401374486468557479475436908383817125045743250591691094268520278444;
ECalhat=ellinit([aCalhat,bCalhat], nu);
if(!(ellmul(ECalhat, random(ECalhat), (p^2+1)^2) == [0]), error("assertion failed")); 


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct E
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
a=154365075817765956644146531860722812736338204644670561317034883713082715332084781245346106711061071746061;
b=112073210933677990653032546876116868994192077022495039943258980008051916579346486762702007855348981483520;
E=ellinit([a,b],p);
h=62767547858815003411389448244023574953757003834;
r=3352077442277464689609430676169326638915393086826573839113;
if(!ispseudoprime(r), error("assertion failed")); 
N=h*r;
if(!(ellmul(E,random(E),N) == [0]), error("assertion failed")); 
if(!(polcyclo(4,p)%r == 0), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold and Eboldhat: D=-159307
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rhat=3352077442277464689609430676229259591317272559693816458531;
if(!ispseudoprime(rhat), error("assertion failed")); 

bbold=3231122741390077062596640368544875249164386543332496228795;
abold=1709272387200662551536046196941515974786954901810838130105;
Ebold=ellinit([abold,bbold],r);

bboldhat=2833441997989364458901868983576327626296290636732114110511;
aboldhat=259317722144050115353780846326465982510490961480851174010;
Eboldhat=ellinit([aboldhat,bboldhat], rhat);

if(!(ellmul(Ebold, random(Ebold), rhat) == [0]), error("assertion failed")); 
if(!(ellmul(Eboldhat, random(Eboldhat), r) == [0]), error("assertion failed")); 


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_W
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
b=11566;
Ebold_W=ellinit([-3,b],r);
N_W=3352077442277464689609430676108118949490211254485990907897;
Ebold_Wt=ellinit(elltwist(Ebold_W));
N_Wt=3352077442277464689609430676230534328340574919167156770331;
if(!ispseudoprime(N_W), error("assertion failed")); 
if(!ispseudoprime(N_Wt), error("assertion failed")); 
if(!(ellmul(Ebold_W, random(Ebold_W), N_W) == [0]), error("assertion failed")); 
if(!(ellmul(Ebold_Wt, random(Ebold_Wt), N_Wt) == [0]), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_Ed
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
d=69127;
Ebold_Ed=ellfromeqn(-'X^2+'Y^2-(1+d*'X^2*'Y^2));
E_Ed=ellinit(Ebold_Ed, r);
r_Ed=419009680284683086201178834519886198372757853966525854679;
E_Edt=ellinit(elltwist(E_Ed));
r_Edt=838019360569366172402357669044890922712180835480235210199;
if(!ispseudoprime(r_Ed), error("assertion failed")); 
if(!ispseudoprime(r_Edt), error("assertion failed")); 
N_Ed=2^3*r_Ed;
N_Edt=2^2*r_Edt;
if(!(ellmul(E_Ed, random(E_Ed), N_Ed) == [0]), error("assertion failed")); 
if(!(ellmul(E_Edt, random(E_Edt), N_Edt) == [0]), error("assertion failed")); 
