input TEX;

prologues := 3;
outputtemplate := "%j.%3c";
u := 1cm;

beginfig(1);
    draw (20,20)--(0,0)--(0,30)--(30,0)--(0,0);
endfig;

beginfig(2);
    uu := 10pt;
    draw (2uu,2uu)--(0,0)--(0,3uu)--(3uu,0)--(0,0);
    pickup pencircle scaled 4pt;
    for i=0 upto 2:
        for j=0 upto 2: drawdot (i*uu,j*uu); endfor;
    endfor;
endfig;

beginfig(3);
    uu := 1cm;
    draw (2uu,2uu)--(0,0)--(0,3uu)--(3uu,0)--(0,0);
    pickup pencircle scaled 4pt;
    for i=0 upto 2:
        for j=0 upto 2: drawdot (i*uu,j*uu); endfor;
    endfor;
endfig;

beginfig(4);
    u.orig := u;
    u := 0.5cm;
    z0=(0,0); z1=(6u,4u); z2=(4u,9u); z3=(1u,7u); z4=(3u,5u);
    draw z0..z1..z2..z3..z4;

    pickup pencircle scaled 4pt;
    drawdot z0;
    drawdot z1;
    drawdot z2;
    drawdot z3;
    drawdot z4;
    label.lft(btex $0$ etex, z0);
    label.lrt(btex $1$ etex, z1);
    label.top(btex $2$ etex, z2);
    label.lft(btex $3$ etex, z3);
    label.top(btex $4$ etex, z4);
    u := u.orig;
endfig;

beginfig(5);
    u.orig := u;
    u := 0.5cm;
    z0=(0,0); z1=(6u,4u); z2=(4u,9u); z3=(1u,7u); z4=(3u,5u);
    draw z0..z1..z2..z3..z4..cycle;

    pickup pencircle scaled 4pt;
    drawdot z0;
    drawdot z1;
    drawdot z2;
    drawdot z3;
    drawdot z4;
    label.lft(btex $0$ etex, z0);
    label.lrt(btex $1$ etex, z1);
    label.top(btex $2$ etex, z2);
    label.lft(btex $3$ etex, z3);
    label.top(btex $4$ etex, z4);
    u := u.orig;
endfig;

beginfig(6);
    u.orig := u;
    u := 0.5cm;
    z0=(0,0); z1=(6u,4u); z2=(4u,9u); z3=(1u,7u); z4=(3u,5u);
    draw z0..z1..z2..z3--z4--cycle;

    pickup pencircle scaled 4pt;
    drawdot z0;
    drawdot z1;
    drawdot z2;
    drawdot z3;
    drawdot z4;
    label.lft(btex $0$ etex, z0);
    label.lrt(btex $1$ etex, z1);
    label.top(btex $2$ etex, z2);
    label.lft(btex $3$ etex, z3);
    label.top(btex $4$ etex, z4);
    u := u.orig;
endfig;

beginfig(7);
    u.orig := u;
    u := 0.5cm;
    z0=(0,0); z1=(6u,4u); z2=(4u,9u); z3=(1u,7u); z4=(3u,5u);
    draw z0..z1{up}..z2{left}..z3..z4;

    pickup pencircle scaled 4pt;
    drawdot z0;
    drawdot z1;
    drawdot z2;
    drawdot z3;
    drawdot z4;
    label.lft(btex $0$ etex, z0);
    label.lrt(btex $1$ etex, z1);
    label.top(btex $2$ etex, z2);
    label.lft(btex $3$ etex, z3);
    label.top(btex $4$ etex, z4);
    u := u.orig;
endfig;

beginfig(8);
    for a=0 upto 9:
        draw (0,0){dir 45}..{dir -10a}(6u,0);
    endfor;
    pickup pencircle scaled 4pt;
    drawdot (0,0); drawdot (6u,0);
endfig;

beginfig(9);
    for a=0 upto 7:
        draw (0,0){dir 45}..{dir 10a}(6u,0);
    endfor;
    pickup pencircle scaled 4pt;
    drawdot (0,0); drawdot (6u,0);
endfig;

beginfig(10);
    z0=(0,0); z1=(3u,0.5u); z2=(6u,0);
    draw z0{up}..z1{right}..{down}z2;
    pickup pencircle scaled 4pt;
    drawdot z0; drawdot z1; drawdot z2;
endfig;

beginfig(11);
    z0=(0,0); z1=(3u,0.5u); z2=(6u,0);
    draw z0{up}...z1{right}...{down}z2;
    pickup pencircle scaled 4pt;
    drawdot z0; drawdot z1; drawdot z2;
endfig;

beginfig(12);
    z0=(0,0); z1=(1u,1u); z2=(3u,1u); z3=(4u,0);
    draw z0..z1..z2..z3;
    pickup pencircle scaled 4pt;
    drawdot z0; drawdot z1; drawdot z2; drawdot z3;
endfig;

beginfig(13);
    z0=(0,0); z1=(1u,1u); z2=(3u,1u); z3=(4u,0);
    draw z0..z1..tension 1.3..z2..z3;
    pickup pencircle scaled 4pt;
    drawdot z0; drawdot z1; drawdot z2; drawdot z3;
endfig;

beginfig(14);
    z0=(0,0); z1=(1u,1u); z2=(3u,1u); z3=(4u,0);
    draw z0..z1..tension 10 and 1..z2..z3;
    pickup pencircle scaled 4pt;
    drawdot z0; drawdot z1; drawdot z2; drawdot z3;
endfig;

beginfig(15);
    z0=(1u,0); z1=(0,2.5u); z2=(1u,5u);
    draw z0..z1..z2;
    pickup pencircle scaled 4pt;
    drawdot z0; drawdot z1; drawdot z2;
    label.bot(btex $c=0$ etex, z0);
endfig;

beginfig(16);
    z0=(1u,0); z1=(0,2.5u); z2=(1u,5u);
    draw z0{curl 1}..z1..{curl 1}z2;
    pickup pencircle scaled 4pt;
    drawdot z0; drawdot z1; drawdot z2;
    label.bot(btex $c=1$ etex, z0);
endfig;

beginfig(17);
    z0=(1u,0); z1=(0,2.5u); z2=(1u,5u);
    draw z0{curl 2}..z1..{curl 2}z2;
    pickup pencircle scaled 4pt;
    drawdot z0; drawdot z1; drawdot z2;
    label.bot(btex $c=2$ etex, z0);
endfig;

beginfig(18);
    z0=(1u,0); z1=(0,2.5u); z2=(1u,5u);
    draw z0{curl infinity}..z1..{curl infinity}z2;
    pickup pencircle scaled 4pt;
    drawdot z0; drawdot z1; drawdot z2;
    label.bot(btex $c=\infty$ etex, z0);
endfig;

beginfig(19);
    u.orig := u;
    u := 0.1in;
    z1=-z2=(2u,0);
    x3=-x6=3u;
    x3+y3=x6+y6=11u;
    z4=1/3[z3,z6];
    z5=2/3[z3,z6];
    z20=whatever[z1,z3]=whatever[z2,z4];
    z30=whatever[z1,z4]=whatever[z2,z5];
    z40=whatever[z1,z5]=whatever[z2,z6];
    z50=whatever[z6,z20]=whatever[z1,z30];
    draw z1--z20--z2--z30--z1--z40--z2;
    pickup pencircle scaled 1pt;
    draw z1--z2;
    draw z3--z6;

    pickup pencircle scaled 4pt;
    drawdot z1; drawdot z2; drawdot z3;
    drawdot z4; drawdot z5; drawdot z6;
    drawdot z20; drawdot z30; drawdot z40; drawdot z50;

    u := u.orig;
endfig;

beginfig(20);
    a=2.1u; b=1.5u;
    z0=(0,0);
    z1=-z3=(a,0);
    z2=-z4=(0,b);
    draw z1..z2..z3..z4..cycle;
    draw z1--z0--z2;
    label.top("a", .5[z0,z1]);
    label.lft("b", .5[z0,z2]);
    dotlabel.bot("(0,0)", z0);
endfig;

beginfig(21);
    u.orig := u;
    u := 0.5cm;
    z0=(0,0); z1=(6u,4u); z2=(4u,9u); z3=(1u,7u); z4=(3u,5u);
    draw z0..z1..z2..z3..z4;
    dotlabels.rt(1, 3, 4);
    dotlabels.top(0, 2);
    u := u.orig;
endfig;

beginfig(22);
    numeric ux, uy;
    120ux=2u; 4uy=4u;
    draw (0,4uy)--(0,0)--(120ux,0);

    pickup pencircle scaled 1pt;
    draw (0,uy){right}
        for ix=1 upto 8:
            ..(15ix*ux, uy*2/(1+cosd(15ix)))
        endfor;
    label.bot(btex $x$ axis etex, (60ux, 0));
    label.lft(btex $y$ axis etex rotated 90, (0, 2uy));
    label.lft(btex $y={2\over1+\cos x}$ etex, (120ux, 4uy));
endfig;

beginfig(23);
    draw (0,0)--(10u,0);
    n=10;
    t=10u/n;
    for i=0 upto n:
        dotlabel.bot(decimal(i), (i*t,0));
    endfor;
endfig;



beginfig(100);
    path p, p.a, p.b;
    p=(0,4u)..(4u,0)..(0,-4u);
    draw p..(-4u,0)..cycle;
    fill p{left}..(0,0){dir 10}..{left}cycle;

    p.a=(-.5u,-2u)..(0,-2.5u)..(.5u,-2u)..(0,-1.5u)..cycle;
    fill p.a withcolor white;
    p.b=(-.5u,2u)..(0,1.5u)..(.5u,2u)..(0,2.5u)..cycle;
    fill p.b withcolor black;
endfig;

beginfig(101);
    path a, b, aa, ab;
    a = fullcircle scaled 2u;
    b = a shifted (0,1u);
    aa = halfcircle scaled 2u;
    ab = buildcycle(aa, b);
    picture pa, pb;
    pa = thelabel(btex $A$ etex, (0,-.5u));
    pb = thelabel(btex $B$ etex, (0,1.5u));
    fill a withcolor .7white;
    fill b withcolor .7white;
    fill ab withcolor .4white;
    unfill bbox pa; draw pa;
    unfill bbox pb; draw pb;
    label.lft(btex $U$ etex, (-1u,.5u));
    draw bbox currentpicture;
endfig;

beginfig(102);
    h=5u; w=7u;
    path p[], q[], pp;
    for i=2 upto 4: ii:=i**2;
        p[i]=(w/ii,h){1,-ii}...(w/i,h/i)...(w,h/ii){ii,-1};
    endfor;
    q0.5=(0,0)--(w,.5h);
    q1.5=(0,0)--(w/1.5, h);
    pp=buildcycle(q0.5,p2,q1.5,p4);
    fill pp withcolor .7white;
    z0=center pp;
    picture lab; lab=thelabel.llft(btex $f>0$ etex, z0);
    unfill bbox lab; draw lab;
    draw q0.5; draw p2; draw q1.5; draw p4;
    dotlabel.top(btex $P$ etex, p2 intersectionpoint q0.5);
    dotlabel.rt(btex $Q$ etex, p2 intersectionpoint q1.5);
    dotlabel.lft(btex $R$ etex, p4 intersectionpoint q1.5);
    dotlabel.bot(btex $S$ etex, p4 intersectionpoint q0.5);
endfig;

beginfig(103);
    numeric scf, #, t[];
    3.2scf = 4.8u;
    path fun;
    #=.1; % keep the function single-valued
    fun=((0,-1#)..(1,.5#){right}..(1.9,.2#){right}..{curl .1}(3.2,2#))
      yscaled(1/#) scaled scf;
    x1=2.5scf;
    for i=1 upto 2:
        (t[i],whatever)=
          fun intersectiontimes ((x[i],-infinity)--(x[i],infinity));
        z[i]=point t[i] of fun;
        z[i]-(x[i+1],0)=whatever*direction t[i] of fun;
        draw (x[1],0)--z[i]--(x[i+1],0);
    endfor;
    draw (0,0)--(3.2scf,0);
    pickup pencircle scaled 1pt;
    draw fun;
    pickup pencircle scaled 3pt;
    for i=1 upto 2: dotlabel.ulft(TEX("$z_" & decimal(i) & "$"), z[i]); endfor;
    for i=1 upto 3: dotlabel.bot(TEX("$x_" & decimal(i) & "$"), (x[i],0)); endfor;
endfig;

beginfig(104);
    path p, p.delta;
    p=(0,0){right}..(1u,1u)..{right}(2u,2u);
    p:=p.. subpath (1,0) of p xscaled -1 shifted (4u,0);
    p.delta:=subpath(1,4) of p;
    for i=1 upto 5:
        p:=p.. p.delta shifted (4u*i,0);
    endfor;
    for i=0 upto 5:
        draw p shifted (0,4u*i);
    endfor;
    z0=center bbox currentpicture;
    path p.boundary;
    p.boundary = fullcircle scaled 24u shifted z0;
    clip currentpicture to p.boundary;
    draw p.boundary;
endfig;

bye;
