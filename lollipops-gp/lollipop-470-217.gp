\\ Must set maximal stack size as big as possible. 
\\ A safe value is half of the system memory.
\\ This script was tested with parisizemax = 8G.
\\ By default all variables are global.

D=6965939657;
x=41017810644370519329494203616760901248076654180501723109501324253299656; 
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
mu=ffgen('x^2 + Mod(11,p), 'mu);
[root, map]=ffextend(mu, 'x^2-mu, 'nu);
nu=ffgen(root);
bCalhat=(608584255541102457636091363484192800083905884469305674745499770947890526090874253869814774360556679361800800581578197107967866473632327259626*root^2 +    113443062397016391844287922757380821664445323109775096539429151538045141653199708451854785290286042937874546593871039585188982462477883231366)*root +    (1409630242737695988734641801884426342166641732050313134184324236033017884079711427749065168990093552963659363378725033917120085301610462905406*root^2 +    523231640819266737123028666643221048414901466974061659533043924230118602521868480237325455587148006014823045984077078437745556459592928792356);
aCalhat= (1425760782400294083442314113122823819649585485569727741266407409114273806414602285303836616179518885548793530495643010274764793397290906660440*root^2 +    1457192760237996892214597895335455591171407829588833526766600050162156513064658789072762685083521783082374211625077046418386363313621974578051)*root +    (334828419654248449643394727486063473169606306089675371414510798590708405005862207422099118377236303409036142522755800484733557691763562892617*root^2 +    1054946265028572259667773408561670479234690096114748295919923348052652971497481548561267200523476705947709630891380197347570265622085860180083);
ECalhat=ellinit([aCalhat,bCalhat], nu);
if(!(ellmul(ECalhat, random(ECalhat), (p^2+1)^2) == [0]), error("assertion failed")); 


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct E
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
a=1327990018058997133681768793847459298412155220404619946408082869787021354355048628527823235522470852643487954761371206623471768271979222734845;
b=708941543996876688897277334443653439693630404247452418164940739285213127069641107370051700296315899700122891638230625431305175753000507367672;
E=ellinit([a,b],p);
h=9034012053615243147203403657060523197318728513853827060483599637973739779322;
r=186236279083128524985138411183953815550851100697371406634456158733;
if(!ispseudoprime(r), error("assertion failed")); 
N=h*r;
if(!(ellmul(E,random(E),N) == [0]), error("assertion failed")); 
if(!(polcyclo(4,p)%r == 0), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold and Eboldhat: D=-2003
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rhat=186236279083128524985138411183953117888342826972616244338768370521;
if(!ispseudoprime(rhat), error("assertion failed")); 

abold=96624061796766407320827550723318352944522575825349894983276301098;
bbold=124809371884429496704386448120873915025440467381259373541172188292;
Ebold=ellinit([abold,bbold],r);

aboldhat=97243965582893662407203964677095351893193890657934151620340077437;
bboldhat=177984627000469725155868893013715531990297872629364185436856586168;
Eboldhat=ellinit([aboldhat,bboldhat], rhat);

if(!(ellmul(Ebold, random(Ebold), rhat) == [0]), error("assertion failed")); 
if(!(ellmul(Eboldhat, random(Eboldhat), r) == [0]), error("assertion failed")); 


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_W
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
b=72802;
Ebold_W=ellinit([-3,b],r);
N_W=186236279083128524985138411183953630590261444990257941922428141081;
Ebold_Wt=ellinit(elltwist(Ebold_W));
N_Wt=186236279083128524985138411183954000511440756404484871346484176387;
if(!ispseudoprime(N_W), error("assertion failed")); 
if(!ispseudoprime(N_Wt), error("assertion failed")); 
if(!(ellmul(Ebold_W, random(Ebold_W), N_W) == [0]), error("assertion failed")); 
if(!(ellmul(Ebold_Wt, random(Ebold_Wt), N_Wt) == [0]), error("assertion failed")); 

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\Construct Ebold_Ed
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
d=70192;
Ebold_Ed=ellfromeqn(-'X^2+'Y^2-(1+d*'X^2*'Y^2));
E_Ed=ellinit(Ebold_Ed, r);
r_Ed=46559069770782131246284602795988496143782096646259527443306381869;
E_Edt=ellinit(elltwist(E_Ed));
r_Edt=23279534885391065623142301397994205815821726851213087936960848749;
if(!ispseudoprime(r_Ed), error("assertion failed")); 
if(!ispseudoprime(r_Edt), error("assertion failed")); 
N_Ed=2^2*r_Ed;
N_Edt=2^3*r_Edt;
if(!(ellmul(E_Ed, random(E_Ed), N_Ed) == [0]), error("assertion failed")); 
if(!(ellmul(E_Edt, random(E_Edt), N_Edt) == [0]), error("assertion failed")); 
