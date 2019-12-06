BEGIN TRGilb
BEGIN TRFrenz

CHAIN 
IF~AreaCheck("BD2000") NumTimesTalkedTo(0)~THEN TRGilb HavePap1
~Greetings. Do we have the pleasure to meet <CHARNAME>, the hero of Baldur's Gate?~
==TRFrenz~Why must you ask, Gilbert? The description was clear, it's <PRO_HIMHER> without doubt.~
==TRGilb~Hush, fool, no names. We stay incognito.~
END
++~How about telling me who you are instead?~+ HavePap2
++~I have met enough assassins that started their assaults with similar words.~+ HavePap2
++~Come to the point, man, we both know who I am.~+ HavePap2

CHAIN
IF~~THEN TRGilb HavePap2
~Sufficient to say that we are no foe. I wouldn't call us friends either, we just have some interest in an organisation we know you have randomly encountered.~
==TRFrenz~You probably haven't noticed it but we know you have some paper we need.~
==TRGilb~One of our agents...friends has been murdered and some evidence he carried was taken.~
END
++~This is extremely vague, don't you think so?~ EXTERN TRFrenz HavePap3
++~I'm no murderer - if your friend is dead he probably attacked us first.~ EXTERN TRFrenz HavePap3

CHAIN
IF~~THEN TRFrenz HavePap3
~Oh, you didn't kill him, <CHARNAME>, you killed the one who murdered him. ~
==TRGilb~Correct. You obtained the evidence our friend had found and which the Ru...foe tried to get back.~
END
++~Do we ever get to the point, man. I get tired of your riddles~EXTERN TRGilb HavePap4
++~(Sarcastic) It's all clear to me now. I know exactly what you're talking about.~EXTERN TRGilb HavePap4

CHAIN
IF~~THEN TRGilb HavePap4
~Fine. I'm referring to an assasin you killed on the Sword Coast. He had a report which listed seven names.~
==TRFrenz~The names of the Runemasters...~
==TRGilb~Hush, it was really too early to take you on a mission like this. You talk too much.~
END
++~I know which paper you talk about. Only - it did not list the names.~DO~AddExperienceParty(2000)~ + HavePap6
++~I don't know which paper you talk about, man.~+ HavePap5
++~I no longer have the paper, it was useless to me.~DO~AddExperienceParty(2000)~ + HavePap6

CHAIN
IF~~THEN TRGilb HavePap5
~There's no need for lies, <CHARNAME>, we have a witness who saw you taking it.~
==TRFrenz~You stepped in when I was about to kill the assassin myself.~
END
++~Yes, I know which paper you talk about. Only - it did not list the names.~DO~AddExperienceParty(1000)~ + HavePap6
++~I no longer have the paper, it was useless to me.~DO~AddExperienceParty(1000)~ + HavePap6

CHAIN
IF~~THEN TRGilb HavePap6 
~A pity. Those names in our hands could have saved many lives. These people on the list are really dangerous.~
==TRFrenz~You rarely find more scrupelous spellcaster in all of Faerun.~
END
++~Fact is that the part with the names had been torn off already when I got my hands on the paper.~ EXTERN TRFrenz HavePap7
++~Too bad but I never saw the names because the paper was already torn. Somebody took care the names would not fall into wrong hands.~ EXTERN TRFrenz HavePap7

CHAIN
IF~~THEN TRFrenz HavePap7
~Bah, <PRO_HESHE> lies, Gilbert! Let's kill <PRO_HIMHER> and search <PRO_HISHER> body.~
==TRGilb~NO NAMES! I said it before. And no, I believe <PRO_HESHE> tells the truth. The assassin was injured, we know that much. He would take no risk for anyone finding the names on him. What he had was evidence enough for his masters.~
==TRFrenz~Yeah, they would know their own bloody names, I guess.~DO~ForceSpell(Myself,DRYAD_TELEPORT)~
==TRGilb~Let us part cordially, <CHARNAME>, enough blood is shed in that matter.~DO~ ForceSpell(Myself,DRYAD_TELEPORT)~EXIT

EXTEND_TOP BDTeleri 2 #2
IF~Global("TR_HasRama","Global",6)~THEN REPLY~I see these very lifely statues all around, petrified people from what I can tell. Are you working for Oberan at Baldur's Gate as well?~GOTO Obera1
END

APPEND BDTeleri
IF~~THEN BEGIN Obera1
SAY~Oberan, that scoundrel! He tried to get hold of them for his purpose, but not with me!~
IF~~THEN REPLY~You may be glad then to hear he is dead. And if you care to know, it was me who killed him for what he did to innocent people.~ GOTO Obera2
IF~~THEN REPLY~Oberan wanted to use his specimen to extract spell ingredient from them. What is your purpose for them? ~GOTO 10
END

IF~~THEN BEGIN Obera2
SAY~Dead? That serves him right, the greedy mage. He had no eye for art.~
IF~~THEN GOTO 10
END
END