...es\sample\test1.p                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     def var zz as int no-undo.
      2     
      3     /* Some comments
      4     And accents é à ê ù
      5     <b>HTML escape ?</b>
      6     &lt;b&gt;Deuxième vérification&lt;/b&gt;
      7     Other alphabets: юллюм ρεκυε सार्वजनिक �
      7     ��発暮 ヱツヤ彼 🍺🍻🍽🍷😫🥂🥂😵🥃🥃😴
      8     */
      9     
     10     procedure foo :
     11      def input param prm1 as int.
     12      def output param prm2 as int no-undo.
     13     
     14      /* This is a very long line. This is a very long line. This is a ve
     14     ry long line. This is a very long line. This is a very long line. Th
     14     is is a very long line. This is a very long line. This is a very lon
     14     g line. This is a very long line. This is a very long line. This is 
     14     a very long line. This is a very long line. */
     15   1  for each customer where customer.custnum eq prm1 no-lock:
     16   1     prm2 = custnum.   
     17      end.
     18      
     19     end procedure.
     20     
     21     define new shared temp-table tt1 no-undo
     22      field a as char
     23      field b as char.
     24     define new shared buffer b1 for tt1.
     25     define new shared dataset ds1 for b1.
     26     
     27     { sample/inc/test.i}
 1    1     message "this is an include file".
 1    2     
 1    3     1 = 0.
 1    4     
 1    5     message "second message statement". 
 1    6     
     27      
     28     find first item exclusive-lock.
     29     disp item.itemnum.
     30     
     31     /* Backslash rule */
     32     message "C:\Temp\hello.txt".
     33     
     34     /* Comment level 1 /*
     35     
     36     Nested comment 1 */ Still level 1
     37      RUN VALUE(xxx) Should be commented
     38     */
     39     
...es\sample\test1.p                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

{} Line Blk
-- ---- ---
     40     
     41     /* One more comment /* Nested 1 */ Comment */
     42     def var obj as progress.lang.object.
     43     DEFINE VARIABLE foobar AS CHARACTER NO-UNDO initial "Progress.Lang.O
     43     bject".
     44     obj = DYNAMIC-NEW foobar ().
     45     
     46     DEFINE FRAME DEFAULT-FRAME 
     47         "Content of sample.txt" VIEW-AS TEXT
     48               SIZE 25 BY .62 AT ROW 1.48 COL 24 WIDGET-ID 4
     49               FONT 6
     50         WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
     51              SIDE-LABELS NO-UNDERLINE THREE-D 
     52              AT COL 1 ROW 1
     53              SIZE 73 BY 29.86 WIDGET-ID 100.
     54     DEFINE VARIABLE CtrlFrame AS WIDGET-HANDLE NO-UNDO.
     55     define variable obj2 as com-handle.
     56     CREATE CONTROL-FRAME CtrlFrame ASSIGN
     57            FRAME           = FRAME DEFAULT-FRAME:HANDLE
     58            ROW             = 21.95
     59            COLUMN          = 3
     60            HEIGHT          = 1.76
     61            WIDTH           = 7
     62            WIDGET-ID       = 28
     63            HIDDEN          = yes
     64            SENSITIVE       = yes.
     65     obj2:MyProperty:Yes = 2000 no-error.
     66     
     67     // System.ComponentModel.BrowsableAttribute:No.
     68     
     69     &IF OPSYS = "WIN32" &THEN
     70      MESSAGE "Win32".
     71     &ENDIF
     72     &IF OPSYS = "UNIX" &THEN
     73      MESSAGE "Unix".
     74     &ENDIF
     75     
     76     return '0'.
...es\sample\test1.p                  12/10/2020 16:12:21   PROGRESS(R) Page 3   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...es\sample\test1.p   10 Procedure   No   Procedure foo                    
...es\sample\test1.p   15 For         No                                    
...es\sample\test1.p    0 Procedure   Yes                                   
    Buffers: tt1
             sp2k.Item
             b1
             sp2k.Customer
    Frames:  DEFAULT-FRAME
             Unnamed

