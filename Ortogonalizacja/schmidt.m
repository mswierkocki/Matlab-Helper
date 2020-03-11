function y=schmidt(A)


v1=[A(1,1) A(1,2) A(1,3)];
v2=[A(2,1) A(2,2) A(2,3)];
v3=[A(3,1) A(3,2) A(3,3)];

u1=v1';
u2=v2'-((v2*u1)/(u1'*u1))*u1;
u3=v3'-((v3*u1)/(u1'*u1))*u1-((v3*u2)/(u2'*u2))*u2;

n1=norm(u1);
n2=norm(u2);
n3=norm(u3);

e1=u1/n1;
e2=u2/n2;
e3=u3/n3;

B=[e1,e2,e3]

end
