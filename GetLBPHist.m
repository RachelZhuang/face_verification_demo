function  FinalHist=GetLBPHist(I)
FinalHist=[];
 I=rgb2gray(I);
I=imresize(I,[130 150]);

XStep=18;
YStep=21;

mapping=getmapping(8,'u2');

for YLocation=0:6
    for XLocation=0:6
      % imshow(I(1+XLocation*XStep:(1+(XLocation+1)*XStep),1+YLocation*YStep:(1+(YLocation+1)*YStep)));
      TempImage= I(1+XLocation*XStep:(1+(XLocation+1)*XStep),1+YLocation*YStep:(1+(YLocation+1)*YStep));
       TempHist=LBP(TempImage,2,8,mapping,'h'); %LBP histogram in (8,1) neighborhood
       FinalHist=[FinalHist;TempHist];
    end
end

%  FinalHist=reshape(FinalHist,[1,2891]);

