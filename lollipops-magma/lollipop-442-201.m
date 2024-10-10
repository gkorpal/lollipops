clear;

D:=1121454146;
x:=3317224644025945269694638684177516115938888074672841991788374967010; //10 mod 12
assert x mod 12 eq 10;
p:=x^2-x+1;
q:=x^2+1;
assert IsPrime(p: Proof:=false);
assert IsPrime(q: Proof:=false);
Fp:=GF(p);
Fq:=GF(q);

////////////////////////////////////////////////////////////
//Construct Ecalhat
////////////////////////////////////////////////////////////
Fq3:=ExtensionField<Fq,x|IrreduciblePolynomial(Fq,3)>;
Ecalhat:=BaseChange(EllipticCurve([Fq|0,1]),Fq3);
assert #Ecalhat eq (q^3+1);
assert (q^3+1) mod p eq 0;

////////////////////////////////////////////////////////////
//Construct Ecal
////////////////////////////////////////////////////////////
Fp2<mu>:=ExtensionField<Fp,x|x^2+1>;
alpha:=mu+1;
Ecal:=EllipticCurve([Fp2|alpha,0]);
assert #Ecal eq (p^2+1);
assert (p^2+1) mod q eq 0;

////////////////////////////////////////////////////////////
//Construct E
////////////////////////////////////////////////////////////

//jp is a root of Hilbert Class Polynomial H_D(X) in Fp[X]
//jp:=5379610913271155105517612825788278908630442200010860100949724655437107215935375295574066029476443022458247577615808709143689789447855;
//E:=EllipticCurveFromjInvariant(Fp!jp);
a:=4803326728794468663626390194829331778895338526144733478615515393900336965002681786931840188621099989297090289744299435925687750325411;
b:=1397325881344121984800456363019642639728710686551070683803086548341519329599139248956509186373097960235293056453398808584854712722269;
E:=EllipticCurve([Fp|a,b]);
h:=4935046139870273988349682512315833133634620959295778882262884086321634498;
r:=2229762200201499528272701019745210508835564278399445301102209;
assert IsPrime(r: Proof:=false);
N:=h*r;
assert N*Random(E) eq E!0;
assert Evaluate(CyclotomicPolynomial(4),p) mod r eq 0; 

////////////////////////////////////////////////////////////
//Construct Ebold and Eboldhat: D=-427
////////////////////////////////////////////////////////////
Fr:=GF(r);
rhat:=2229762200201499528272701019742265293349415625667485813431141;
assert IsPrime(rhat: Proof:=false);
Frhat:=GF(rhat);
//poly<X>:=PolynomialRing(Fr);
//HD:=poly!HilbertClassPolynomial(D);
//j:=Roots(HD)[1][1];
//solve H_D(j)=0 \in Fr[x]
//j:=851947007825910512001540215301668275660311852569968388281288;
bbold:=1200717665182954841780928928282081481751610608236246931089567;
abold:= 1317711363071525099693414879498212140923035091876367618734600;
Ebold:=EllipticCurve([Fr|abold,bbold]);
//j:=574111498263101445097068761915661289685974034396083631156818;
bboldhat:=1763454315041673851604252530531750547165381487832165120731235;
aboldhat:=233153942579912838334224244605257373092017068917660346349953;
Eboldhat:=EllipticCurve([Frhat|aboldhat,bboldhat]);
assert rhat*Random(Ebold) eq Ebold!0;
assert r*Random(Eboldhat) eq Eboldhat!0;

////////////////////////////////////////////////////////////
//Construct Ebold_W
////////////////////////////////////////////////////////////
b:=1858;
Ebold_W:=EllipticCurve([Fr|-3,b]);
N_W:=2229762200201499528272701019747092900592017959342637189013849;
Ebold_Wt:=QuadraticTwist(Ebold_W);
N_Wt:=2229762200201499528272701019743328117079110597456253413190571;
assert IsPrime(N_W: Proof:=false);
assert IsPrime(N_Wt: Proof:=false);
assert N_W*Random(Ebold_W) eq Ebold_W!0;
assert N_Wt*Random(Ebold_Wt) eq Ebold_Wt!0;

////////////////////////////////////////////////////////////
//Construct Ebold_Ed
////////////////////////////////////////////////////////////
d:=80379;
AS<X,Y>:=AffineSpace(Fr,2);
Ebold_Ed:=Curve(AS,-X^2+Y^2-(1+d*X^2*Y^2));
E_Ed:=EllipticCurve(ProjectiveClosure(Ebold_Ed),Ebold_Ed![0,1]);
r_Ed:=278720275025187441034087627468402857892853911129741350845627;
E_Edt:=QuadraticTwist(E_Ed);
r_Edt:=557440550050374882068175254935799538632074316940239948859851;
assert IsPrime(r_Ed: Proof:=false);
assert IsPrime(r_Edt: Proof:=false);
N_Ed:=2^3*r_Ed;
N_Edt:=2^2*r_Edt;
assert N_Ed*Random(E_Ed) eq E_Ed!0;
assert N_Edt*Random(E_Edt) eq E_Edt!0;
