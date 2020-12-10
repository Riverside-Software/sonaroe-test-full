...dDataCallback.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     CLASS rssw.pct.AbstractLoadDataCallback IMPLEMENTS rssw.pct.ILoadDat
      1     aCallback:
      2         METHOD PUBLIC VOID initialize(tableName as character): END METHO
      2     D.
      3         METHOD PUBLIC VOID onError(msg AS CHARACTER): END METHOD.
      4         METHOD PUBLIC VOID beforePurge(): END METHOD.
      5         METHOD PUBLIC VOID afterPurge(delCount AS INTEGER): END METHOD.
      6         METHOD PUBLIC VOID beforeSequenceValuesBackup(): END METHOD.
      7         METHOD PUBLIC VOID afterSequenceValuesBackup(): END METHOD.
      8         METHOD PUBLIC VOID beforeLoad(file AS CHARACTER): END METHOD.
      9         METHOD PUBLIC VOID afterLoad(file AS CHARACTER, logger AS rssw.p
      9     ct.LoadDataLogger): END METHOD.
      9     END CLASS.
...dDataCallback.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...dDataCallback.cls    2 Method      No   Method initialize                
...dDataCallback.cls    3 Method      No   Method onError                   
...dDataCallback.cls    4 Method      No   Method beforePurge               
...dDataCallback.cls    5 Method      No   Method afterPurge                
...dDataCallback.cls    6 Method      No   Method beforeSequenceValuesBackup
...dDataCallback.cls    7 Method      No   Method afterSequenceValuesBackup 
...dDataCallback.cls    8 Method      No   Method beforeLoad                
...dDataCallback.cls    9 Method      No   Method afterLoad                 
...dDataCallback.cls   10 Constructor No   Constructor AbstractLoadDataCallback
...dDataCallback.cls    0 Class       No                                    
