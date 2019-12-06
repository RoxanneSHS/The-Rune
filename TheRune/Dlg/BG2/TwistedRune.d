ADD_TRANS_TRIGGER HLShang 1
~!Global("TR_HasRama","Global",6)~

EXTEND_BOTTOM HLShang 1
IF~Global("TR_HasRama","Global",6)~THEN REPLY~I am in the Bridge District of Athkatla. What kind of tricks are you playing on me?~ GOTO 3
IF~Global("TR_HasRama","Global",6)~THEN REPLY~I am in a place where strange artefacts from the Realms are brought to.~ GOTO 2
END

EXTEND_BOTTOM HLShang 2
IF~Global("TR_HasRama","Global",6)~THEN REPLY~I come to report the death of Oberan at Baldur's Gate. He made the mistake to underestimate me. There will be no more supplies from that source.~DO~SetGlobal("TR_HasRama","Global",7) AddexperienceParty(9000)~GOTO 7
END

EXTEND_BOTTOM HLShang 3
IF~Global("TR_HasRama","Global",6)~THEN REPLY~I come to report the death of Oberan at Baldur's Gate. He made the mistake to underestimate me. There will be no more supplies from that source.~DO~SetGlobal("TR_HasRama","Global",7) AddexperienceParty(9000)~GOTO 7
END

BEGIN TRGilb2
BEGIN TRFrenz2

CHAIN
IF~Global("TR_HasRama","Global",7)~THEN TRGilb2 Rune1
~Congratulations, <CHARNAME>, I can't think of many who would have survived this encounter,~
DO~SetGlobal("TR_HasRama","Global",8)~
==TRFrenz2~Ever since our meeting at Boareskyr Bridge Gilbert was sure you would sooner or later pursue the Twisted Rune.~
==TRGilb2~Frenzek proposed to observe you, even if it took us some time to find your trace after you *vanished* from Baldur's Gate.~
END
++~I could have needed some help in there, cowards.~+ Rune2
++~So you knew what was expecting us inside?~+ Rune3

CHAIN
IF~~THEN TRGilb2 Rune2
~We tried but the portal was locked after you entered. You did not leave the key in the lock, didn't you?~
END
++~I needed a rogue stone and it vanished when I entered.~+ Rune3
++~Ah, so you didn't know the key is a rogue stone. Well, how could you...~ + Rune3

CHAIN
IF~~THEN TRGilb2 Rune3
~We didn't expect you to act so quickly and we did not know for sure what was inside.~
==TRFrenz2~Yeah, what precisely did you find? ~
END
++~If I had known it myself I might have used more caution...~ + Rune4
++~I was expecting some powerful mage but not that...~ + Rune4

CHAIN
IF~~THEN TRGilb2 Rune4
~What?~
==TRFrenz2~What?~
END
++~A lich named Shangalar and an undead lady named Shyressa. With some helpers, just if those two were not enough.~+ Rune5

CHAIN
IF~~THEN TRGilb2 Rune5
~Two of the seven, if rumours are correct.~
==TRFrenz2~Remenber that torn list you found on the assassin? Seven Runemaster's names were supposed to be on it.~
==TRGilb2~Those two might have been among them if our informants are to be trusted.~
==TRFrenz2~Was there no sign or hint to the others? Didn't you find any papers inside?~
==TRGilb2~Frenzek, that was not to be expected. You know that they leave no evidence and they know each other since undead centuries. They don't write down their names.~
==TRFrenz2~(Sigh.)~
END
++~We're glad to have found our way out - and a Staff of the Magi.~ + Rune6
++~The only thing this Shangalar revealed was that this building was in fact a base of the Twisted Rune.~ + Rune6

CHAIN
IF~~THEN TRGilb2 Rune6
~You have rightfully earned what you found inside. We will add this valuable scroll and shield from our resources.~DO~GiveItemCreate("scrl9z",LastTalkedToBy,1,0,0) GiveItemCreate("shld21",LastTalkedToBy,1,0,0)~
==TRFrenz2~Pray that nobody finds out about your involvement here. You don't want the Rune on your heels.~
==TRGilb2~Sometimes their own secrecy works for us. This place is shielded from all scrutiny and there's nobody left to bring the news to the other Runemasters. Good luck, <CHARNAME>.~ DO~ ForceSpell(Myself,DRYAD_TELEPORT)~
==TRFrenz2~Farewell. Back to Calimshan, Gilbert?~DO~ ForceSpell(Myself,DRYAD_TELEPORT)~EXIT

EXTEND_BOTTOM AMCST04 2
IF~GlobalGT("TR_HasRama","Global",5)~THEN REPLY~Yes, sure, where can I find the others? I have little patience.~GOTO Amrun1
END

EXTEND_BOTTOM AMCST04 3
IF~GlobalGT("TR_HasRama","Global",5)~THEN REPLY~After all I found someone who knows it - so where can I find the others of the Rune? I have little patience.~GOTO Amrun1
END

APPEND AMCST04
IF~~THEN BEGIN Amrun1
SAY~Eh? I haven't seen any of them. YOU are of the Rune? Forgive me, I...I was just repeating some rumour I've heard. Nobody has seen any of your colleagues around, I swear it.~
IF~~THEN REPLY~Be careful with your words. It may cost your life to stir up people like the Twisted Rune.~GOTO Amrun2
END

IF~~THEN BEGIN Amrun2
SAY~Sorry, master, I won't bother you any further.~
IF~~THEN DO~AddJournalEntry(@23,INFO) EscapeArea()~EXIT
END
END

INTERJECT AMFaheed 4 TRAlternatekey
==AMFaheed IF ~OR(2)Global("TR_Assas","Global",2) Global("TR_HasRama","Global",7) Global("PlayerHasStronghold","GLOBAL",1)~ THEN~Majira and me are in trouble.~
END
IF~~THEN REPLY~Just tell me and we'll see if we can sort this out mutually.~GOTO Amkey1


APPEND AMFaheed
IF~~THEN BEGIN Amkey1
SAY~Have you ever heard of a mage cabal called the Twisted Rune?~
IF~~THEN REPLY~I have had some unpleasant encounters with them in the past.~GOTO Amkey2
IF~Dead("HLVaxal")~THEN REPLY~I have destroyed one of their hideouts in Athkatla myself.~GOTO Amkey2
IF~Dead("Tanthf01")~THEN REPLY~I have spoiled one or the murderous plans in Amn recently.~GOTO Amkey2
END

IF~~THEN BEGIN Amkey2
SAY~By the gods, you hear that, Majira? There is hope for us after all.~
=~You still live after an encounter with the Rune - I trust you for that alone.~
=~We came from Calimshan which is a country controlled secretly in many parts by the Rune and their agents. Too few are those who work against them.~
IF~~THEN REPLY~Go on, I'm listening.~ GOTO Amkey4
IF~Global("TR_HasRama","Global",7) ~THEN REPLY~I have met Gilbert and Frenzek, probably friends of yours?~ GOTO Amkey3
END

IF~~THEN BEGIN Amkey3
SAY~You're the bhaalspawn they talked about - <CHARNAME>. This is even better than I could ever have dreamt.~
IF~~THEN GOTO Amkey4
END

IF~~THEN BEGIN Amkey4
SAY~To make it short - we were discovered by the Rune's agents in our homeland and escaped at the last minute. Our friends advised us to seek a mighty protector and they pointed us to Tethir and the bhaalspawns.~
=~However, when we arrived here we found most of them to be monstrosities except for Balthzar. There was no way for us to get to him though and in our dilemma we spent nearly all we had left to get this key. He must shelter us or we are lost.~
IF~~THEN REPLY~It will be a risk for you to rely on Balthazar alone since you don't know his answer. I give you mine. I'm a bhaalspawn with my own stronghold in Amn, far from the outcome of this war here. You will be save there with your wife.~GOTO Amkey5
IF~~THEN REPLY~Actually, I'd rather just kill you... lack of trust and all that.~ GOTO 7
IF~~THEN REPLY~I can always look for another way into the castle. I'll just leave you alone.~GOTO Amkey7
END

IF~~THEN BEGIN Amkey5
SAY~We gladly accept your offer, <CHARNAME>, just tell us what to do.~
IF~Global("JoinLathander","GLOBAL",1)~THEN REPLY~Go to the Lathander temple in Athkatla and tell them that I sent you. You will be safe there.~ GOTO 10
IF~Global("JoinHelm","GLOBAL",1)~THEN REPLY~Go to the Helm temple in Athkatla and tell them that I sent you. You will be safe there.~ GOTO 10
IF~Global("PaladinOrder","GLOBAL",1)~THEN REPLY~Go to the Order of the Radiant Heart in Athkatla and tell them that I sent you. You will be safe there.~ GOTO 10
IF~Global("PCSphere","GLOBAL",1)~THEN REPLY~Go to the Planar Sphere in Athkatla's slum and tell them that I sent you. You will be safe there.~ GOTO 10
IF~Global("PCKeepOwner","GLOBAL",1)~THEN REPLY~Go to the deArnise in Amn and tell them that I sent you. You will be safe there.~ GOTO 10
IF~Global("Playhouse","GLOBAL",1) ~THEN REPLY~Go to the Five Flagons Inn in Athkatla and down to the playhouse and tell them that I sent you. You will be safe there.~ GOTO 10
IF~Global("PlayerThiefGuild","GLOBAL",1) ~THEN REPLY~Go to the Guild House at Athkatla's docks and tell them that I sent you. You will be safe there.~ GOTO 10
IF~Global("RangerProtector","GLOBAL",1) ~THEN REPLY~Go to the Major of Imnesvale in Amn and ask for the ranger's cabin. You will be safe there.~ GOTO 10
END

IF~~THEN BEGIN Amkey7
SAY~I'm sorry, but I cannot allow for the chance that you will betray us.~
IF~~THEN DO~ ActionOverride("ammajira",Enemy()) Enemy() ~EXIT
END

END