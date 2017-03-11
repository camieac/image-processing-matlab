function out=chaincode4(image)

n=[0 1;-1 0;0 -1;1 0];

flag=1;
cc=[];
[x y]=find(image==1);
x=min(x);
imx=image(x,:);
y=min(find(imx==1));
first=[x y];
dir=3;

while flag==1,
  tt=zeros(1,4);
  newdir=mod(dir+3,4);
  for i=0:3,
    j=mod(newdir+i,4)+1;
    tt(i+1)=image(x+n(j,1),y+n(j,2));
  end
  d=min(find(tt==1));
  dir=mod(newdir+d-1,4);
  cc=[cc,dir];
  x=x+n(dir+1,1);y=y+n(dir+1,2);
  if x==first(1) & y==first(2)
    flag=0;
  end;
end;

out=cc;
   
