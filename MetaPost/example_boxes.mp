input boxes;

prologues := 3;
outputtemplate := "%j.%3c";

beginfig(1);
    u=1bp;
    boxjoin(a.se=b.sw; a.ne=b.nw);
    boxit.a(btex\strut$\cdots$ etex);    boxit.ni(btex\strut$n_i$ etex);
    boxit.di(btex\strut$d_i$ etex);      boxit.ni1(btex\strut$n_{i+1}$ etex);
    boxit.di1(btex\strut$d_{i+1}$ etex); boxit.aa(btex\strut$\cdots$ etex);
    boxit.nk(btex\strut$n_k$ etex);      boxit.dk(btex\strut$d_k$ etex);
    drawboxed(di,a,ni,di,ni1,di1,aa,nk,dk); label.lft("ndtable:", a.w shifted (-20bp,0));

    interim defaultdy:=7u;
    boxjoin(a.sw=b.nw; a.se=b.ne);
    boxit.ba(); boxit.bb(); boxit.bc();
    boxit.bd(btex $\vdots$ etex); boxit.be(); boxit.bf();
    bd.dx=8u; ba.ne=a.sw-(15u,10u);
    drawboxed(ba,bb,bc,bd,be,bf); label.lft("hashtab:", ba.w shifted (-20bp,0));

    vardef ndblock suffix $ =
      boxjoin(a.sw=b.nw; a.se=b.ne);
      forsuffixes $$=$1,$2,$3: boxit.$$(); ($$.dx,$$.dy)=(5.5u,4u);
      endfor; enddef;
    ndblock nda; ndblock ndb; ndblock ndc;
    nda1.c-bb.c = ndb1.c-nda3.c = (whatever,0);
    xpart ndb3.se = xpart ndc1.ne = xpart di.c;
    ndc1.c - be.c = (whatever,0);
    drawboxed(nda1,nda2,nda3, ndb1,ndb2,ndb3, ndc1,ndc2,ndc3);

    drawarrow bb.c--nda1.w;
    drawarrow be.c--ndc1.w;
    drawarrow nda3.c--ndb1.w;
    drawarrow nda1.c{right}..{curl0}ni.c cutafter bpath ni;
    drawarrow nda2.c{right}..{curl0}di.c cutafter bpath di;
    drawarrow ndb1.c{right}..{curl10}nk.c cutafter bpath nk;
    drawarrow ndb2.c{right}..{curl10}dk.c cutafter bpath dk;
    drawarrow ndc1.c{right}..{curl0}ni1.c cutafter bpath ni1;
    drawarrow ndc2.c{right}..{curl0}di1.c cutafter bpath di1;

    x.ptr=xpart aa.c; y.ptr=ypart ndc1.ne;
    drawarrow subpath (0,.7) of (z.ptr..{left}ndc3.c) dashed evenly;
    label.urt(btex {\tt ndblock} etex, z.ptr. shifted (-10bp,0));
endfig;

beginfig(2);
    vardef drawshadowed(text t) =
      fixsize(t);
      forsuffixes s=t:
        fill bpath.s shifted (1pt,-1pt);
        unfill bpath.s;
        drawboxed(s);
      endfor;
    enddef;

    circleit.a(btex Box 1 etex);
    circleit.b(btex Box 2 etex);
    boxit.c(btex Box 3 etex);
    b.n = a.s - (0,20pt);
    c.n = b.s - (0,20pt);
    drawshadowed(a,b,c);
    drawarrow a.s--b.n;
    drawarrow b.s--c.n;
endfig;

beginfig(3);
    vardef cuta(suffix a,b) expr p =
      drawarrow p cutbefore bpath.a cutafter bpath.b;
      point .5*length p of p
    enddef;

    vardef self@# expr p =
      cuta(@#,@#) @#.c{curl0}..@#.c+p..{curl0}@#.c
    enddef;

    verbatimtex \def\stk#1#2{$\matrix{#1\cr#2\cr}$} etex
    circleit.aa(btex\strut Start etex); aa.dx=aa.dy;
    circleit.bb(btex\stk B{(a|b)^*a} etex);
    circleit.cc(btex\stk C{b^*} etex);
    circleit.dd(btex\stk D{(a|b)^*ab} etex);
    circleit.ee(btex\strut Stop etex); ee.dx=ee.dy;

    numeric hsep;
    bb.c-aa.c = dd.c-bb.c = ee.c-dd.c = (hsep,0);
    cc.c-bb.c = (0,.8hsep);
    xpart(ee.e-aa.w)=3.8in;
    drawboxed(aa,bb,cc,dd,ee);

    label.ulft(btex$b$etex, cuta(aa,cc) aa.c{dir50}..cc.c);
    label.top(btex$b$etex, self.cc(0,30pt));
    label.rt(btex$a$etex, cuta(cc,bb) cc.c..bb.c);
    label.top(btex$a$etex, cuta(aa,bb) aa.c..bb.c);
    label.llft(btex$a$etex, self.bb(-20pt,-35pt));
    label.top(btex$b$etex, cuta(bb,dd) bb.c..dd.c);
    label.top(btex$b$etex, cuta(dd,ee) dd.c..ee.c);
    label.lrt(btex$a$etex, cuta(dd,bb) dd.c..{dir140}bb.c);
    label.bot(btex$a$etex, cuta(ee,bb) ee.c..tension1.3 ..{dir115}bb.c);
    label.urt(btex$b$etex, cuta(ee,cc) ee.c{(cc.c-ee.c)rotated-15}..cc.c);
endfig;

bye
