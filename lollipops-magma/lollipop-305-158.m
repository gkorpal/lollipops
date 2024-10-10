clear;

D:=54105234;
x:=8004046504391788107635887004283725454478544674; 
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
//jp:=800209402955586643427014648226512319436234100021743492525228281256369516521375516707068;
//Ep:=QuadraticTwist(EllipticCurveFromjInvariant(Fp!jp));
a:=11875228336988574493882712067711066361723405878662955689469453989104183434229646197784790728;
b:=44530775641606776770556944911003809865281631340093296710155954546346967839351469608314023792;
E:=EllipticCurve([Fp|a,b]);
h:=241268331607910700786843106086978860074363930;
r:=265533234376483119496574875659819072867998144101;
assert IsPrime(r: Proof:=false);
N:=h*r;
assert N*Random(E) eq E!0;
assert Evaluate(CyclotomicPolynomial(4),p) mod r eq 0; 

////////////////////////////////////////////////////////////
//Construct Ebold and Eboldhat: D=-3
////////////////////////////////////////////////////////////
Fr:=GF(r);
rhat:=265533234376483119496575739829042558313583244851;
Frhat:=GF(rhat);

Ebold:=EllipticCurve([Fr|0,2]);
assert IsPrime(rhat: Proof:=false);
assert rhat*Random(Ebold) eq Ebold!0;
Eboldhat:=EllipticCurve([Frhat|0,2]);
assert r*Random(Eboldhat) eq Eboldhat!0;

// Endomorphism/GLV stuff
xi:=201995564210763657561150927151636529199003909898;
assert Fr!(xi^2+xi+1) eq 0;
xihat:=74004447349370358008673518004330011864009742077;
assert Frhat!(xihat^2+xihat+1) eq 0;
P:=Random(Ebold);
assert xihat*P eq Ebold![xi*P[1],P[2]];
Q:=Random(Eboldhat);
assert xi*Q eq Eboldhat![xihat*Q[1],Q[2]];

////////////////////////////////////////////////////////////
//Construct Ebold_W
////////////////////////////////////////////////////////////
b:=7032;
Ebold_W:=EllipticCurve([Fr|-3,b]);
N_W:=265533234376483119496574734837097781926465080331;
Ebold_Wt:=QuadraticTwist(Ebold_W);
N_Wt:=265533234376483119496575016482540363809531207873;
assert IsPrime(N_W: Proof:=false);
assert IsPrime(N_Wt: Proof:=false);
assert N_W*Random(Ebold_W) eq Ebold_W!0;
assert N_Wt*Random(Ebold_Wt) eq Ebold_Wt!0;

////////////////////////////////////////////////////////////
//Construct Ebold_Ed
////////////////////////////////////////////////////////////
d:=7821;
AS<X,Y>:=AffineSpace(Fr,2);
Ebold_Ed:=Curve(AS,-X^2+Y^2-(1+d*X^2*Y^2));
E_Ed:=EllipticCurve(ProjectiveClosure(Ebold_Ed),Ebold_Ed![0,1]);
r_Ed:=33191654297060389937071768190248354565572759639;
E_Edt:=QuadraticTwist(E_Ed);
r_Edt:=66383308594120779874143901449412827302853552773;
assert IsPrime(r_Ed: Proof:=false);
assert IsPrime(r_Edt: Proof:=false);
N_Ed:=2^3*r_Ed;
N_Edt:=2^2*r_Edt;
assert N_Ed*Random(E_Ed) eq E_Ed!0;
assert N_Edt*Random(E_Edt) eq E_Edt!0;
