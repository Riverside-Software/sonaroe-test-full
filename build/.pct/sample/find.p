...res\sample\find.p                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     { sample/find.i customer }
 1    1     find
 1    2     {1}customer
 1    3     no-lock.
      1      
      2     { sample/find.i item }
 1    1     find
 1    2     {1}item
 1    3     no-lock.
      2      
      3     find first
      4     warehouse.
      5     
      6     for each customer where customer.name begins 'c' by customer.address
      6   1  desc:
      7   1   display customer.name.
      8     end.
      9     
...res\sample\find.p                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...res\sample\find.p    0 Procedure   No                                    
    Buffers: sp2k.Warehouse
             sp2k.Item
             sp2k.Customer

...res\sample\find.p    6 For         No                                    
    Frames:  Unnamed

