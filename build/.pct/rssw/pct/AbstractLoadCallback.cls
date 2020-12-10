...tLoadCallback.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     CLASS rssw.pct.AbstractLoadCallback IMPLEMENTS rssw.pct.ILoadCallbac
      1     k:
      2         METHOD PUBLIC VOID beforeUnfreeze(): END METHOD.
      3         METHOD PUBLIC VOID beforeFileList(): END METHOD.
      4         METHOD PUBLIC VOID beforeFile(file AS CHARACTER): END METHOD.
      5         METHOD PUBLIC VOID afterFile(file AS CHARACTER, logger AS rssw.p
      5     ct.LoadLogger): END METHOD.
      6         METHOD PUBLIC VOID afterFileList(): END METHOD.
      7         METHOD PUBLIC VOID beforeRefreeze(): END METHOD.
      8         METHOD PUBLIC VOID afterRefreeze(): END METHOD.
      8     END CLASS.
...tLoadCallback.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...tLoadCallback.cls    2 Method      No   Method beforeUnfreeze            
...tLoadCallback.cls    3 Method      No   Method beforeFileList            
...tLoadCallback.cls    4 Method      No   Method beforeFile                
...tLoadCallback.cls    5 Method      No   Method afterFile                 
...tLoadCallback.cls    6 Method      No   Method afterFileList             
...tLoadCallback.cls    7 Method      No   Method beforeRefreeze            
...tLoadCallback.cls    8 Method      No   Method afterRefreeze             
...tLoadCallback.cls    9 Constructor No   Constructor AbstractLoadCallback 
...tLoadCallback.cls    0 Class       No                                    
