...sw\StaticLoad.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     block-level on error undo, throw.
      2     
      3     class rssw.StaticLoad:
      4       define variable lIsInitialized as logical no-undo.
      5     
      6       constructor public StaticLoad():
      7         // Nothing
      8       end constructor.
      9     
     10       method public void LoadEntity():
     11         EnsureInitialized().
     12         message "StaticLoad".
     13       end method.
     14     
     15       method private void EnsureInitialized():
     16         if not lIsInitialized then
     17   1     do:
     18   1       message "StaticLoad".
     19   1       lIsInitialized = true.
     20         end.
     21       end method.
     21     end class.
...sw\StaticLoad.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...sw\StaticLoad.cls    6 Constructor No   Constructor StaticLoad           
...sw\StaticLoad.cls   10 Method      No   Method LoadEntity                
...sw\StaticLoad.cls   15 Method      No   Method EnsureInitialized         
...sw\StaticLoad.cls   17 Do          No                                    
...sw\StaticLoad.cls    0 Class       No                                    
