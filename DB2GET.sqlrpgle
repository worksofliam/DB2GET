
       //A basic tool to download files from a
       //URL onto the IFS. This was created since
       //I had no access to WGET or CURL.

       //Returns SQLSTATE

       Ctl-Opt DftActGrp(*No) ActGrp(*NEW);

       Dcl-Pi DB2GET;
         pURL  Char(128) Const;
         pPath Char(128) Const;
       END-PI;

       Dcl-S gURL  Varchar(128);
       Dcl-S gFile SQLTYPE(BLOB_FILE);

       If (pURL = *Blank OR pPath = *Blank);
         DSPLY ('URL or path blank');
         Return;
       ENDIF;

       gURL       = %Trim(pURL);
       gFile_Name = %Trim(pPath);
       gFile_NL   = %Len(%TrimR(gFile_Name));
       gFile_FO   = SQFOVR; //16 - Overwrite

       Exec SQL
         SELECT SYSTOOLS.HTTPGETBLOB(:gURL, '') gFile_DATA
         INTO :gFile
         FROM SYSIBM.SYSDUMMY1;

       DSPLY ('Download finished. SQLSTATE: ' + SQLSTATE);

       Return;
