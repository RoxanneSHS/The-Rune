ADD_TRANS_TRIGGER HLShang 1
~!Global("TR_HasRama","Global",6)~

EXTEND_BOTTOM HLShang 1
IF~Global("TR_HasRama","Global",6)~THEN REPLY@0 GOTO 3
IF~Global("TR_HasRama","Global",6)~THEN REPLY@1 GOTO 2
END

EXTEND_BOTTOM HLShang 2
IF~Global("TR_HasRama","Global",6)~THEN REPLY@2DO~SetGlobal("TR_HasRama","Global",7) AddexperienceParty(9000)~GOTO 7
END

EXTEND_BOTTOM HLShang 3
IF~Global("TR_HasRama","Global",6)~THEN REPLY@2DO~SetGlobal("TR_HasRama","Global",7) AddexperienceParty(9000)~GOTO 7
END

BEGIN TRGilb2
BEGIN TRFrenz2

CHAIN
IF~Global("TR_HasRama","Global",7)~THEN TRGilb2 Rune1
@3
DO~SetGlobal("TR_HasRama","Global",8)~
==TRFrenz2@4
==TRGilb2@5
END
++@6+ Rune2
++@7+ Rune3

CHAIN
IF~~THEN TRGilb2 Rune2
@8
END
++@9+ Rune3
++@10 + Rune3

CHAIN
IF~~THEN TRGilb2 Rune3
@11
==TRFrenz2@12
END
++@13 + Rune4
++@14 + Rune4

CHAIN
IF~~THEN TRGilb2 Rune4
@15
==TRFrenz2@15
END
++@16+ Rune5

CHAIN
IF~~THEN TRGilb2 Rune5
@17
==TRFrenz2@18
==TRGilb2@19
==TRFrenz2@20
==TRGilb2@21
==TRFrenz2@22
END
++@23 + Rune6
++@24 + Rune6

CHAIN
IF~~THEN TRGilb2 Rune6
@25DO~GiveItemCreate("scrl9z",LastTalkedToBy,1,0,0) GiveItemCreate("shld21",LastTalkedToBy,1,0,0)~
==TRFrenz2@26
==TRGilb2@27 DO~ ForceSpell(Myself,DRYAD_TELEPORT)~
==TRFrenz2@28DO~ ForceSpell(Myself,DRYAD_TELEPORT)~EXIT

EXTEND_BOTTOM AMCST04 2
IF~GlobalGT("TR_HasRama","Global",5)~THEN REPLY@29GOTO Amrun1
END

EXTEND_BOTTOM AMCST04 3
IF~GlobalGT("TR_HasRama","Global",5)~THEN REPLY@30GOTO Amrun1
END

APPEND AMCST04
IF~~THEN BEGIN Amrun1
SAY@31
IF~~THEN REPLY@32GOTO Amrun2
END

IF~~THEN BEGIN Amrun2
SAY@33
IF~~THEN DO~AddJournalEntry(@1023,INFO) EscapeArea()~EXIT
END
END

INTERJECT AMFaheed 4 TRAlternatekey
==AMFaheed IF ~OR(2)Global("TR_Assas","Global",2) GlobalGT("TR_HasRama","Global",6) Global("PlayerHasStronghold","GLOBAL",1)~ THEN@34
END
IF~~THEN REPLY@35GOTO Amkey1
IF~~THEN REPLY@36GOTO 5
IF~~THEN REPLY@37 GOTO 7

EXTEND_BOTTOM AMFAheed 2
IF~!Global("SaemonFaheed","GLOBAL",1) Global("ZakeeFaheed","GLOBAL",1) OR(2) Global("TR_Assas","Global",2) GlobalGT("TR_HasRama","Global",6) Global("PlayerHasStronghold","GLOBAL",1)~THEN REPLY@38GOTO 3
END

APPEND AMFaheed
IF~~THEN BEGIN Amkey1
SAY@39
IF~~THEN REPLY@40GOTO Amkey2
IF~Dead("HLVaxal")~THEN REPLY@41GOTO Amkey2
IF~Dead("Tanthf01")~THEN REPLY@42GOTO Amkey2
END

IF~~THEN BEGIN Amkey2
SAY@43
=@44
=@45
IF~~THEN REPLY@46 GOTO Amkey4
IF~GlobalGT("TR_HasRama","Global",6) ~THEN REPLY@47 GOTO Amkey3
END

IF~~THEN BEGIN Amkey3
SAY@48
IF~~THEN GOTO Amkey4
END

IF~~THEN BEGIN Amkey4
SAY@49
=@50
IF~~THEN REPLY@51GOTO Amkey5
IF~~THEN REPLY@52 GOTO 7
IF~~THEN REPLY@53GOTO Amkey7
END

IF~~THEN BEGIN Amkey5
SAY@54
IF~Global("JoinLathander","GLOBAL",1)~THEN REPLY@55 GOTO 10
IF~Global("JoinHelm","GLOBAL",1)~THEN REPLY@56 GOTO 10
IF~Global("PaladinOrder","GLOBAL",1)~THEN REPLY@57 GOTO 10
IF~Global("PCSphere","GLOBAL",1)~THEN REPLY@58 GOTO 10
IF~Global("PCKeepOwner","GLOBAL",1)~THEN REPLY@59 GOTO 10
IF~Global("Playhouse","GLOBAL",1) ~THEN REPLY@60 GOTO 10
IF~Global("PlayerThiefGuild","GLOBAL",1) ~THEN REPLY@61 GOTO 10
IF~Global("RangerProtector","GLOBAL",1) ~THEN REPLY@62 GOTO 10
END

IF~~THEN BEGIN Amkey7
SAY@63
IF~~THEN DO~ ActionOverride("ammajira",Enemy()) Enemy() ~EXIT
END

END