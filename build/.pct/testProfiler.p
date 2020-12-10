...ts\testProfiler.p                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     { sample/inc/testProfiler.i }
 1    1     message "Line is executed in unit tests".
 1    2     
 1    3     
 1    4     procedure test1:
 1    5      message "xxx".
 1    6     end procedure.
 1    7     
 1    8     procedure test2:
 1    9      message "xxx".
 1   10     end procedure.
      1      
      2     
      3     procedure test3:
      4      message "xxx".
      5     end procedure.
      6     
...ts\testProfiler.p                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...nc\testProfiler.i    4 Procedure   No   Procedure test1                  
...nc\testProfiler.i    8 Procedure   No   Procedure test2                  
...ts\testProfiler.p    3 Procedure   No   Procedure test3                  
...ts\testProfiler.p    0 Procedure   No                                    
