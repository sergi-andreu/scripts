function M = rnaint1x1
%RNAINT1x1 free energy values for 1x1 interior loops in RNA secondary
%structures
%
% Source: mfold 3.2 
% Temperature: 37C
% Unit: Kcal/mol
% Data arrangement: 
%
%             Y 
%     ------------------ 
% (X)  A    C    G    U   
%     ------------------ 
%         5' --> 3' 
%             X                                
%            i p 
%            j q 
%             Y 
%         3' <-- 5' 
% 
% M(X + (ij-1)*4, Y + (pq-1)*4)


%             Y                       Y                       Y                       Y                       Y                       Y 
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%      A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U   
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%         5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3' 
%             X                       X                       X                       X                       X                       X 
%            A A                     A C                     A G                     A U                     A G                     A U         
%            U U                     U G                     U C                     U A                     U U                     U G         
%             Y                       Y                       Y                       Y                       Y                       Y 
%         3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5' 

M=[...
  1.70  1.70  1.70  1.70  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70 
  1.70  1.70  1.70  1.70  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70 
  1.70  1.70 -0.40  1.70  1.10  1.10 -1.00  1.10  1.10  1.10 -1.00  1.10  1.70  1.70 -0.40  1.70  1.70  1.70 -0.40  1.70  1.70  1.70 -0.40  1.70 
  1.70  1.70  1.70  1.50  1.10  1.10  1.10  1.00  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.20  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70


%             Y                       Y                       Y                       Y                       Y                       Y 
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%      A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U   
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%         5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3' 
%             X                       X                       X                       X                       X                       X 
%            C A                     C C                     C G                     C U                     C G                     C U         
%            G U                     G G                     G C                     G A                     G U                     G G         
%             Y                       Y                       Y                       Y                       Y                       Y 
%         3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5' 

  1.10  1.10  1.10  1.10  0.40 -0.40  0.40  0.40  1.10  0.40  0.40  0.40  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10 
  1.10  1.10  1.10  1.10  0.30  0.50  0.40  0.50  0.40  0.40  0.40  0.40  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10 
  1.10  1.10 -1.00  1.10 -0.10  0.40 -1.70  0.40  0.40  0.40 -1.40  0.40  1.10  1.10 -1.00  1.10  1.10  1.10 -1.00  1.10  1.10  1.10 -1.00  1.10 
  1.10  1.10  1.10  1.10  0.40  0.00  0.40 -0.30  0.40  0.40  0.40  0.40  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10 
   
%             Y                       Y                       Y                       Y                       Y                       Y 
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%      A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U   
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%         5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3' 
%             X                       X                       X                       X                       X                       X 
%            G A                     G C                     G G                     G U                     G G                     G U         
%            C U                     C G                     C C                     C A                     C U                     C G         
%             Y                       Y                       Y                       Y                       Y                       Y 
%         3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5' 

  1.10  1.10  1.10  1.10  0.80  0.40  0.40  0.40  0.40  0.30 -0.10  0.40  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10 
  1.10  1.10  1.10  1.10  0.40  0.40  0.40  0.40 -0.40  0.50  0.40  0.00  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10 
  1.10  1.10 -1.00  1.10  0.40  0.40 -2.10  0.40  0.40  0.40 -1.70  0.40  1.10  1.10 -1.00  1.10  1.10  1.10 -1.00  1.10  1.10  1.10 -1.00  1.10 
  1.10  1.10  1.10  1.10  0.40  0.40  0.40 -0.70  0.40  0.50  0.40 -0.30  1.10  1.10  1.10  1.00  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10 

    
%             Y                       Y                       Y                       Y                       Y                       Y 
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%      A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U   
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%         5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3' 
%             X                       X                       X                       X                       X                       X 
%            U A                     U C                     U G                     U U                     U G                     U U         
%            A U                     A G                     A C                     A A                     A U                     A G         
%             Y                       Y                       Y                       Y                       Y                       Y 
%         3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5' 

  1.70  1.70  1.70  1.70  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70 
  1.70  1.70  1.70  1.70  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70 
  1.70  1.70 -0.40  1.70  1.10  1.10 -1.00  1.10  1.10  1.10 -1.00  1.10  1.70  1.70 -0.40  1.70  1.70  1.70 -0.40  1.70  1.70  1.70 -0.40  1.70 
  1.70  1.70  1.70  1.80  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.50  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70 
   
%             Y                       Y                       Y                       Y                       Y                       Y 
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%      A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U   
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%         5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3' 
%             X                       X                       X                       X                       X                       X 
%            G A                     G C                     G G                     G U                     G G                     G U         
%            U U                     U G                     U C                     U A                     U U                     U G         
%             Y                       Y                       Y                       Y                       Y                       Y 
%         3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5' 


  1.70  1.70  1.70  1.70  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70 
  1.70  1.70  1.70  1.70  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70 
  1.70  1.70 -0.40  1.70  1.10  1.10 -1.00  1.10  1.10  1.10 -1.00  1.10  1.70  1.70 -0.40  1.70  1.70  1.70 -0.40  1.70  1.70  1.70 -0.40  1.70 
  1.70  1.70  1.70  1.70  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70 

%    
%             Y                       Y                       Y                       Y                       Y                       Y 
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%      A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U        A    C    G    U   
%     ------------------      ------------------      ------------------      ------------------      ------------------      ------------------ 
%         5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3'               5' --> 3' 
%             X                       X                       X                       X                       X                       X 
%            U A                     U C                     U G                     U U                     U G                     U U         
%            G U                     G G                     G C                     G A                     G U                     G G         
%             Y                       Y                       Y                       Y                       Y                       Y 
%         3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5'               3' <-- 5' 

  1.70  1.70  1.70  1.70  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70 
  1.70  1.70  1.70  1.70  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70 
  1.70  1.70 -0.40  1.70  1.10  1.10 -1.00  1.10  1.10  1.10 -1.00  1.10  1.70  1.70 -0.40  1.70  1.70  1.70 -0.40  1.70  1.70  1.70 -0.40  1.70 
  1.70  1.70  1.70  1.70  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.10  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70  1.70 ];

