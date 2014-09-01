//JCLSCNJ3 JOB SIMOTIME,ACCOUNT,CLASS=1,MSGCLASS=0,NOTIFY=CSIP1
//*             TYPRUN=SCAN
//* *******************************************************************
//*        This program is provided by: SimoTime Enterprises          *
//*           (C) Copyright 1987-2014 All Rights Reserved             *
//*             Web Site URL:   http://www.simotime.com               *
//*                   e-mail:   helpdesk@simotime.com                 *
//* *******************************************************************
//*
//* Text   - Demonstrate the use of IEBGENER, SORT and TYPRUN=SCAN.
//* Author - SimoTime Enterprises
//* Date   - January 24, 1996
//*
//* This JCL member will show basic functions of JCL.
//*
//* STEP0010 uses the IEBGENER utility program to create a file.
//* STEP0020 uses the SORT utility to copy.
//* STEP0030 uses the SORT utility to sort the file on positions 1-3.
//* STEP0040 uses the SORT utility to sort the file on positions 5-7.
//* STEP0050 uses the SORT utility to sort the file on positions 5-7.
//*          This step uses an alternate collating table to sort with
//*          case insensitivity.
//*
//* CAUTION! Since the ALTSEQ is defined at the binary (or hexadecimal)
//*          level this step will only work for ASCII-encoded files.
//*
//* *******************************************************************
//* This step does the housekeeping to delete files created by a
//* previous run of this job.
//*
//JOBSETUP EXEC PGM=IEFBR14,COND=(0,LT)
//DD1      DD  DSN=SIMOTIME.DATA.JCLSCAN1,
//             UNIT=SYSDA,SPACE=(TRK,0),DISP=(MOD,DELETE,DELETE),
//             DCB=(RECFM=FB,LRECL=80)
//DD2      DD  DSN=SIMOTIME.DATA.JCLSCAN2,
//             UNIT=SYSDA,SPACE=(TRK,0),DISP=(MOD,DELETE,DELETE),
//             DCB=(RECFM=FB,LRECL=80)
//DD3      DD  DSN=SIMOTIME.DATA.JCLSCAN3,
//             UNIT=SYSDA,SPACE=(TRK,0),DISP=(MOD,DELETE,DELETE),
//             DCB=(RECFM=FB,LRECL=80)
//DD4      DD  DSN=SIMOTIME.DATA.JCLSCAN4,
//             UNIT=SYSDA,SPACE=(TRK,0),DISP=(MOD,DELETE,DELETE),
//             DCB=(RECFM=FB,LRECL=80)
//DD5      DD  DSN=SIMOTIME.DATA.JCLSCAN5,
//             UNIT=SYSDA,SPACE=(TRK,0),DISP=(MOD,DELETE,DELETE),
//             DCB=(RECFM=FB,LRECL=80)
//*
//* *******************************************************************
//* This step uses IEBGENER to copy a sequential file. SYSIN is DD *
//* with thirty-six (36) records.
//*
//STEP0010 EXEC PGM=IEBGENER,COND=(0,LT)
//SYSPRINT DD  SYSOUT=*
//*.:....1....:....2....:....3....:....4....:....5....:....6....:....7. ..:....8
//SYSUT1   DD  *
003 AAA Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000010
001 bbb Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000020
002 CCC Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000030
007 ddd Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000040
006 EEE Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000050
004 fff Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000060
005 GGG Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000070
003 hhh Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000080
001 III Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000090
002 jjj Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000100
007 KKK Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000110
006 lll Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000120
004 MMM Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000130
009 999 Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000140
010 888 Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000150
008 777 Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000160
009 666 Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000170
010 555 Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000180
008 444 Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000190
009 333 Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000200
010 222 Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000210
008 111 Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000220
008 000 Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000230
003 nnn Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000240
001 OOO Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000250
002 ppp Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000260
007 QQQ Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000270
006 rrr Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000280
004 SSS Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000290
005 ttt Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000300
003 UUU Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000310
001 vvv Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000320
002 WWW Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000330
007 xxx Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000340
006 YYY Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000350
004 zzz Bytes 1-3 are primary, Bytes 5-7 are secondary                  00000360
/*
//SYSUT2   DD  DSN=SIMOTIME.DATA.JCLSCAN1,DISP=(,CATLG,DELETE),
//             UNIT=SYSDA,SPACE=(TRK,(50,10),RLSE),
//             DCB=(RECFM=FB,LRECL=80)
//*
//* *******************************************************************
//* This step uses SORT to copy a sequential file. SYSIN is DD *
//* with inline control specifications.
//*
//STEP0020 EXEC PGM=SORT
//SYSPRINT DD  SYSOUT=*
//SYSOUT   DD  SYSOUT=*
//SORTIN   DD  DSN=SIMOTIME.DATA.JCLSCAN1,DISP=SHR
//SORTOUT  DD  DSN=SIMOTIME.DATA.JCLSCAN2,DISP=(,CATLG,DELETE),
//             UNIT=SYSDA,SPACE=(TRK,(50,10),RLSE),
//             DCB=(RECFM=FB,LRECL=80)
//SYSIN DD *
 SORT FIELDS=COPY
/*
//*
//* *******************************************************************
//* This step uses the sort utility to sort the file created in a
//* previous step. SYSIN is DD * with inline control specifications.
//*
//STEP0030 EXEC PGM=SORT
//SYSPRINT DD  SYSOUT=*
//SYSOUT   DD  SYSOUT=*
//SORTIN   DD  DSN=SIMOTIME.DATA.JCLSCAN2,DISP=SHR
//SORTOUT  DD  DSN=SIMOTIME.DATA.JCLSCAN3,DISP=(,CATLG,DELETE),
//             UNIT=SYSDA,SPACE=(TRK,(50,10),RLSE),
//             DCB=(RECFM=FB,LRECL=80)
//SYSIN DD *
 SORT  FIELDS=(1,3,CH,A)
 END
/*
//*
//* *******************************************************************
//* This step uses the sort utility to sort on the secondary field in
//* positions 5-7. This shows the collating sequence for upper and
//* lower case letters and mixed alphameric fields.
//*
//STEP0040 EXEC PGM=SORT
//SYSPRINT DD  SYSOUT=*
//SYSOUT   DD  SYSOUT=*
//SORTIN   DD  DSN=SIMOTIME.DATA.JCLSCAN1,DISP=SHR
//SORTOUT  DD  DSN=SIMOTIME.DATA.JCLSCAN4,DISP=(,CATLG,DELETE),
//             UNIT=SYSDA,SPACE=(TRK,(50,10),RLSE),
//             DCB=(RECFM=FB,LRECL=80)
//SYSIN DD *
 SORT  FIELDS=(5,3,CH,A)
/*
//*
//* *******************************************************************
//* This step uses the sort utility to sort on the secondary field in
//* positions 5-7. This shows the affect of using an alternate
//* sequencing table for upper-lower case letters and mixed alpha-
//* numeric fields. The result is a case insensitive sorting sequence.
//* Note, the ALTSEQ is for an ASCII-encoded environment.
//*
//STEP0050 EXEC PGM=SORT
//SYSPRINT DD  SYSOUT=*
//SYSOUT   DD  SYSOUT=*
//SORTIN   DD  DSN=SIMOTIME.DATA.JCLSCAN1,DISP=SHR
//SORTOUT  DD  DSN=SIMOTIME.DATA.JCLSCAN5,DISP=(,CATLG,DELETE),
//             UNIT=SYSDA,SPACE=(TRK,(50,10),RLSE),
//             DCB=(RECFM=FB,LRECL=80)
//SYSIN DD *
 SORT  FIELDS=(5,3,AQ,A)
 ALTSEQ CODE=(6141,6242,6343,6444,6545,6646,6747,6848,6949,
              6A4A,6B4B,6C4C,6D4D,6E4E,6F4F,7050,7151,7252,
              7353,7454,7555,7656,7757,7858,7959,7A5A)
/*
//*
