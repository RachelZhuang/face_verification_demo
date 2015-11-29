function  FinalHist = GetBOWHist(img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
load bag.mat


FinalHist=[];
 img=rgb2gray(img);
I=imresize(img,[120 165]);

XStep=23;
YStep=32;



for YLocation=0:4
    for XLocation=0:4
      % imshow(I(1+XLocation*XStep:(1+(XLocation+1)*XStep),1+YLocation*YStep:(1+(YLocation+1)*YStep)));
      TempImage= I(1+XLocation*XStep:(1+(XLocation+1)*XStep),1+YLocation*YStep:(1+(YLocation+1)*YStep));
      TempHist=encode(bag, TempImage);
     % imshow(TempImage);
       FinalHist=[FinalHist;TempHist];
    end
end


