clear;

D:=180658;
x:=56481599004467333072908231275414842979583674079035946; //10 mod 12
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
//jp:=1940273935448634464251452678759861143607347692535572694791000949238811509094736866755118514774710838759732;
//E:=EllipticCurveFromjInvariant(Fp!jp);
a:=2303038870540328217187531505620047942857924081697306597998565459881367424872326681378598895138380878565040;
b:=1774264311122234026558613049117462394391784544069405142011905271580392245722059450421085706031667605027862;
E:=EllipticCurve([Fp|a,b]);
h:=49992456550511609467578402491318795176805849602;
r:=63813047932104426082453413797282569427015011539084559319113;
assert IsPrime(r: Proof:=false);
N:=h*r;
assert N*Random(E) eq E!0;
assert Evaluate(CyclotomicPolynomial(4),p) mod r eq 0; 

////////////////////////////////////////////////////////////
//Construct Ebold and Eboldhat_left and Eboldhat_right: D=-3
////////////////////////////////////////////////////////////
Fr:=GF(r);
rhat_left:=63813047932104426082453413797741598558327689972782272862771;
rhat_right:=63813047932104426082453413796870275386988438007159089802987;
Frhat_left:=GF(rhat_left);
Frhat_right:=GF(rhat_right);

Ebold_left:=EllipticCurve([Fr|0,-5]); 
assert #Ebold_left eq rhat_left;
Eboldhat_left:=EllipticCurve([Frhat_left|0,-5]); 
assert #Eboldhat_left eq r;
Ebold_right:=EllipticCurve([Fr|0,28]); 
assert #Ebold_right eq rhat_right;
Eboldhat_right:=EllipticCurve([Frhat_right|0,28]); 
assert #Eboldhat_right eq r;

// Endomorphism/GLV stuff - TODO

////////////////////////////////////////////////////////////
//Construct Ebold_W
////////////////////////////////////////////////////////////
b:=7193;
Ebold_W:=EllipticCurve([Fr|-3,b]);
N_W:=63813047932104426082453413797284857424091899924243953147677;
Ebold_Wt:=QuadraticTwist(Ebold_W);
N_Wt:=63813047932104426082453413797280281429938123153925165490551;
assert IsPrime(N_W: Proof:=false);
assert IsPrime(N_Wt: Proof:=false);
assert N_W*Random(Ebold_W) eq Ebold_W!0;
assert N_Wt*Random(Ebold_Wt) eq Ebold_Wt!0;

////////////////////////////////////////////////////////////
//Construct Ebold_Ed
////////////////////////////////////////////////////////////
d:=128421;
AS<X,Y>:=AffineSpace(Fr,2);
Ebold_Ed:=Curve(AS,-X^2+Y^2-(1+d*X^2*Y^2));
E_Ed:=EllipticCurve(ProjectiveClosure(Ebold_Ed),Ebold_Ed![0,1]);
r_Ed:=15953261983026106520613353449256168076057068846093018823731;
E_Edt:=QuadraticTwist(E_Ed);
r_Edt:=7976630991513053260306676724692558318725218461724630417913;
assert IsPrime(r_Ed: Proof:=false);
assert IsPrime(r_Edt: Proof:=false);
N_Ed:=2^2*r_Ed;
N_Edt:=2^3*r_Edt;
assert N_Ed*Random(E_Ed) eq E_Ed!0;
assert N_Edt*Random(E_Edt) eq E_Edt!0; 