BEGIN TRGilb
BEGIN TRFrenz

CHAIN 
IF~AreaCheck("BD2000") NumTimesTalkedTo(0)~THEN TRGilb HavePap1
@0
==TRFrenz@1
==TRGilb@2
END
++@3+ HavePap2
++@4+ HavePap2
++@5+ HavePap2

CHAIN
IF~~THEN TRGilb HavePap2
@6
==TRFrenz@7
==TRGilb@8
END
++@9 EXTERN TRFrenz HavePap3
++@10 EXTERN TRFrenz HavePap3

CHAIN
IF~~THEN TRFrenz HavePap3
@11
==TRGilb@12
END
++@13EXTERN TRGilb HavePap4
++@14EXTERN TRGilb HavePap4

CHAIN
IF~~THEN TRGilb HavePap4
@15
==TRFrenz@16
==TRGilb@17
END
++@18DO~AddExperienceParty(2000)~ + HavePap6
++@19+ HavePap5
++@20DO~AddExperienceParty(2000)~ + HavePap6

CHAIN
IF~~THEN TRGilb HavePap5
@21
==TRFrenz@22
END
++@23DO~AddExperienceParty(1000)~ + HavePap6
++@20DO~AddExperienceParty(1000)~ + HavePap6

CHAIN
IF~~THEN TRGilb HavePap6 
@24
==TRFrenz@25
END
++@26 EXTERN TRFrenz HavePap7
++@27 EXTERN TRFrenz HavePap7

CHAIN
IF~~THEN TRFrenz HavePap7
@28
==TRGilb@29
==TRFrenz@30DO~ForceSpell(Myself,DRYAD_TELEPORT)~
==TRGilb@31DO~ ForceSpell(Myself,DRYAD_TELEPORT)~EXIT

EXTEND_TOP BDTeleri 2 #2
IF~Global("TR_HasRama","Global",6)~THEN REPLY@32GOTO Obera1
END

APPEND BDTeleri
IF~~THEN BEGIN Obera1
SAY@33
IF~~THEN REPLY@34 GOTO Obera2
IF~~THEN REPLY@35GOTO 10
END

IF~~THEN BEGIN Obera2
SAY@36
IF~~THEN GOTO 10
END
END