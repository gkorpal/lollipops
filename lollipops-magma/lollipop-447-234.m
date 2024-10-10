clear;

D:=21781087203;
x:=17729424387014922081555931200582696053748170401607348253015001231446;
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
//j:=5656639318966564244581480010071907072714841728823017206103716536611421634281342866192415579;
//E:=EllipticCurveFromjInvariant(Fq!j);
a:=102639720601712691183825232138207982726842972642864893670359059747017275035636734698326125390959842847173662139124175289793028899926924;
b:=109053047891454063234634817456312076459497108839254159827893577916280134736880883342296128156566399432061944933867027985034838659397069;
E:=EllipticCurve([Fq|a,b]);
h:=19616373694628990016866294103181488622617504729360015054553738669;
r:=16023985573895568276682497362293441475247884415276660984033371799630727;
assert IsPrime(r: Proof:=false);
N:=h*r;
assert N*Random(E) eq E!0;
assert Evaluate(CyclotomicPolynomial(6),q) mod r eq 0; 

////////////////////////////////////////////////////////////
//Construct Ebold and Eboldhat: D=-6339
////////////////////////////////////////////////////////////
Fr:=GF(r);
rhat:=16023985573895568276682497362293441222275908594797800319450260289947421;
Frhat:=GF(rhat);

abold:=4588879636524711233687474270198449575314779382227717956540280863769;
bbold:=8155911072573195698522617987980686175010375977400005175416027480973272;
Ebold:=EllipticCurve([Fr|abold,bbold]);
aboldhat:=14345228124000935447303110805471044283741340994842813133729791750705862;
bboldhat:=292921935698584785381454703423080516557409715365387847749178860759814;
Eboldhat:=EllipticCurve([Frhat|aboldhat,bboldhat]);

assert r*Random(Eboldhat) eq Eboldhat!0;
assert rhat*Random(Ebold) eq Ebold!0;

////////////////////////////////////////////////////////////
//Construct Ebold_W
////////////////////////////////////////////////////////////
b:=10885;
Ebold_W:=EllipticCurve([Fr|-3,b]);
N_W:=16023985573895568276682497362293441353268749173654721391907057808885179;
Ebold_Wt:=QuadraticTwist(Ebold_W);
N_Wt:=16023985573895568276682497362293441597227019656898600576159685790376277;
assert IsPrime(N_W: Proof:=false);
assert IsPrime(N_Wt: Proof:=false);
assert N_W*Random(Ebold_W) eq Ebold_W!0;
assert N_Wt*Random(Ebold_Wt) eq Ebold_Wt!0;

////////////////////////////////////////////////////////////
//Construct Ebold_Ed
////////////////////////////////////////////////////////////
d:=-54523;
AS<X,Y>:=AffineSpace(Fr,2);
Ebold_Ed:=Curve(AS,X^2+Y^2-(1+d*X^2*Y^2));
E_Ed:=EllipticCurve(ProjectiveClosure(Ebold_Ed),Ebold_Ed![0,1]);
r_Ed:=4005996393473892069170624340573360313366196216928487423643288106031703;
E_Edt:=QuadraticTwist(E_Ed);
r_Edt:=4005996393473892069170624340573360424257745990709843068373397793783661;
assert IsPrime(r_Ed: Proof:=false);
assert IsPrime(r_Edt: Proof:=false);
N_Ed:=2^2*r_Ed;
N_Edt:=2^2*r_Edt;
assert N_Ed*Random(E_Ed) eq E_Ed!0;
assert N_Edt*Random(E_Edt) eq E_Edt!0;

