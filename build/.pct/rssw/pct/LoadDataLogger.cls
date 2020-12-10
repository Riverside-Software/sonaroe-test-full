...oadDataLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     ROUTINE-LEVEL ON ERROR UNDO, THROW.
      2     
      3     USING Progress.Lang.*.
      4     USING OpenEdge.DataAdmin.Binding.ITableDataMonitor FROM PROPATH.
      5     
      6     CLASS rssw.pct.LoadDataLogger IMPLEMENTS ITableDataMonitor:
      7       define stream sErr.
      8       DEFINE public VARIABLE errors AS LONGCHAR NO-UNDO.
      9     
     10         define public property loadException as logical initial false no
     10     -undo
     11             get.
     12             set.
     13     
     14         define public property bailed as logical no-undo
     15             get.
     16             set.
     17     
     18         define public property expectedRecords as int64 no-undo
     19             get.
     20             set.
     21     
     22         define public property FileName as character no-undo
     23             get.
     24             set.
     25     
     26         define public property TaskName as character no-undo
     27             get.
     28             set.
     29     
     30         define public property IsLoad as logical  no-undo
     31             get.
     32             set.
     33     
     34         define public property LogTime as datetime-tz  no-undo
     35             get.
     36     
     37         define public property StartTime as datetime-tz  no-undo
     38             get.
     39     
     40         define public property EndTime as datetime-tz  no-undo
     41             get.
     42     
     43         define public property NumSharedTables as integer no-undo
     44             get.
     45     
     46         define public property NumTenantTables as integer no-undo
     47             get.
     48     
     49         define public property NumGroupTables as integer no-undo
     50             get.
...oadDataLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

{} Line Blk
-- ---- ---
     51     
     52         define public property NumProcessedSharedTables as integer no-un
     52     do
     53             get.
     54     
     55         define public property NumProcessedTenantTables as integer no-un
     55     do
     56             get.
     57     
     58         define public property NumProcessedGroupTables as integer no-und
     58     o
     59             get.
     60     
     61         define public property NoLobs as logical no-undo
     62             get.
     63             set.
     64     
     65         define public property AnyError as logical no-undo
     66             get.
     67             set.
     68     
     69         define public property ErrorMessage as char no-undo
     70             get.
     71             set.
     72     
     73         define public property Interval as int no-undo
     74             get.
     75             set.
     76     
     77         define public property IsComplete as log no-undo
     78             get.
     79             set.
     80     
     81         define public property LogType as char no-undo
     82             get.
     83             set.
     84     
     85         define public property Cancel as logical no-undo
     86             get.
     87             set.
     88     
     89         define public property ConnectionUrl as character no-undo
     90             get.
     91             set.
     92     
     93         define public property CheckFiles as logical  no-undo
     94             get.
     95             set.
     96     
     97         define public property AnyFileExists as logical  no-undo
     98             get.
...oadDataLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 3   

{} Line Blk
-- ---- ---
     99     
    100         define public property Slash as character no-undo
    101             get.
    102             set.
    103     
    104         method public void AddSharedTables(pcPath as char, table-handle 
    104     htbl):
    105     
    106         end method.
    107     
    108         method public void AddGroupTables(pcPath as char, pcGroupdir as 
    108     char,  table-handle htbl):
    109     
    110         end method.
    111     
    112         method public void AddTenantTables(pcPath as char, pcTenant as c
    112     har, table-handle htbl):
    113     
    114         end method.
    115     
    116         method public void Export():
    117     
    118         end method.
    119     
    120         /**
    121            the actual file name used in the dump may differ, since the w
    121     e
    122            dump logic may change slashes and possibly also differences w
    122     ith relative
    123            name and full path (?)  so we pass both owner and file at sta
    123     rt */
    124         method public void StartTable(ptable as char, ptype as character
    124     ,powner as char,pfile as char):
    125           if dynamic-function('getParameter', 'silent') ne '' then
    126             message substitute("Loading data from &2 to &1...", ptable, 
    126     pfile).
    127         end method.
    128     
    129         method public void EndTable(pname as character):
    130           if dynamic-function('getParameter', 'silent') ne '' then
    131             message substitute("Loaded data in &1", pname).
    132         end method.
    133     
    134         method public void EndTable(pname as character,numrows as int64)
    134     :
    135           def var zz as char no-undo.
    136     
    137           /* NumRows is not set in 11.4 */
    138   1       if dynamic-function('getParameter', 'silent') ne '' then do:
    139             message substitute("Loaded &2 records from &1", pname, numro
    139   1 ws).
...oadDataLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 4   

{} Line Blk
-- ---- ---
    140           end.
    141     
    142           /* .e file location extracted from _loddata.p */
    143           file-info:file-name = SUBSTRING(pname,1,LENGTH(pname,"characte
    143     r") - 1,"character") + "e".
    144           if file-info:full-pathname ne ? and file-info:file-size gt 0 t
    144   1 hen do:
    145   1         message "Following errors were found during data load :".
    146   1         input stream sErr from value(file-info:full-pathname).
    147   2         repeat:
    148   2           import stream sErr unformatted zz.
    149   2           message zz.
    150   2           errors = errors + zz + "~n".
    151   1         end.
    152   1         input stream sErr close.
    153   1         message "End of file".
    154           end.
    155     
    156         end method.
    157     
    158         method public logical CountRow(pname as character):
    159     
    160         end method.
    161     
    162         METHOD PUBLIC LONGCHAR getErrors ():
    163           RETURN errors.
    164         END METHOD.
    165     
    166         /** called with any error logger may store all or just keep trac
    166     k of any  */
    167         method public void AddTableError(pname as character,e as Error):
    168           DEFINE VARIABLE zz AS INTEGER NO-UNDO.
    169     
    170           this-object:anyError = true.
    171   1       DO zz = 1 TO e:NumMessages:
    172   1         THIS-OBJECT:AddTableError(pname, e:GetMessage(zz)).
    173           END.
    174         end method.
    175     
    176         /** called with any error logger may store all or just keep trac
    176     k of any  */
    177         method public void AddTableError(pname as character,msg as char)
    177     :
    178           this-object:anyError = true.
    179           /* File is not even loaded, that should throw a BuildException
    179      */
    180           if (msg EQ 'Numeric Format error') then this-object:loadExcept
    180     ion = true.
    181           if (msg EQ 'The file can not be found') then this-object:loadE
    181     xception = true.
    182           if dynamic-function('getParameter', 'silent') ne '' then
...oadDataLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 5   

{} Line Blk
-- ---- ---
    183             message msg.
    184           errors = errors + msg + "~n".
    185         end method.
    186     
    187         /** set expected num rows   */
    188         method public void SetTableExpectedNumRows(pname as character,pi
    188     num as int64 ):
    189           this-object:expectedRecords = piNum.
    190         end method.
    191     
    192         /* set bailed so Endtable can decide whther to set isComplete tr
    192     ue false
    193            when less than expected     */
    194         method public logical SetTableBailed(pname as character):
    195           this-object:bailed = true.
    196           if dynamic-function('getParameter', 'silent') ne '' then
    197             message substitute("Number of errors exceed error tolerance"
    197     ).
    198         end method.
    199     
    200         method public void EndTask():
    201     
    202         end method.
    203     
    204         method public void BindFiles(h as handle):
    205     
    206         end method.
    207     
    208         method public void AddCDCPolicies (pcPath as character, table-ha
    208     ndle htbl):
    209     
    210         end method.
    211     
    212         method public void AddPolicyError (fname as character, pname as 
    212     character, e as class Progress.Lang.Error):
    213     
    214         end method.
    215     
    216         method public void AddPolicyError (fname as character, pname as 
    216     character, msg as character):
    217     
    218         end method.
    219     
    220         method public void EndPolicy (fname as character, pname as chara
    220     cter):
    221     
    222         end method.
    223     
    224         method public void EndPolicy (fname as character, pname as chara
    224     cter, numrows as int64):
    225     
...oadDataLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 6   

{} Line Blk
-- ---- ---
    226         end method.
    227     
    228         method public logical SetPolicyBailed (fname as character, pname
    228      as character):
    229     
    230         end method.
    231     
    232         method public logical CountCDCRow (fname as character, pname as 
    232     character):
    233     
    234         end method.
    235     
    236     END CLASS.
...oadDataLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 7   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...oadDataLogger.cls  104 Method      No   Method AddSharedTables           
...oadDataLogger.cls  108 Method      No   Method AddGroupTables            
...oadDataLogger.cls  112 Method      No   Method AddTenantTables           
...oadDataLogger.cls  116 Method      No   Method Export                    
...oadDataLogger.cls  124 Method      No   Method StartTable                
...oadDataLogger.cls  129 Method      No   Method EndTable                  
...oadDataLogger.cls  134 Method      No   Method EndTable                  
...oadDataLogger.cls  138 Do          No                                    
...oadDataLogger.cls  144 Do          No                                    
...oadDataLogger.cls  147 Repeat      No                                    
...oadDataLogger.cls  158 Method      No   Method CountRow                  
...oadDataLogger.cls  162 Method      No   Method getErrors                 
...oadDataLogger.cls  167 Method      No   Method AddTableError             
...oadDataLogger.cls  171 Do          No                                    
...oadDataLogger.cls  177 Method      No   Method AddTableError             
...oadDataLogger.cls  188 Method      No   Method SetTableExpectedNumRows   
...oadDataLogger.cls  194 Method      No   Method SetTableBailed            
...oadDataLogger.cls  200 Method      No   Method EndTask                   
...oadDataLogger.cls  204 Method      No   Method BindFiles                 
...oadDataLogger.cls  208 Method      No   Method AddCDCPolicies            
...oadDataLogger.cls  212 Method      No   Method AddPolicyError            
...oadDataLogger.cls  216 Method      No   Method AddPolicyError            
...oadDataLogger.cls  220 Method      No   Method EndPolicy                 
...oadDataLogger.cls  224 Method      No   Method EndPolicy                 
...oadDataLogger.cls  228 Method      No   Method SetPolicyBailed           
...oadDataLogger.cls  232 Method      No   Method CountCDCRow               
...oadDataLogger.cls  236 Constructor No   Constructor LoadDataLogger       
...oadDataLogger.cls    0 Class       No                                    
