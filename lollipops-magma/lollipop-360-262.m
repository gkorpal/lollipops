clear;

D:=6515276374;
x:=1230329168549927690364550738403550755639033186629244094;
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
alpha:=mu+2;
Ecal:=EllipticCurve([Fp2|alpha,0]);
assert #Ecal eq (p^2+1);
assert (p^2+1) mod q eq 0;

////////////////////////////////////////////////////////////
//Construct E
////////////////////////////////////////////////////////////
//j is a root of Hilbert Class Polynomial H_D(X) in Fq[X]
//j:=757023331833527797384252737912885868573435332498308250643379865532295858559579722358498914114521165892011524;
//E:=EllipticCurveFromjInvariant(Fq!j);
a:=1051093542942544930879004927060350339221238101525439429241708948920055807280031821472542821371313220558906741;
b:=1017045011889443982659125604127854777652411261502524020138329822791962607936934974245614385660913949628074006;
E:=EllipticCurve([Fp|a,b]);
h:=225488763697014263798703835450;
r:=6713016818073936147660968606539230515637753786754504518215880141142440922918217;
assert IsPrime(r: Proof:=false);
N:=h*r;
assert N*Random(E) eq E!0;
assert Evaluate(CyclotomicPolynomial(4),p) mod r eq 0; 

////////////////////////////////////////////////////////////
//Construct Ebold and Eboldhat: D=-101971
////////////////////////////////////////////////////////////
Fr:=GF(r);
rhat:=6713016818073936147660968606539230515632823100596496911212356977956343512945531;
Frhat:=GF(rhat);

abold:=1034094063727089548232217510320934124825894914597869335387157826423048574097220;
bbold:=5912617615394799903003501083628756039067772805522546784673226435882427334049382 ;
Ebold:=EllipticCurve([Fr|abold,bbold]);

bboldhat:=1652088919578120865585029213094727352460095639732610447734765373466115680316141;
aboldhat:=2530463949247907641037969696722251581586363730431943231738795802245113916314695;
Eboldhat:=EllipticCurve([Frhat|aboldhat,bboldhat]);

////////////////////////////////////////////////////////////
//Construct Ebold_W
////////////////////////////////////////////////////////////
b:=43954;
Ebold_W:=EllipticCurve([Fr|-3,b]);
N_W:=6713016818073936147660968606539230515639615752124282780135319896831824859447657;
Ebold_Wt:=QuadraticTwist(Ebold_W);
N_Wt:=6713016818073936147660968606539230515635891821384726256296440385453056986388779;
assert IsPrime(N_W: Proof:=false);
assert IsPrime(N_Wt: Proof:=false);
assert N_W*Random(Ebold_W) eq Ebold_W!0;
assert N_Wt*Random(Ebold_Wt) eq Ebold_Wt!0;

////////////////////////////////////////////////////////////
//Construct Ebold_Ed
////////////////////////////////////////////////////////////
d:=119965;
AS<X,Y>:=AffineSpace(Fr,2);
Ebold_Ed:=Curve(AS,-X^2+Y^2-(1+d*X^2*Y^2));
E_Ed:=EllipticCurve(ProjectiveClosure(Ebold_Ed),Ebold_Ed![0,1]);
r_Ed:=1678254204518484036915242151634807628909239405004529701735737448756913017300287;
E_Edt:=QuadraticTwist(E_Ed);
r_Edt:=839127102259242018457621075817403814454818744186361278686101310907153722079411;
assert IsPrime(r_Ed: Proof:=false);
assert IsPrime(r_Edt: Proof:=false);
N_Ed:=2^2*r_Ed;
N_Edt:=2^3*r_Edt;
assert N_Ed*Random(E_Ed) eq E_Ed!0;
assert N_Edt*Random(E_Edt) eq E_Edt!0;

