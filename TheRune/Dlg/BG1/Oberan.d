ALTER_TRANS Oberan BEGIN 0 END BEGIN 0 END BEGIN "ACTION" ~~ "EPILOGUE" ~GOTO TR1~ END

ALTER_TRANS Oberan BEGIN 1 END BEGIN 0 END BEGIN "ACTION" ~~ "EPILOGUE" ~GOTO TR1~ END

APPEND Oberan

IF~~THEN BEGIN TR1
SAY~Good day, be off.~
IF~~THEN REPLY~Good Day, sir.~DO~SetNumTimesTalkedTo(0)~EXIT
IF~Global("TR_HasRama","Global",4)~THEN REPLY~We have some information about your dealings with the Mage Ramazith...~GOTO TR2
END

IF~~THEN BEGIN TR2
SAY~What?...and who...who might you be to intrude here on such business? Ramazith knows that utmost discretion is required in these issues.~
IF~~THEN REPLY~I'm <CHARNAME> and I'm not here on behalf of Ramazith. See in me the representative of the victims your operation has caused.~ GOTO TR3
IF~~THEN REPLY~My name matters not, what matters is that Ramazith will not deliver anything to you any more.~ GOTO TR3
IF~Dead("Ramazith")~THEN REPLY~Ramazith is dead.~ GOTO TR3
END

IF~~THEN BEGIN TR3
SAY~And how did you come by this information?~
IF~~THEN REPLY~This is not relevant. What matters is that you pay me for what I know about you.~ GOTO Payforit
IF~~THEN REPLY~Because I stopped his operation myself. As I will stop yours.~ GOTO TR4
IF~Dead("Ramazith")~THEN REPLY~Because I killed him. Just Like I'll kill you.~ GOTO TR4
END

IF~~THEN BEGIN Payforit
SAY~What do you demand?~
IF~~THEN REPLY~I'm not talking about gold, Oberan, I'm talking about you paying in blood.~ GOTO TR4
IF~~THEN REPLY~I want 8000GP to keep my mouth shut~ GOTO TR4
END

IF~~THEN BEGIN TR4
SAY~You've come to the wrong place with the wrong intention and you will soon regret it. Shandalar's daughters are here, and so is the Grand Duchess. This is a house of great respect in  Baldur's Gate and you're just an intruder. That's how someone like you will be dealt with.~
IF~~THEN DO~SetGlobal("TR_HasRama","Global",5) Enemy() ForceSpellPoint([440.420],QUICK_TELEPORT) EscapeAreaMove("%CentralBaldursGate_OberonsEstate_L1%",255,557,NE)~EXIT
END
END
