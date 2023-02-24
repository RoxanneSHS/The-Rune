ADD_TRANS_TRIGGER Tamah 0
~Global("TR_Petrihint","Global",101)~

EXTEND_BOTTOM Tamah 0
IF ~!Global("TR_Petrihint","Global",101)~THEN REPLY @0GOTO TR1
IF ~!Global("TR_Petrihint","Global",101)~THEN REPLY @1GOTO TR1
IF ~!Global("TR_Petrihint","Global",101)~THEN REPLY @2GOTO TR1
END

APPEND Tamah
IF~~THEN BEGIN TR1
SAY@3
IF~~THEN REPLY@4 DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@1003,QUEST)~ GOTO 5
IF~~THEN REPLY@5 DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@1003,QUEST)~ GOTO 3
IF ~GlobalGT("TR_Petrihint","Global",0)~ THEN REPLY @6 DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@1003,QUEST)~GOTO TR2
END

IF~~THEN BEGIN TR2
SAY@7
IF~~THEN REPLY@8 GOTO 5
IF~~THEN REPLY@9 GOTO 3
END

END

BEGIN ~CORIAN~

IF ~  NumTimesTalkedTo(0) ~ THEN BEGIN Clue1
SAY @10
IF ~~ THEN REPLY @11 DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@1002,QUEST)AddexperienceParty(50) GiveItemCreate("POTN38",LastTalkedToBy,1,0,0) EscapeArea()~ EXIT
IF ~~ THEN REPLY@12 DO ~IncrementGlobal("TR_Petrihint","Global",1)AddJournalEntry(@1002,QUEST)GiveItemCreate("POTN38",LastTalkedToBy,1,0,0) EscapeArea() ~ EXIT
IF ~~ THEN REPLY @13 GOTO Clue2
IF ~GlobalGT("TR_Petrihint","Global",0)~ THEN REPLY @6 GOTO Clue3
END

IF ~~ THEN BEGIN Clue2
SAY @14
IF ~~ THEN DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@1002,QUEST)AddexperienceParty(50) GiveItemCreate("POTN38",LastTalkedToBy,1,0,0) EscapeArea() ~EXIT
END

IF ~~ THEN BEGIN Clue3
SAY @15
IF ~~ THEN DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@1002,QUEST)AddexperienceParty(50) GiveItemCreate("POTN38",LastTalkedToBy,1,0,0) EscapeArea() ~EXIT
END

IF ~  StateCheck(Myself,STATE_CHARMED) ~ THEN BEGIN Charmed
SAY@16
IF ~~ THEN DO ~EscapeArea() ~ EXIT
END

EXTEND_BOTTOM Mutami 0
IF ~GlobalGT("TR_Petrihint","Global",0)~ THEN REPLY @17GOTO TRMU1
END

APPEND Mutami
IF~~THEN BEGIN TRMU1
SAY@18
IF~~THEN REPLY@19DO~AddJournalEntry(@1008,QUEST)~GOTO 1
IF~~THEN REPLY@20DO~AddJournalEntry(@1008,QUEST)~GOTO 1
IF~~THEN REPLY@21DO~AddJournalEntry(@1008,QUEST)~ GOTO 1
END
END

BEGIN TRNatina

IF ~  NumTimesTalkedTo(0) ~ THEN BEGIN Nat1
SAY @22
IF~~THEN REPLY@23 GOTO Nat2
IF~~THEN REPLY@24 GOTO Nat2
END

IF ~~ THEN BEGIN Nat2
SAY@25
=@26
IF~~THEN REPLY@27 GOTO Nat3
IF~Gender(Player1,MALE)~THEN REPLY@28 GOTO Nat3
IF~Gender(Player2,MALE)~THEN REPLY@29 GOTO Nat3
IF~Gender(Player3,MALE)~THEN REPLY@30 GOTO Nat3
IF~Gender(Player4,MALE)~THEN REPLY@31 GOTO Nat3
IF~Gender(Player5,MALE)~THEN REPLY@32 GOTO Nat3
IF~Gender(Player6,MALE)~THEN REPLY@33 GOTO Nat3
IF~~THEN REPLY@34 GOTO Nat3
END

IF ~~ THEN BEGIN Nat3
SAY@35
IF~~THEN DO~EscapeArea()~EXIT
END

BEGIN TRSiri
IF ~  NumTimesTalkedTo(0) ~ THEN BEGIN Siri1
SAY @36
IF~~THEN REPLY@37 GOTO Siri2
IF~~THEN REPLY@38 GOTO Siri2
END

IF ~~ THEN BEGIN Siri2
SAY@39
IF~~THEN DO~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@1013,QUEST)Wait(1) Enemy()~EXIT
END

I_C_T Narcil 2 TR_Narchint
==Narcil IF~~THEN@40
END

EXTEND_BOTTOM Ramazi 3
IF~Global("TR_HasRama","Global",1)~THEN REPLY@41GOTO TRRama1
END

EXTEND_BOTTOM Ramazi 4
IF~Global("TR_HasRama","Global",1)~THEN REPLY@41GOTO TRRama1
END

EXTEND_BOTTOM Ramazi 5
IF~Global("TR_HasRama","Global",1)~THEN REPLY@41GOTO TRRama1
END

APPEND Ramazi 
IF~~THEN BEGIN TRRama1
SAY@42
IF~~THEN REPLY@43DO~SetGlobal("TR_HasRama","Global",2) AddJournalEntry(@1015,QUEST)~GOTO 6
IF~~THEN REPLY@44GOTO TRRama2
END

IF~~THEN BEGIN TRRama2
SAY@45
IF~~THEN DO~SetGlobal("RamazithMove","GLOBAL",4) SetGlobal("TR_HasRama","Global",2) Enemy()
ForceSpell(Myself,QUICK_TELEPORT) EscapeAreaMove("%NBaldursGate_RamazithsTower_L6%",169,147,SSE)~EXIT
END
END

BEGIN TRHold

IF ~  NumTimesTalkedTo(0) ~ THEN BEGIN Durl1
SAY@46
=@47
=@48
IF~~THEN REPLY@49 GOTO Durl2
IF ~GlobalGT("TR_Petrihint","Global",0)~ THEN REPLY @6 GOTO Durl3
IF~Global("TR_HasRama","Global",1)~THEN REPLY @50GOTO Durl4
END

IF~~THEN BEGIN Durl2
SAY@51
IF~~THEN DO~ActionOverride("TR_Basi",Enemy()) Enemy()~EXIT
END

IF~~THEN BEGIN Durl3
SAY@52
IF~~THEN DO~ActionOverride("TR_Basi",Enemy()) Enemy()~EXIT
END

IF~~THEN BEGIN Durl4
SAY@53
IF~~THEN DO~ActionOverride("TR_Basi",Enemy()) Enemy()~EXIT
END