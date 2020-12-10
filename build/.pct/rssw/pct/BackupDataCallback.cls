...pDataCallback.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 1   

{} Line Blk
-- ---- ---
      1     class rssw.pct.BackupDataCallback inherits rssw.pct.AbstractLoadData
      1     Callback:
      2       define private property tblName as character no-undo get. set.
      3       define private property bkupFile as character initial ? no-undo ge
      3     t. set.
      4     
      5       define stream sBackup.
      6     
      7       method public override void initialize(tableName as character):
      8         if num-entries(tableName) > 1 then undo, throw new Progress.Lang
      8     .AppError("BackupDataCallback can only handle one table").
      9         this-object:tblName = tableName.
     10       end method.
     11     
     12       method public override void beforeLoad(file as character):
     13         define variable delCount as integer no-undo.
     14     
     15         this-object:bkupFile = session:temp-directory + '/' + this-objec
     15     t:tblName + '-' + string(year(now), "9999") + string(month(now),"99"
     15     ) + string(day(now),"99") + "-" + replace(substring(string(now),12, 
     15     8), ':', '') + '.backup.d'.
     16         delCount = backupTable (input bkupFile).
     17         message substitute("&1 records deleted and backed up to &2", del
     17     Count, this-object:bkupFile).
     18     
     19       end method.
     20     
     21       method public override void afterLoad(file as character, logger as
     21      rssw.pct.LoadDataLogger):
     22     
     23   1     if logger:loadException or logger:bailed then do:
     24           message substitute("Restoring &1 content from &2", this-object
     24   1 :tblName, this-object:bkupFile).
     25   1       if not logger:loadException then backupTable (input ?).
     26           run pct/v11/restoreTableContent.p (this-object:tblName, this-o
     26   1 bject:bkupFile).
     27         end.
     28     
     29       end method.
     30     
     31       method private integer backupTable(ipFileName as character):
     32         define variable hFile    as handle  no-undo.
     33         define variable hQuery   as handle  no-undo.
     34         define variable opDelCount as integer no-undo.
     35     
     36         if (ipFileName > '') then
     37           output stream sBackup to value(ipFileName) convert target 'utf
     37     -8'.
     38         create buffer hFile for table this-object:tblName.
     39         create query hQuery.
     40         hQuery:set-buffers(hFile).
...pDataCallback.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 2   

{} Line Blk
-- ---- ---
     41         hQuery:query-prepare('for each ' + this-object:tblName).
     42         hQuery:query-open().
     43   1     repeat transaction:
     44   1       hQuery:get-next(exclusive-lock).
     45   1       IF hQuery:query-off-end then leave.
     46   1       if (ipFileName > '') then
     47             put stream sBackup unformatted exportRecord(input hFile, inp
     47   1 ut " ") skip.
     48   1       hFile:buffer-delete().
     49   1       assign opDelCount = opDelCount + 1.
     50         end.
     51         hQuery:query-close().
     52         delete object hFile.
     53         delete object hQuery.
     54     
     55         if (ipFileName > '') then
     56           output stream sBackup close.
     57     
     58         return opDelCount.
     59     END method.
     60     
     61       method private character exportRecord (input hRecord  as handle, i
     61     nput cDelim  as character):
     62         DEF VAR hFld     AS HANDLE    NO-UNDO.
     63       DEF VAR iCnt     AS INTEGER   NO-UNDO.
     64       DEF VAR iExtnt   AS INTEGER   NO-UNDO.
     65       DEF VAR cTmp     AS CHARACTER NO-UNDO.
     66       DEF VAR cArray   AS CHARACTER NO-UNDO.
     67       DEF VAR cResult  AS CHARACTER NO-UNDO.
     68       DEF VAR cLobname AS CHARACTER NO-UNDO.
     69     
     70       IF hRecord:TYPE <> "BUFFER" THEN
     71           RETURN ?.
     72     
     73   1   DO iCnt = 1 TO hRecord:NUM-FIELDS:
     74   1 
     75   1       ASSIGN hFld = hRecord:BUFFER-FIELD(iCnt).
     76   1 
     77           /* Handle export for large objects by writing them out to .blb
     77   1  files. This section should be omitted Progress 9.x */
     78           /* Names for blobs are NOT guaranteed the same as the static E
     78   1 XPORT statement. IMPORT does handle them correctly though. */
     79   2       IF hFld:DATA-TYPE = "clob" OR hFld:DATA-TYPE = "blob" THEN DO:
     80   3           IF hFld:BUFFER-VALUE = ? THEN DO:
     81   3              cResult = cResult + "?" + cDelim.
     82   2           END.
     83   3           ELSE DO:
     84                   cLobname =  hFld:NAME + (IF hFld:DATA-TYPE = "clob" TH
     84     EN "!" + GET-CODEPAGE(hFld:BUFFER-VALUE) + "!" ELSE "") + hRecord:TA
     84   3 BLE + "_" + STRING(hRecord:RECID) + ".blb".
     85                   COPY-LOB FROM hFld:BUFFER-VALUE TO FILE session:temp-d
...pDataCallback.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 3   

{} Line Blk
-- ---- ---
     85   3 irectory + '/' + cLobname NO-CONVERT.
     86   3               cResult = cResult + QUOTER(cLobname) + cDelim.
     87   2           END.
     88   2           NEXT.
     89   1       END.
     90   1 
     91   2       IF hFld:EXTENT = 0 THEN DO:
     92   2          IF hFld:BUFFER-VALUE = ? then cTmp = "?".
     93   2             ELSE
     94   2 
     95   2          CASE hFld:DATA-TYPE:
     96                   WHEN "character"      THEN cTmp = QUOTER(hFld:BUFFER-V
     96   2 ALUE).
     97                   WHEN "raw"            THEN cTmp = '"' + STRING(hFld:BU
     97   2 FFER-VALUE) + '"'.
     98   2               WHEN "datetime" OR
     99                      WHEN "datetime-tz" THEN cTmp = string(year(hFld:BUF
     99     FER-VALUE),"9999") + "-" + string(month(hFld:BUFFER-VALUE),"99") + "
     99     -" + string(day(hFld:BUFFER-VALUE),"99") + "T" + substring(string(hF
     99   2 ld:BUFFER-VALUE),12).
    100                  OTHERWISE                cTmp = STRING(hFld:BUFFER-VALU
    100   2 E).
    101   2          END CASE.
    102   2 
    103   2          cResult = cResult + cTmp + cDelim.
    104   1       END.
    105   2       ELSE DO:
    106   2           cArray = "".
    107   3           DO iExtnt = 1 TO hFld:EXTENT:
    108   3               IF hFld:BUFFER-VALUE(iExtnt) = ? THEN cTmp = "?".
    109   3                  ELSE
    110   3 
    111   3               CASE hFld:DATA-TYPE:
    112                       WHEN "character"      THEN cTmp = QUOTER(hFld:BUFF
    112   3 ER-VALUE(iExtnt)).
    113                       WHEN "raw"            THEN cTmp = '"' + STRING(hFl
    113   3 d:BUFFER-VALUE(iExtnt)) + '"'.
    114   3                   WHEN "datetime" OR
    115                       WHEN "datetime-tz"    THEN cTmp = string(year(hFld
    115     :BUFFER-VALUE(iExtnt)),"9999") + "-" + string(month(hFld:BUFFER-VALU
    115     E(iExtnt)),"99") + "-" + string(day(hFld:BUFFER-VALUE(iExtnt)),"99")
    115   3  + "T" + substring(string(hFld:BUFFER-VALUE(iExtnt)),12).
    116                      OTHERWISE                cTmp = STRING(hFld:BUFFER-
    116   3 VALUE(iExtnt)).
    117   3               END CASE.
    118   3 
    119   3               cArray = cArray + cTmp + cDelim.
    120   2           END.
    121   2           cResult = cResult + RIGHT-TRIM(cArray,cDelim) + cDelim.
    122   1       END.
    123       END.
...pDataCallback.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 4   

{} Line Blk
-- ---- ---
    124       RETURN RIGHT-TRIM(cResult,cDelim).
    125       end method.
    126     
    126     end class.
...pDataCallback.cls                  12/10/2020 16:12:21   PROGRESS(R) Page 5   

     File Name       Line Blk. Type   Tran            Blk. Label            
-------------------- ---- ----------- ---- --------------------------------
...pDataCallback.cls    7 Method      No   Method initialize                
...pDataCallback.cls   12 Method      No   Method beforeLoad                
...pDataCallback.cls   21 Method      No   Method afterLoad                 
...pDataCallback.cls   23 Do          No                                    
...pDataCallback.cls   31 Method      No   Method backupTable               
...pDataCallback.cls   43 Repeat      Yes                                   
...pDataCallback.cls   61 Method      No   Method exportRecord              
...pDataCallback.cls   73 Do          No                                    
...pDataCallback.cls   79 Do          No                                    
...pDataCallback.cls   80 Do          No                                    
...pDataCallback.cls   83 Do          No                                    
...pDataCallback.cls   91 Do          No                                    
...pDataCallback.cls  105 Do          No                                    
...pDataCallback.cls  107 Do          No                                    
...pDataCallback.cls  127 Constructor No   Constructor BackupDataCallback   
...pDataCallback.cls    0 Class       No                                    
