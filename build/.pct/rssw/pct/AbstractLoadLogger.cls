...actLoadLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     ROUTINE-LEVEL ON ERROR UNDO, THROW.
      2     
      3     USING Progress.Lang.*.
      4     USING OpenEdge.DataAdmin.Binding.IDataDefinitionLoader FROM PROPATH.
      5     
      6     CLASS rssw.pct.AbstractLoadLogger IMPLEMENTS IDataDefinitionLoader A
      6     BSTRACT:
      7       DEFINE PUBLIC PROPERTY IsReader AS LOGICAL  NO-UNDO INIT TRUE GET.
      7      PROTECTED SET.
      8       DEFINE PUBLIC PROPERTY Error    AS AppError NO-UNDO GET. PRIVATE S
      8     ET.
      9       DEFINE PUBLIC PROPERTY Warning  AS AppError NO-UNDO GET. PRIVATE S
      9     ET.
     10       DEFINE PUBLIC PROPERTY AddingChildToNewTable AS LOGICAL NO-UNDO GE
     10     T. SET.
     11     
     12       METHOD PUBLIC LOGICAL EXTENT CurrentTableAttributes():
     13     
     14       END METHOD.
     15     
     16       METHOD PUBLIC VOID AddError( pError as Error):
     17     
     18       END METHOD.
     19     
     20       METHOD PUBLIC VOID AddError( pcText as char ) :
     21     
     22       END METHOD.
     23     
     24       METHOD PUBLIC VOID AddPhase2Error( pcText as char ):
     25     
     26       END METHOD.
     27     
     28       METHOD PUBLIC VOID AddWarning( pcText as char ) :
     29     
     30       END METHOD.
     31     
     32       METHOD PUBLIC VOID AddTable(pcAction as char, h as handle, piArea 
     32     as int):
     33     
     34       END METHOD.
     35     
     36       METHOD PUBLIC VOID AddSequence(pcAction as char, h as handle):
     37     
     38       END METHOD.
     39     
     40       METHOD PUBLIC VOID AddIndex(pcAction as char, pcTable as char, h a
     40     s handle, piArea as int):
     41     
     42       END METHOD.
     43     
     44       METHOD PUBLIC VOID AddIndex(pcAction as char, pcTable as char, h a
...actLoadLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

{} Line Blk
-- ---- ---
     44     s handle, piArea as int, piPrimary as log):
     45     
     46       END METHOD.
     47     
     48       METHOD PUBLIC VOID AddField(pcAction as char, pcTable as char, h a
     48     s handle, piArea as int):
     49     
     50       END METHOD.
     51     
     52       METHOD PUBLIC LOGICAL IsNewTable(pcTable as char):
     53         RETURN TRUE.
     54       END METHOD.
     55     
     56       METHOD PUBLIC VOID RenameTable(pcname as char,pcNewname as char):
     57     
     58       END METHOD.
     59     
     60       METHOD PUBLIC VOID RenameField(pcTable as char, pcname as char,pcN
     60     ewname as char):
     61     
     62       END METHOD.
     63     
     64       METHOD PUBLIC VOID RenameIndex(pcTable as char, pcname as char,pcN
     64     ewname as char):
     65     
     66       END METHOD.
     67     
     68       METHOD PUBLIC VOID RenameSequence(pcname as char,pcNewname as char
     68     ):
     69     
     70       END METHOD.
     71     
     72       METHOD PUBLIC CHAR TableOldName(pcNewname as char):
     73     
     74       END METHOD.
     75     
     76       METHOD PUBLIC CHAR FieldOldName(pcTable as char, pcNewname as char
     76     ):
     77     
     78       END METHOD.
     79     
     80       METHOD PUBLIC CHAR IndexOldName(pcTable as char, pcNewname as char
     80     ):
     81     
     82       END METHOD.
     83     
     84       METHOD PUBLIC CHAR SequenceOldName(pcNewname as char):
     85     
     86       END METHOD.
     87     
     88       METHOD PUBLIC CHAR FieldNewName(pcTable as char, pcOldname as char
...actLoadLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 3   

{} Line Blk
-- ---- ---
     88     ):
     89     
     90       END METHOD.
     91     
     92       METHOD PUBLIC CHAR IndexNewName(pcTable as char, pcOldname as char
     92     ):
     93     
     94       END METHOD.
     95     
     96       METHOD PUBLIC CHAR TableNewName(pcOldname as char):
     97     
     98       END METHOD.
     99     
    100       METHOD PUBLIC CHAR SequenceNewName(pcOldname as char):
    101     
    102       END METHOD.
    103     
    104       METHOD PUBLIC AppError RemoveWarning ():
    105         RETURN ?.
    106       END METHOD.
    107     
    108       METHOD PUBLIC AppError RemoveError ():
    109         RETURN ?.
    110       END METHOD.
    111     
    112       METHOD PUBLIC CHAR RemoveErrorMessages ():
    113         RETURN "".
    114       END METHOD.
    115     
    116       METHOD PUBLIC CHAR RemoveWarningMessages ():
    117         RETURN "".
    118       END METHOD.
    119     
    120     END CLASS.
...actLoadLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 4   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...actLoadLogger.cls   12 Method      No   Method CurrentTableAttributes    
...actLoadLogger.cls   16 Method      No   Method AddError                  
...actLoadLogger.cls   20 Method      No   Method AddError                  
...actLoadLogger.cls   24 Method      No   Method AddPhase2Error            
...actLoadLogger.cls   28 Method      No   Method AddWarning                
...actLoadLogger.cls   32 Method      No   Method AddTable                  
...actLoadLogger.cls   36 Method      No   Method AddSequence               
...actLoadLogger.cls   40 Method      No   Method AddIndex                  
...actLoadLogger.cls   44 Method      No   Method AddIndex                  
...actLoadLogger.cls   48 Method      No   Method AddField                  
...actLoadLogger.cls   52 Method      No   Method IsNewTable                
...actLoadLogger.cls   56 Method      No   Method RenameTable               
...actLoadLogger.cls   60 Method      No   Method RenameField               
...actLoadLogger.cls   64 Method      No   Method RenameIndex               
...actLoadLogger.cls   68 Method      No   Method RenameSequence            
...actLoadLogger.cls   72 Method      No   Method TableOldName              
...actLoadLogger.cls   76 Method      No   Method FieldOldName              
...actLoadLogger.cls   80 Method      No   Method IndexOldName              
...actLoadLogger.cls   84 Method      No   Method SequenceOldName           
...actLoadLogger.cls   88 Method      No   Method FieldNewName              
...actLoadLogger.cls   92 Method      No   Method IndexNewName              
...actLoadLogger.cls   96 Method      No   Method TableNewName              
...actLoadLogger.cls  100 Method      No   Method SequenceNewName           
...actLoadLogger.cls  104 Method      No   Method RemoveWarning             
...actLoadLogger.cls  108 Method      No   Method RemoveError               
...actLoadLogger.cls  112 Method      No   Method RemoveErrorMessages       
...actLoadLogger.cls  116 Method      No   Method RemoveWarningMessages     
...actLoadLogger.cls  120 Constructor No   Constructor AbstractLoadLogger   
...actLoadLogger.cls    0 Class       No                                    
