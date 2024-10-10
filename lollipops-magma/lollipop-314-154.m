clear;

D:=8162838387;
x:=135291617420619872112751781485200134095300092426;
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
//j:=5656639318966564244581480010071907072714841728823017206103716536611421634281342866192415579;
//E:=EllipticCurveFromjInvariant(Fq!j);
a:=5064290769459898582208668613767650426510501885481055887941469672159248590541526810792737109744;
b:=8175240205367577293438529262139138372585624261346115020528628026770915470614224162818668345989;
E:=EllipticCurve([Fq|a,b]);
h:=1122802646516678525727619619400231274145384512567;
r:=16301904703442006645510971103655842159455254409;
assert IsPrime(r: Proof:=false);
N:=h*r;
assert N*Random(E) eq E!0;
assert Evaluate(CyclotomicPolynomial(6),q) mod r eq 0; 

////////////////////////////////////////////////////////////
//Construct Ebold and Eboldhat: D=-67
////////////////////////////////////////////////////////////
Fr:=GF(r);
rhat:=16301904703442006645511207541928330293077277787;
Frhat:=GF(rhat);

//Ebold:=WeierstrassModel(EllipticCurveFromjInvariant(Fr!-147197952000));
abold:=3957254978293817915309205794304708781713941023;
bbold:=8387394746854370814892559515046424596027372363;
Ebold:=EllipticCurve([Fr|abold,bbold]);

//Eboldhat:=WeierstrassModel(EllipticCurveFromjInvariant(Frhat!-147197952000));
aboldhat:=9922049768246127253165759871026313902451805752;
bboldhat:=12759709870391758784690895341804032781250944070;
Eboldhat:=EllipticCurve([Frhat|aboldhat,bboldhat]);

assert r*Random(Eboldhat) eq Eboldhat!0;
assert rhat*Random(Ebold) eq Ebold!0;

////////////////////////////////////////////////////////////
//Construct Ebold_W
////////////////////////////////////////////////////////////
b:=17221;
Ebold_W:=EllipticCurve([Fr|-3,b]);
N_W:=16301904703442006645511066439252790128850480963;
Ebold_Wt:=QuadraticTwist(Ebold_W);
N_Wt:=16301904703442006645510875768058894190060027857;
assert IsPrime(N_W: Proof:=false);
assert IsPrime(N_Wt: Proof:=false);
assert N_W*Random(Ebold_W) eq Ebold_W!0;
assert N_Wt*Random(Ebold_Wt) eq Ebold_Wt!0;

////////////////////////////////////////////////////////////
//Construct Ebold_Ed
////////////////////////////////////////////////////////////
d:=4468;
AS<X,Y>:=AffineSpace(Fr,2);
Ebold_Ed:=Curve(AS,-X^2+Y^2-(1+d*X^2*Y^2));
E_Ed:=EllipticCurve(ProjectiveClosure(Ebold_Ed),Ebold_Ed![0,1]);
r_Ed:=4075476175860501661377790579776077182723202747;
E_Edt:=QuadraticTwist(E_Ed);
r_Edt:=2037738087930250830688847486025921948502212229;
assert IsPrime(r_Ed: Proof:=false);
assert IsPrime(r_Edt: Proof:=false);
N_Ed:=2^2*r_Ed;
N_Edt:=2^3*r_Edt;
assert N_Ed*Random(E_Ed) eq E_Ed!0;
assert N_Edt*Random(E_Edt) eq E_Edt!0;

