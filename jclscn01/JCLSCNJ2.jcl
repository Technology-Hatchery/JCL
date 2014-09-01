//JCLSCNJ2 JOB SIMOTIME,ACCOUNT,CLASS=1,MSGCLASS=0,NOTIFY=CSIP1,
//             TYPRUN=SCAN
//* *******************************************************************
//*        This program is provided by: SimoTime Enterprises          *
//*           (C) Copyright 1987-2014 All Rights Reserved             *
//*             Web Site URL:   http://www.simotime.com               *
//*                   e-mail:   helpdesk@simotime.com                 *
//* *******************************************************************
//*
//* Text   - Demonstrate the use of TYPRUN=SCAN on the JOB statement.
//* Author - SimoTime Enterprises
//* Date   - January 24, 1996
//*
//* This JCL member will show basic functions of JCL.
//*
//* JCLSCNJ2 has the TYPRUN=SCAN on the JOB statement and simply scans
//*          the JCL for proper syntax. It does not execute. The
//*          TYPRUN=SCAN is supported on the mainframe and with
//*          Micro Focus MFE and ES/MTO Batch Facility.
//*
//* *******************************************************************
//* This step does the housekeeping to delete files created by a
//* previous run of this job.
//*
//         SET MYDSN=SIMOTIME.DATA.MYDSNDD6
//*
//JOBSETUP EXEC PGM=IEFBR14,COND=(0,LT)
//DD1      DD  DSN=SIMOTIME.DATA.JCLSCAN1,
//             UNIT=SYSDA,SPACE=(TRK,0),DISP=(MOD,DELETE,DELETE),
//             DCB=(DSORG=PS,RECFM=FB,LRECL=80)
//DD2      DD  DSN=SIMOTIME.DATA.JCLSCAN2,
//             UNIT=SYSDA,SPACE=(TRK,0),DISP=(MOD,DELETE,DELETE),
//             DCB=(DSORG=PS,RECFM=FB,LRECL=80)
//DD3      DD  DSN=SIMOTIME.DATA.JCLSCAN3,
//             UNIT=SYSDA,SPACE=(TRK,0),DISP=(MOD,DELETE,DELETE),
//             DCB=(DSORG=PS,RECFM=FB,LRECL=80)
//DD4      DD  DSN=SIMOTIME.DATA.JCLSCAN4,
//             UNIT=SYSDA,SPACE=(TRK,0),DISP=(MOD,DELETE,DELETE),
//             DCB=(DSORG=PS,RECFM=FB,LRECL=80)
//DD5      DD  DSN=SIMOTIME.DATA.JCLSCAN5,
//             UNIT=SYSDA,SPACE=(TRK,0),DISP=(MOD,DELETE,DELETE),
//             DCB=(DSORG=PS,RECFM=FB,LRECL=80)
//DD6      DD  DSN=&MYDSN,
//             UNIT=SYSDA,SPACE=(TRK,0),DISP=(MOD,DELETE,DELETE),
//             DCB=(DSORG=PS,RECFM=FB,LRECL=80)
//*
//* *******************************************************************
//* This step has a syntax error to see if the TYPRUN=SCAN will catch
//* the error.
//*
//ALOCSTEP EXEC PGM=IEFBR14
//MYDSNDD6 DD  DSN=&MYDSN,DISP=(NEW,CATLG,CATLG),
//             UNIT=SYSDA,SPACE=(TRK,0),
//             DCB=(DSORG=PS,RECFM=FB,LRECL=80)
//*
//* *******************************************************************
//* This step has a syntax error to see if the TYPRUN=SCAN will catch
//* the error.
//*
//DUMBSTEP EXEC PGM=IEFBR14
//DUMBFILE DD  DSN=SIMOTIME.DATA.DUMBFILE,DISP=(MOD,DELETE,DELETE),
//             UNIT=SYSDA,SPACE=(TRK,0),
//             DCB=(DSORG=PS,RECFM=YUK,LRECL=80)
//*
