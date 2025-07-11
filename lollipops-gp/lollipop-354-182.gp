\\ Must set maximal stack size as big as possible. 
\\ A safe value is half of the system memory.
\\ This script was tested with parisizemax = 8G.
\\ By default all variables are global.

D=11984649;
x=148050398434362621716956241060772527011598270495837764; 
if(!issquare(((3*x-2)^2+8)/(3*D)), error("assertion failed"));
if(!issquare((4*(x^2-x+1)-x^2)/D), error("assertion failed"));

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
bCalhat=(3152415216999630016732418800721053616328491327804020801096030843594467566828731132616477379978861940189707*root^2 +        14245305942739993852001953773900562503245113129119846849067379843841259716215668949675914443640885052778731)*root +        6569369186549766455411303531845877085214372573360227453768878754416675324178837091878540259806079037132996*root^2 +        20678878790494399350323129246378587457019906866527909675667431542335931906028698588394413166980916454814935;
aCalhat= (5289535699640842410731481012244074569738276372875743386365004776931511852990042292849627022126739144285546*root^2 +        18687002469823254447746833679231452066780836870778916750722535301389495776527790011402013337237143846871838)*root +        21227743127116372695909786163571369378417286024520070536716507925502815671917400333956773553520823186680033*root^2 +        7054000215265825127520334112166075207875017286871801935479388571085856439311131439034407583261088223692518;
ECalhat=ellinit([aCalhat,bCalhat], nu);
if(!(ellmul(ECalhat, random(ECalhat), (p^2+1)^2) == [0]), error("assertion failed")); 


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct E
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
a=4931272734379042324546627480672493946953186816541191713263611070456748753276694059968624305544115165244531;
b=19608082442390837172006958228408170889581692634239486750940142603497561667995754919945528028710941699718166;
E=ellinit([a,b],p);
h=5834265205101705653173060000604386256798782198769690;
r=3756929057219883666227531396958400808844831162374992793;
if(!ispseudoprime(r), error("assertion failed")); 
N=h*r;
if(!(ellmul(E,random(E),N) == [0]), error("assertion failed")); 
if(!(polcyclo(4,p)%r == 0), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold and Eboldhat: D=-18403
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rhat=3756929057219883666227531398672325357531137771763150651;
if(!ispseudoprime(rhat), error("assertion failed")); 

abold=2113378115523827708306635672960741373816143934973649948;
bbold=3287101883392111915841791447995318870057374454802685690;
Ebold=ellinit([abold,bbold],r);

aboldhat=1355922423682260700378649141390678330573347616240158723;
bboldhat=1045084209855362265470233115890968696384442539282833205;
Eboldhat=ellinit([aboldhat,bboldhat], rhat);

if(!(ellmul(Ebold, random(Ebold), rhat) == [0]), error("assertion failed")); 
if(!(ellmul(Eboldhat, random(Eboldhat), r) == [0]), error("assertion failed")); 


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_W
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
b=7906;
Ebold_W=ellinit([-3,b],r);
N_W=3756929057219883666227531398355970043571314463948004619;
Ebold_Wt=ellinit(elltwist(Ebold_W));
N_Wt=3756929057219883666227531395560831574118347860801980969;
if(!ispseudoprime(N_W), error("assertion failed")); 
if(!ispseudoprime(N_Wt), error("assertion failed")); 
if(!(ellmul(Ebold_W, random(Ebold_W), N_W) == [0]), error("assertion failed")); 
if(!(ellmul(Ebold_Wt, random(Ebold_Wt), N_Wt) == [0]), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_Ed
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
d=2758;
Ebold_Ed=ellfromeqn(-'X^2+'Y^2-(1+d*'X^2*'Y^2));
E_Ed=ellinit(Ebold_Ed, r);
r_Ed=469616132152485458278441424265440778940645065979380779;
E_Edt=ellinit(elltwist(E_Ed));
r_Edt=939232264304970916556882849948318846541125449228734839;
if(!ispseudoprime(r_Ed), error("assertion failed")); 
if(!ispseudoprime(r_Edt), error("assertion failed")); 
N_Ed=2^3*r_Ed;
N_Edt=2^2*r_Edt;
if(!(ellmul(E_Ed, random(E_Ed), N_Ed) == [0]), error("assertion failed")); 
if(!(ellmul(E_Edt, random(E_Edt), N_Edt) == [0]), error("assertion failed")); 
