clear;

D:=7643719763;
x:=158112016600519825294361547928885069349099207469192475445707283316750;
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
alpha:=mu+5;
Ecal:=EllipticCurve([Fp2|alpha,0]);
assert #Ecal eq (p^2+1);
assert (p^2+1) mod q eq 0;

////////////////////////////////////////////////////////////
//Construct E
////////////////////////////////////////////////////////////

//j is a root of Hilbert Class Polynomial H_D(X) in Fq[X]
//j:=21200368945147155965564392198583851823143529302432948652370564382737946632326732101818177653033267869876782322058771353496170580995740283;
//E:=EllipticCurveFromjInvariant(Fq!j);
a:=621898060809982173546571637125599111835222955071190902248799926058604894994699912204051886820338386284289555971652049424070116612621763;
b:=2936381862790038565124859992826096035535552715769556026170392621904407785189417457634371214510913954259830930723873318537689274009841633;
E:=EllipticCurve([Fq|a,b]);
h:=40954707949342789074307395744291513357744157620318969740328272365769610935465767069;
r:=610416019188930118794105754798325252162723895746143279;
assert IsPrime(r: Proof:=false);
N:=h*r;
assert N*Random(E) eq E!0;
assert Evaluate(CyclotomicPolynomial(6),q) mod r eq 0; 

////////////////////////////////////////////////////////////
//Construct Ebold and Eboldhat: D=-355
////////////////////////////////////////////////////////////
Fr:=GF(r);
rhat:=610416019188930118794105754273315289195242361064452849;
Frhat:=GF(rhat);

abold:=465481882603591921229738951593928059885265891728802044;
bbold:=289868273170676395128733606408794384554916008034682470;
Ebold:=EllipticCurve([Fr|abold,bbold]);
aboldhat:=513602456866890504095995833435664977680392543204002229;
bboldhat:=193627124644079229396219841675300623029699635720901240;
Eboldhat:=EllipticCurve([Frhat|aboldhat,bboldhat]);

assert r*Random(Eboldhat) eq Eboldhat!0;
assert rhat*Random(Ebold) eq Ebold!0;

////////////////////////////////////////////////////////////
//Construct Ebold_W
////////////////////////////////////////////////////////////
b:=10827;
Ebold_W:=EllipticCurve([Fr|-3,b]);
N_W:=610416019188930118794105755946144876923965067837210093;
Ebold_Wt:=QuadraticTwist(Ebold_W);
N_Wt:=610416019188930118794105753650505627401482723655076467;
assert IsPrime(N_W: Proof:=false);
assert IsPrime(N_Wt: Proof:=false);
assert N_W*Random(Ebold_W) eq Ebold_W!0;
assert N_Wt*Random(Ebold_Wt) eq Ebold_Wt!0;

////////////////////////////////////////////////////////////
//Construct Ebold_Ed
////////////////////////////////////////////////////////////
d:=-68661;
AS<X,Y>:=AffineSpace(Fr,2);
Ebold_Ed:=Curve(AS,X^2+Y^2-(1+d*X^2*Y^2));
E_Ed:=EllipticCurve(ProjectiveClosure(Ebold_Ed),Ebold_Ed![0,1]);
r_Ed:=152604004797232529698526438828910589630859333410031231;
E_Edt:=QuadraticTwist(E_Ed);
r_Edt:=152604004797232529698526438570252036450502614463040409;
assert IsPrime(r_Ed: Proof:=false);
assert IsPrime(r_Edt: Proof:=false);
N_Ed:=2^2*r_Ed;
N_Edt:=2^2*r_Edt;
assert N_Ed*Random(E_Ed) eq E_Ed!0;
assert N_Edt*Random(E_Edt) eq E_Edt!0;

