clear;

D:=137671666;
x:=691072084346106210015427268033026823331003052625284152082065984601703391121260234;;
assert x mod 12 eq 6;
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
Ecalhat:=BaseChange(EllipticCurveFromjInvariant(Fq!8000),Fq3);
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

//j is a root of Hilbert Class Polynomial H_D(X) in Fq[X]
//j:=354780602757573012278767568755507000243455835047183500199032285396903190501750941549433271462768356611384034026633330084450828271458107112544372450456442100949794;;
//E:=EllipticCurveFromjInvariant(Fq!j);
a:=251083915563600575864787005644273847086170493464723704717829288766304841571830607486234997719175755217988610410405595789812764876764196047462234071829291557837883;
b:=452993420397742319872816983013980109415419694426677621641762820010332498172617072601853144407183894796229378066063150267725211546055855207713124647356699341273280;
E:=EllipticCurve([Fp|a,b]);
h:=10064695807671222728787250221060914752293530029261216455438836514709600018557113577671004130;
r:=47451074020385591611288176533551815315750058833217955479034791008320633;
assert IsPrime(r: Proof:=false);
N:=h*r;
assert N*Random(E) eq E!0;
assert Evaluate(CyclotomicPolynomial(4),p) mod r eq 0; 

////////////////////////////////////////////////////////////
//Construct Ebold and Eboldhat: D=-22339
////////////////////////////////////////////////////////////
Fr:=GF(r);
rhat:=47451074020385591611288176533551815311730535822442936748695410727151323;
Frhat:=GF(rhat);
//Ebold:=WeierstrassModel(EllipticCurveFromjInvariant(Fr!-22339));
abold:= 8649752234474139686960921521702159449159223630097454623282594771441706;
bbold:=10474025714737379816085031060319894020251724028279394865863690001232405;
Ebold:=EllipticCurve([Fr|abold,bbold]);
//Eboldhat:=WeierstrassModel(EllipticCurveFromjInvariant(Frhat!-22339));
aboldhat:=30784255026589047569490815515178545203070510103856533939994634225308429;
bboldhat:=33333637987593088083594722036746540217320051437172805617401553003685788;
Eboldhat:=EllipticCurve([Frhat|aboldhat,bboldhat]);

assert r*Random(Eboldhat) eq Eboldhat!0;
assert rhat*Random(Ebold) eq Ebold!0;

////////////////////////////////////////////////////////////
//Construct Ebold_W
////////////////////////////////////////////////////////////
b:=11095;
Ebold_W:=EllipticCurve([Fr|-3,b]);
N_W:=47451074020385591611288176533551815357834142648176769812379316921921411;
Ebold_Wt:=QuadraticTwist(Ebold_W);
N_Wt:=47451074020385591611288176533551815273665975018259141145690265094719857;
assert IsPrime(N_W: Proof:=false);
assert IsPrime(N_Wt: Proof:=false);
assert N_W*Random(Ebold_W) eq Ebold_W!0;
assert N_Wt*Random(Ebold_Wt) eq Ebold_Wt!0;

////////////////////////////////////////////////////////////
//Construct Ebold_Ed
////////////////////////////////////////////////////////////
d:=101828;
AS<X,Y>:=AffineSpace(Fr,2);
Ebold_Ed:=Curve(AS,-X^2+Y^2-(1+d*X^2*Y^2));
E_Ed:=EllipticCurve(ProjectiveClosure(Ebold_Ed),Ebold_Ed![0,1]);
r_Ed:=5931384252548198951411022066693976869289402465803973440357948051005003;
E_Edt:=QuadraticTwist(E_Ed);
r_Edt:=11862768505096397902822044133387953919296224485001030858801499402150311;
assert IsPrime(r_Ed: Proof:=false);
assert IsPrime(r_Edt: Proof:=false);
N_Ed:=2^3*r_Ed;
N_Edt:=2^2*r_Edt;
assert N_Ed*Random(E_Ed) eq E_Ed!0;
assert N_Edt*Random(E_Edt) eq E_Edt!0;

