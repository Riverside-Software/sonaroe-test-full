...ample\coverage2.p                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     &GLOBAL-DEFINE COV2 TRUE
      2     
      3     MESSAGE "xxx".
      4     MESSAGE "xxx".
      5     MESSAGE "xxx".
      6     MESSAGE "xxx".
      7     MESSAGE "xxx".
      8     MESSAGE "xxx".
      9     MESSAGE "xxx".
     10     
     11     IF TRUE THEN
     12       MESSAGE "xxx".
     13     IF FALSE THEN
     14       MESSAGE "xxx".
     15     
     16     { sample/inc/coverage.i }
 1    1     &IF DEFINED(COV1) > 0 &THEN
 1    2       MESSAGE "xxx".
 1    3     &ENDIF
 1    4     
 1    5     &IF DEFINED(COV2) > 0 &THEN
 1    6       MESSAGE "xxx".
 1    7     &ENDIF
 1    8     
 1    9     
 1   10     PROCEDURE p1:
 1   11       MESSAGE "xyz".
 1   12     END PROCEDURE.
 1   13     
 1   14     
 1   15     PROCEDURE p2:
 1   16       MESSAGE "xyz".
 1   17     END PROCEDURE.
 1   18     
 1   19     
 1   20     PROCEDURE p3:
 1   21       MESSAGE "xyz".
 1   22     END PROCEDURE.
     16      
     17     
     18     RETURN.
...ample\coverage2.p                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...le\inc\coverage.i   10 Procedure   No   Procedure p1                     
...le\inc\coverage.i   15 Procedure   No   Procedure p2                     
...le\inc\coverage.i   20 Procedure   No   Procedure p3                     
...ample\coverage2.p    0 Procedure   No                                    
