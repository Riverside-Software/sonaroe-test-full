...t\LoadOptions.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     ROUTINE-LEVEL ON ERROR UNDO, THROW.
      2     
      3     USING Progress.Lang.* FROM PROPATH.
      4     USING OpenEdge.DataAdmin.Binding.IDataDefinitionLoader FROM PROPATH.
      5     USING OpenEdge.DataAdmin.Binding.DataDefinitionOptions FROM PROPATH.
      6     
      7     CLASS rssw.pct.LoadOptions INHERITS DataDefinitionOptions:
      8     
      9       CONSTRUCTOR PUBLIC LoadOptions (logger AS OpenEdge.DataAdmin.Bindi
      9     ng.IDataDefinitionLoader):
     10         SUPER (logger).
     11       END CONSTRUCTOR.
     12     
     13       CONSTRUCTOR PUBLIC LoadOptions (  ):
     14         THIS-OBJECT(?).
     15       END CONSTRUCTOR.
     16     
     17     END CLASS.
...t\LoadOptions.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...t\LoadOptions.cls    9 Constructor No   Constructor LoadOptions          
...t\LoadOptions.cls   13 Constructor No   Constructor LoadOptions          
...t\LoadOptions.cls    0 Class       No                                    
