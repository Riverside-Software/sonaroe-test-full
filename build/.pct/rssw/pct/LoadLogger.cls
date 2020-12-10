...ct\LoadLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     ROUTINE-LEVEL ON ERROR UNDO, THROW.
      2     
      3     USING Progress.Lang.*.
      4     USING OpenEdge.DataAdmin.Binding.IDataDefinitionLoader FROM PROPATH.
      5     
      6     CLASS rssw.pct.LoadLogger INHERITS rssw.pct.AbstractLoadLogger:
      7       DEFINE PUBLIC PROPERTY numErrors AS INTEGER NO-UNDO INITIAL 0 GET.
      7      PRIVATE SET.
      8       DEFINE PUBLIC PROPERTY numWarnings AS INTEGER NO-UNDO INITIAL 0 GE
      8     T. PRIVATE SET.
      9       DEFINE VARIABLE errors AS LONGCHAR NO-UNDO.
     10       DEFINE VARIABLE warnings AS LONGCHAR NO-UNDO.
     11     
     12       CONSTRUCTOR PUBLIC LoadLogger():
     13         THIS-OBJECT:IsReader = FALSE.
     14       END CONSTRUCTOR.
     15     
     16       METHOD PUBLIC LONGCHAR getErrors ():
     17         RETURN errors.
     18       END METHOD.
     19     
     20       METHOD PUBLIC LONGCHAR getWarnings ():
     21         RETURN warnings.
     22       END METHOD.
     23     
     24       METHOD PUBLIC OVERRIDE VOID AddError( pError as Error) :
     25         DEFINE VARIABLE zz AS INTEGER NO-UNDO.
     26     
     27         THIS-OBJECT:numErrors = THIS-OBJECT:numErrors + 1.
     28   1     DO zz = 1 TO pError:NumMessages:
     29   1         THIS-OBJECT:AddError(pError:GetMessage(zz)).
     30         END.
     31     
     32       END METHOD.
     33     
     34       METHOD PUBLIC OVERRIDE VOID AddError( pcText as char ) :
     35         THIS-OBJECT:numErrors = THIS-OBJECT:numErrors + 1.
     36         MESSAGE pcText.
     37         errors = errors + pcText + "~n".
     38       END METHOD.
     39     
     40       METHOD PUBLIC OVERRIDE VOID AddPhase2Error( pcText as char ) :
     41         THIS-OBJECT:numErrors = THIS-OBJECT:numErrors + 1.
     42         MESSAGE pcText.
     43         errors = errors + pcText + "~n".
     44       END METHOD.
     45     
     46       METHOD PUBLIC OVERRIDE VOID AddWarning( pcText as char ) :
     47         THIS-OBJECT:numWarnings = THIS-OBJECT:numWarnings + 1.
     48         MESSAGE pcText.
     49         warnings = warnings + pcText + "~n".
...ct\LoadLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

{} Line Blk
-- ---- ---
     50       END METHOD.
     51     
     52     END CLASS.
...ct\LoadLogger.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 3   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...ct\LoadLogger.cls   12 Constructor No   Constructor LoadLogger           
...ct\LoadLogger.cls   16 Method      No   Method getErrors                 
...ct\LoadLogger.cls   20 Method      No   Method getWarnings               
...ct\LoadLogger.cls   24 Method      No   Method AddError                  
...ct\LoadLogger.cls   28 Do          No                                    
...ct\LoadLogger.cls   34 Method      No   Method AddError                  
...ct\LoadLogger.cls   40 Method      No   Method AddPhase2Error            
...ct\LoadLogger.cls   46 Method      No   Method AddWarning                
...ct\LoadLogger.cls    0 Class       No                                    
