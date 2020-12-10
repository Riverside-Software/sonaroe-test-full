...\ABLUnitTest2.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     ROUTINE-LEVEL ON ERROR UNDO, THROW.
      2     
      3     USING OpenEdge.Core.Assert.
      4     
      5     CLASS ABLUnitTest2:
      6     
      7     @Test.
      8     METHOD PUBLIC VOID test2():
      9       def var xx as handle no-undo.
     10       run testProfiler.p persistent set xx.
     11       run test2 in xx.
     12       delete procedure xx.
     13      END METHOD.
     14      
     14     END CLASS.
...\ABLUnitTest2.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...\ABLUnitTest2.cls    8 Method      No   Method test2                     
...\ABLUnitTest2.cls   15 Constructor No   Constructor ABLUnitTest2         
...\ABLUnitTest2.cls    0 Class       No                                    
