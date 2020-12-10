...ILoadCallback.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     INTERFACE rssw.pct.ILoadCallback:
      2         METHOD PUBLIC VOID beforeUnfreeze().
      3         METHOD PUBLIC VOID beforeFileList().
      4         METHOD PUBLIC VOID beforeFile(file AS CHARACTER).
      5         METHOD PUBLIC VOID afterFile(file AS CHARACTER, logger AS rssw.p
      5     ct.LoadLogger).
      6         METHOD PUBLIC VOID afterFileList().
      7         METHOD PUBLIC VOID beforeRefreeze().
      8         METHOD PUBLIC VOID afterRefreeze().
      8     END INTERFACE.
...ILoadCallback.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...ILoadCallback.cls    2 Method      No   Method beforeUnfreeze            
...ILoadCallback.cls    3 Method      No   Method beforeFileList            
...ILoadCallback.cls    4 Method      No   Method beforeFile                
...ILoadCallback.cls    5 Method      No   Method afterFile                 
...ILoadCallback.cls    6 Method      No   Method afterFileList             
...ILoadCallback.cls    7 Method      No   Method beforeRefreeze            
...ILoadCallback.cls    8 Method      No   Method afterRefreeze             
...ILoadCallback.cls    0 Interface   No                                    
