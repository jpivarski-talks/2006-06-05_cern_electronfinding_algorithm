%!
% PostScript prologue for pst-grad.tex.
% Version 1.04, 2004/06/23 (adding %GradientCircle style - D.G.)
% prepared by Herbert Voss
% For copying restrictions, see pstricks.tex.
%
% For the PSTricks gradient fillstyle.%
% Based on some EPS files by leeweyr!bill@nuchat.sccsi.com (W. R. Lee).%
% Syntax:% D.G. modification begin - Apr.  9, %1998
%%%%%% R0 G0 B0 R1 G1 B1 NumLines MidPoint Angle GradientFill
%   ifGradientCircle GradientScale %GradientPosX GradientPosY
%     R0 G0 B0 R1 G1 B1 NumLines MidPoint %Angle GradientFill
% D.G. modification end
%
/tx@GradientDict 40 dict def
tx@GradientDict begin
/GradientFill {
 rotate
 /MidPoint ED
 /NumLines ED
 /LastBlue ED
 /LastGreen ED
  /LastRed ED
  /FirstBlue ED
  /FirstGreen ED
/FirstRed ED
% D.G. modification begin - Apr.  9, 1998
/GradientPosY ED
/GradientPosX ED
  /GradientScale ED
  /ifGradientCircle ED
% D.G. modification end
  % This avoids gaps due to rounding errors:
    clip
  pathbbox           %leave llx,lly,urx,ury on stack
% D.G. modification begin - Apr. 10, 1998
  4 copy /ury ED /urx ED /lly ED /llx ED
% D.G. modification end
  /y ED /x ED
% D.G. modification begin - Apr. 10, 1998
ifGradientCircle
   {0 GradientPosX eq
    {0 GradientPosX eq {2 copy translate} if} if}
   {2 copy translate} ifelse
% D.G. modification end
    y sub neg /y ED
  x sub neg /x ED  % This avoids gaps due to rounding errors:
  LastRed FirstRed add 2 div
   LastGreen FirstGreen add 2 div
  LastBlue FirstBlue add 2 div
    setrgbcolor
% D.G. modification begin - Jul. 23, 1997 / Apr.  9, 1998
  ifGradientCircle
   {/YSizePerLine y NumLines div def
    /CurrentY y 2 div def
    /MidLine NumLines 2 div 1 MidPoint sub mul abs cvi def}
       {fill
    /YSizePerLine y NumLines div def
        /CurrentY 0 def
    /MidLine NumLines 1 MidPoint sub mul abs cvi def} ifelse
% DG modification end
  MidLine NumLines 2 sub gt
    { /MidLine NumLines def }
  { MidLine 2 lt { /MidLine 0 def } if }
   ifelse
    MidLine 0 gt
      {
    /Red FirstRed def
       /Green FirstGreen def
           /Blue FirstBlue def
    /RedIncrement LastRed FirstRed sub MidLine 1 sub div def
    /GreenIncrement LastGreen FirstGreen sub MidLine 1 sub div def
    /BlueIncrement LastBlue FirstBlue sub MidLine 1 sub div def
    MidLine { GradientLoop } repeat
      } if
       MidLine NumLines lt
         {
    /Red LastRed def
       /Green LastGreen def
       /Blue LastBlue def
    /RedIncrement FirstRed LastRed sub NumLines MidLine sub 1 sub div def
    /GreenIncrement FirstGreen LastGreen sub NumLines MidLine sub 1 sub div def
    /BlueIncrement FirstBlue LastBlue sub NumLines MidLine sub 1 sub div def
    NumLines MidLine sub { GradientLoop } repeat  }
     if
     } def/GradientLoop {
% D.G. modification begin - Jul. 23, 1997 / Apr.  9, 1998
  ifGradientCircle
   {CurrentY 0 gt {
% The default center used is the center of the bounding box of the object
      0 GradientPosX eq        {0 GradientPosX eq
           {/GradientPosX urx llx sub 2 div def
            /GradientPosY ury lly sub 2 div def} if} if
      GradientPosX GradientPosY CurrentY GradientScale mul 0 360 arc
      Red Green Blue setrgbcolor fill
      /CurrentY CurrentY YSizePerLine sub def
      /Blue Blue BlueIncrement add def
      /Green Green GreenIncrement add def
      /Red Red RedIncrement add def} if}   {0 CurrentY moveto    x 0 rlineto
    0 YSizePerLine rlineto    x neg 0 rlineto    closepath
    Red Green Blue setrgbcolor fill    /CurrentY CurrentY YSizePerLine add def
    /Blue Blue BlueIncrement add def    /Green Green GreenIncrement add def
    /Red Red RedIncrement add def} ifelse% D.G. modification end
    }def
    end
% END pst-grad.pro
