clear;

D:=4381481154;
x:=179433202552152674325420281177914064019478082850499008508024089613222263102110060793970;
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
a:=11189630786967917918569989920556291313221506308381318713620035871426712249469722467924019721704266836238190272259395295783337267454789213850919964724965379224833495182720838;
b:=9817012604186013161879298018587954707585472715646684867987586571154185421875815818033518841545953831013606648867271087931674852247025026065598053838640842855480206362125255;
E:=EllipticCurve([Fp|a,b]);
h:=14883903673283751600600081739769260517820107973587213884386788220692603832212833216241358125642;
r:=2163160611951109656514578155686584121370430948758200237999126133244251338506461;
assert IsPrime(r: Proof:=false);
N:=h*r;
assert N*Random(E) eq E!0;
assert Evaluate(CyclotomicPolynomial(4),p) mod r eq 0; 

////////////////////////////////////////////////////////////
//Construct Ebold and Eboldhat: D=-3019
////////////////////////////////////////////////////////////
Fr:=GF(r);
rhat:=2163160611951109656514578155686584121369935567340260530653195705987773102423967;
Frhat:=GF(rhat);

abold:=63503527747388611582333066887794441315562335376825323092259041815357788037228;
bbold:=19079561647038263481032218280297845162395648286517491383518609244974643155213;
Ebold:=EllipticCurve([Fr|abold,bbold]);
aboldhat:=1600224790493789893768878688270410785959510786167424698577648903928123990501736;
bboldhat:=442173884976592923728839681693322529291546262090176625621658004289727200834915;
Eboldhat:=EllipticCurve([Frhat|aboldhat,bboldhat]);
assert rhat*Random(Ebold) eq Ebold!0;
assert r*Random(Eboldhat) eq Eboldhat!0;

////////////////////////////////////////////////////////////
//Construct Ebold_W
////////////////////////////////////////////////////////////
b:=7182;
Ebold_W:=EllipticCurve([Fr|-3,b]);
N_W:=2163160611951109656514578155686584121370195577040477869784449892886212602873541;
Ebold_Wt:=QuadraticTwist(Ebold_W);
N_Wt:=2163160611951109656514578155686584121370666320475922606213802373602290074139383;
assert IsPrime(N_W: Proof:=false);
assert IsPrime(N_Wt: Proof:=false);
assert N_W*Random(Ebold_W) eq Ebold_W!0;
assert N_Wt*Random(Ebold_Wt) eq Ebold_Wt!0;

////////////////////////////////////////////////////////////
//Construct Ebold_Ed
////////////////////////////////////////////////////////////
d:=75745;
AS<X,Y>:=AffineSpace(Fr,2);
Ebold_Ed:=Curve(AS,-X^2+Y^2-(1+d*X^2*Y^2));
E_Ed:=EllipticCurve(ProjectiveClosure(Ebold_Ed),Ebold_Ed![0,1]);
r_Ed:=270395076493888707064322269460823015171214052057993838677524486625322421228739;
E_Edt:=QuadraticTwist(E_Ed);
r_Edt:=540790152987777414128644538921646030342787370263112441644514093371480826795753;
assert IsPrime(r_Ed: Proof:=false);
assert IsPrime(r_Edt: Proof:=false);
N_Ed:=2^3*r_Ed;
N_Edt:=2^2*r_Edt;
assert N_Ed*Random(E_Ed) eq E_Ed!0;
assert N_Edt*Random(E_Edt) eq E_Edt!0;
