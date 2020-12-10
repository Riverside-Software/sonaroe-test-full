...\ABLUnitTest1.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     ROUTINE-LEVEL ON ERROR UNDO, THROW.
      2     
      3     USING OpenEdge.Core.Assert.
      4     
      5     CLASS ABLUnitTest1:
      6     
      7     @Test.
      8     METHOD PUBLIC VOID test1():
      9       def var xx as handle no-undo.
     10       run testProfiler.p persistent set xx.
     11       run test1 in xx.
     12       delete procedure xx.
     13       define variable zzz as rssw.StaticLoad.
     14       zzz = new rssw.StaticLoad().
     15       zzz:LoadEntity().
     16      END METHOD.
     17      
     17     END CLASS.
...\ABLUnitTest1.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...\ABLUnitTest1.cls    8 Method      No   Method test1                     
...\ABLUnitTest1.cls   18 Constructor No   Constructor ABLUnitTest1         
...\ABLUnitTest1.cls    0 Class       No                                    
