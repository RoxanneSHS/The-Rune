ADD_TRANS_TRIGGER Tamah 0
~Global("TR_Petrihint","Global",101)~

EXTEND_BOTTOM Tamah 0
IF ~!Global("TR_Petrihint","Global",101)~THEN REPLY ~Rest yourself, you have likely been petrified for some time now.~GOTO TR1
IF ~!Global("TR_Petrihint","Global",101)~THEN REPLY ~I have rescued you from petrification. What have you to give me as payment?~GOTO TR1
IF ~!Global("TR_Petrihint","Global",101)~THEN REPLY ~My name is unimportant. All that matters is that you are free from petrification. ~GOTO TR1
END

APPEND Tamah
IF~~THEN BEGIN TR1
SAY~Petri...? How... I remember fighting some gnolls and... and one turned to stone right before my eyes! I turned around and there was this mage and a lizard-thing... and then... and then you. I was turned to stone? For how long?~
IF~~THEN REPLY~I do not know. All that is important is that you are free now.~ DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@03,QUEST)~ GOTO 5
IF~~THEN REPLY~I do not care. I suggest you pay me for your rescue lest you join the dead once more. ~ DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@03,QUEST)~ GOTO 3
IF ~GlobalGT("TR_Petrihint","Global",0)~ THEN REPLY ~A mage who controls basilisks, where have I heard that before?~ DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@03,QUEST)~GOTO TR2
END

IF~~THEN BEGIN TR2
SAY~They've done this to others? Of course they did, why should they've done this only to me, the mage acted so...professional.~
IF~~THEN REPLY~Don't worry, I'm alarmed and do what I can about it. Meanwhile, all that is important is that you are free now.~ GOTO 5
IF~~THEN REPLY~Who cares, I'm alarmed and will stay out of his way. Meanwhile, I suggest you pay me for your rescue.~ GOTO 3
END

END

BEGIN ~CORIAN~

IF ~  NumTimesTalkedTo(0) ~ THEN BEGIN Clue1
SAY ~I'm so glad you found me out here. Basilisks aren't exactly the thing to face alone. Especially not if controlled by mages. I'm going home but if you want to hunt them down, make sure you take this potion of mirrored eyes along with you. Their abode can't be too far from here.~
IF ~~ THEN REPLY ~You should be safe now.  Thank you for the advice.~ DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@02,QUEST)AddexperienceParty(50) GiveItemCreate("POTN38",LastTalkedToBy,1,0,0) EscapeArea()~ EXIT
IF ~~ THEN REPLY~Gee, thanks.  I save you from being a permanent bird perch and all you can give me is a shred of advice and a bottle of murky liquid.  Leave before I turn you back to stone!~ DO ~IncrementGlobal("TR_Petrihint","Global",1)AddJournalEntry(@02,QUEST)GiveItemCreate("POTN38",LastTalkedToBy,1,0,0) EscapeArea() ~ EXIT
IF ~~ THEN REPLY ~Thank you for your advice, but I would prefer if you joined me in tracking down those beasts.~ GOTO Clue2
IF ~GlobalGT("TR_Petrihint","Global",0)~ THEN REPLY ~A mage who controls basilisks, where have I heard that before?~ GOTO Clue3
END

IF ~~ THEN BEGIN Clue2
SAY ~Oh no, you don't... If you want to face that mage and his basilisk, that's your business. I'm heading home.~
IF ~~ THEN DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@02,QUEST)AddexperienceParty(50) GiveItemCreate("POTN38",LastTalkedToBy,1,0,0) EscapeArea() ~EXIT
END

IF ~~ THEN BEGIN Clue3
SAY ~I'm not their only victim...Someone's got to stop them - but not me. If you want to face that mage and his basilisk, that's your business. I'm heading home.~
IF ~~ THEN DO ~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@02,QUEST)AddexperienceParty(50) GiveItemCreate("POTN38",LastTalkedToBy,1,0,0) EscapeArea() ~EXIT
END

IF ~  StateCheck(Myself,STATE_CHARMED) ~ THEN BEGIN Charmed
SAY~Must you? Look, it's been a long day for me... Oh, damn you after all!~
IF ~~ THEN DO ~EscapeArea() ~ EXIT
END

EXTEND_BOTTOM Mutami 0
IF ~GlobalGT("TR_Petrihint","Global",0)~ THEN REPLY ~So it's you who petrifies young women around here, sick psychopath! What is the purpose of this, speak?~GOTO TRMU1
END

APPEND Mutami
IF~~THEN BEGIN TRMU1
SAY~The master needs a virgin for his art. What has the land come to, there's none of them to be found with all these trollops swarming the Realms.~
IF~~THEN REPLY~The master? Which scoundrel has such needs? I will not go before you haven't told me the truth.~DO~AddJournalEntry(@08,QUEST)~GOTO 1
IF~~THEN REPLY~Monster, this will end right now.~DO~AddJournalEntry(@08,QUEST)~GOTO 1
IF~~THEN REPLY~Yeah, I have observed the same, good luck...I need to look for virgins myself...~DO~AddJournalEntry(@08,QUEST)~ GOTO 1
END
END

BEGIN TRNatina

IF ~  NumTimesTalkedTo(0) ~ THEN BEGIN Nat1
SAY ~Where am...who are...? This is not the Red Canyons!~
IF~~THEN REPLY~Calm yourself - if you can. You have been petrified and brought to Baldur's Gate. Ehem...I assume you are still a virgin.~ GOTO Nat2
IF~~THEN REPLY~Someone collects petrified virgins, they make good material for spells.~ GOTO Nat2
END

IF ~~ THEN BEGIN Nat2
SAY~You must be completely mad. Well, no, probably not it's not you who's mad, after all you rescued me. That mage with the basilisk, he's mad.~
=~So you say it was done because I'm still a virgin. I best loose my innocence as fast as I can.~
IF~~THEN REPLY~The Low Lantern in the harbour is the best place for that.~ GOTO Nat3
IF~Gender(Player1,MALE)~THEN REPLY~(Grin) I'm ready to help you with that.~ GOTO Nat3
IF~Gender(Player2,MALE)~THEN REPLY~(Grin) <PLAYER2> might be ready to help you with that.~ GOTO Nat3
IF~Gender(Player3,MALE)~THEN REPLY~(Grin) <PLAYER3> might be ready to help you with that.~ GOTO Nat3
IF~Gender(Player4,MALE)~THEN REPLY~(Grin) <PLAYER4> might be ready to help you with that.~ GOTO Nat3
IF~Gender(Player5,MALE)~THEN REPLY~(Grin) <PLAYER5> might be ready to help you with that.~ GOTO Nat3
IF~Gender(Player6,MALE)~THEN REPLY~(Grin) <PLAYER6> might be ready to help you with that.~ GOTO Nat3
IF~~THEN REPLY~Good luck with that.~ GOTO Nat3
END

IF ~~ THEN BEGIN Nat3
SAY~How dare you!~
IF~~THEN DO~EscapeArea()~EXIT
END

BEGIN TRSiri
IF ~  NumTimesTalkedTo(0) ~ THEN BEGIN Siri1
SAY ~Dirty land folk, what have you done to me? 'Tis an affront to our kin and you shall suffer for it!~
IF~~THEN REPLY~Calm yourself - if you can. It wasn't me you cast you to stone. I'm the one who freed you.~ GOTO Siri2
IF~~THEN REPLY~I'm afraid it was a mistake to help you.~ GOTO Siri2
END

IF ~~ THEN BEGIN Siri2
SAY~Mock me not, fool. The mage with the basilisk was of your race, a <PRO_RACE>. You pay for your deeds, land folk.~
IF~~THEN DO~IncrementGlobal("TR_Petrihint","Global",1) AddJournalEntry(@13,QUEST)Wait(1) Enemy()~EXIT
END

I_C_T Narcil 2 TR_Narchint
==Narcil IF~~THEN~The master will be delighted when he hears of my progress!~
END

EXTEND_BOTTOM Ramazi 3
IF~Global("TR_HasRama","Global",1)~THEN REPLY~Does your offer have anything to do with the gathering of obscure artefacts...like petrified young women for example?~GOTO TRRama1
END

EXTEND_BOTTOM Ramazi 4
IF~Global("TR_HasRama","Global",1)~THEN REPLY~Does your offer have anything to do with the gathering of obscure artefacts...like petrified young women for example?~GOTO TRRama1
END

EXTEND_BOTTOM Ramazi 5
IF~Global("TR_HasRama","Global",1)~THEN REPLY~Does your offer have anything to do with the gathering of obscure artefacts...like petrified young women for example?~GOTO TRRama1
END

APPEND Ramazi 
IF~~THEN BEGIN TRRama1
SAY~Ah, young friend, you hear of it? Not any young woman - a virgin it be. You have a virgin for me? No, I'd known if you had. Too bad maybe later, yes? Now first to the task at hand. Listem.~
IF~~THEN REPLY~(You stay silent and just nod for the mage to continue. Pretending to work for him may provide you with insight into his plans and possible svengali.)~DO~SetGlobal("TR_HasRama","Global",2) AddJournalEntry(@15,QUEST)~GOTO 6
IF~~THEN REPLY~You are a monster. You dissect these creatures to extract some spell ingredient from them.~GOTO TRRama2
END

IF~~THEN BEGIN TRRama2
SAY~Oh, you have named it! How cute. No longer useful you are, fool. Deadly self-defense! Come battle me at the top of my tower, if you dare!~
IF~~THEN DO~SetGlobal("RamazithMove","GLOBAL",3) SetGlobal("TR_HasRama","Global",2) Enemy()
ForceSpell(Myself,QUICK_TELEPORT) EscapeAreaMove("%NBaldursGate_RamazithsTower_L6%",169,147,SSE)~EXIT
END
END

BEGIN TRHold

IF ~  NumTimesTalkedTo(0) ~ THEN BEGIN Durl1
SAY~(Virgins?...They have...calm yourself...)~
=~Greetings travellers. Enjoying the old tower, yes? Can be a dangerous place.~
=~Just say, may any of those cute damsels be an innocent virgin still? Just try to make sure you not get into danger in a place like this.~
IF~~THEN REPLY~Virgin or not, that's not your business. What's the purpose of such an insulting question and what's the purpose of your basilisk pet?~ GOTO Durl2
IF ~GlobalGT("TR_Petrihint","Global",0)~ THEN REPLY ~A mage who controls basilisks, where have I heard that before?~ GOTO Durl3
IF~Global("TR_HasRama","Global",1)~THEN REPLY ~Who is that mage R. who pays scoundrels like you to gather his artefacts? Speak or die.~GOTO Durl4
END

IF~~THEN BEGIN Durl2
SAY~Ah, it's not too important since it seems I have to deal with all of you anyway and then select the usable one and sell the remainder as statues to art lovers...~
IF~~THEN DO~ActionOverride("TR_Basi",Enemy()) Enemy()~EXIT
END

IF~~THEN BEGIN Durl3
SAY~The master has many who serve him. You're lucky you met me, you will feel no pain.~
IF~~THEN DO~ActionOverride("TR_Basi",Enemy()) Enemy()~EXIT
END

IF~~THEN BEGIN Durl4
SAY~You know too much already to let you go. I hope you understand, you will feel no pain.~
IF~~THEN DO~ActionOverride("TR_Basi",Enemy()) Enemy()~EXIT
END