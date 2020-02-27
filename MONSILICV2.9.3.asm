;Moniteur MONSILIC Version 2.8
;Créé par Abderrahim SAHLI Mars 2015
;-----------------------------------------------------------------------------------
;Principaux changemenets et corrections par rapport à la version d'origine MONSILIC:
;controle de find de table des commandes par un "0" final au lieu du contrôle par le
; nombre de commande qui permet plus de souplesse de l'ajout de nouvelles comandes
;optimisation des routines d'entrées de nombre hexadécimaux par le remplacement de 4
; routines avec presque même code qui se répète par une seule routine qui appelle 4
; routines optimisées
;ajout routine de récpetion des données du port série, mais pas insérée dans tables
; commandes
;ajout de tables de conversion pour le nouveau assembleur ASSMSILIC à développer
;-----------------------------------------------------------------------------------
;Principaux changemenets et corrections par rapport à la version MONSILICV2:
;remplacement des routines S_TXD et S_RXD par de nouvelles routines entierement
; récrites respectivement par SENDACIA et RECVACIA pour ne plus faire référence dans
; la prochaine version à aucune routine de l'ancien moniteur E6809
;ajout de routines de gestion d'afficheur LCD:
; INITLCD qui initialise l'afficheur LCD
; SENDLCD envoi de caractère à l'afficheur LCD
; insertion routine d'affichage LCD dans la routine d'affichage OUT1CHAR et OUT2CHAR
;ajout adresse de base du PTM 6840 installé récemment dans le kit
;ajout nouvelles entrées à la table de conversion du nouveau assembleur ASSMSILIC
;ajout routine copie EEPROM "COPYEEPR" mais pas encore vérifiée
;ajout entrée commande assembleur ASSEMBLE dans table de commande
;ajout de squelette de la routine ASSEMBLE qui sera le point d'entrée de l'assembleur
; ASSESILIC
;optimisation du code des routine et suppression des instructions superflues:
; dans la routine CNVHXBCD: amélioration remise à 0 des variables temporaires
;mini editeur LCD pour ajustement affichage hors écran (adresse > 16 et ligne > 2)
;  pour afficheur 2 x 16 caractères
;-----------------------------------------------------------------------------------
;Principaux changemenets et corrections par rapport à la version MONSILICV2.2:
;gestion du mode d'adressage indéxé nul (complété par les post bytes)
;petit nettoyage du code et changement des emplacement de quelques messages
;-----------------------------------------------------------------------------------
;Principaux changemenets et corrections par rapport à la version MONSILICV2.3:
;gestion du mode d'adressage indéxé deplacement Accumulateur (complété par les post bytes)
;petit nettoyage du code et changement des emplacement de quelques messages
;-----------------------------------------------------------------------------------
;Principaux changemenets et corrections par rapport à la version MONSILICV2.4:
;routine et table d'assemblage des instructions de branchement "régulières"
;petites organisation du code dans la routine de conversion (assemblage) pour séparer
;les différentes portions du code de décodage des instructions
;déboggage et modification routine RECEIVRS
;-----------------------------------------------------------------------------------
;Principaux changemenets et corrections par rapport à la version MONSILICV2.5:
;remplacement des adressages des variables temporaires et de sauvegarde par adr. direct
;correction des bugs de copie de mémoire en mémoire COPYMEMR
;-----------------------------------------------------------------------------------
;Principaux changemenets et corrections par rapport à la version MONSILICV2.6:
;ajout routine génération horloge PTM pour ACIA (2400 bauds) et son lancement avant
;  l'initialisation de l'ACIA
;modification routine de gestion LCD "LCDEDIT" pour gérer l'afficheur LCD 4 L x 20 C
;modification du pricipe de gestion de l'éditeur LCD par manipulation des lignes et
;  colonnes
;modification des adresse des variables
;  ajout de variable de sauvegarde des registres, variables date et heures et autres
;  variables temporaires, variable adresse ligne et colonne LCD
;-----------------------------------------------------------------------------------
;Principaux changemenets et corrections par rapport à la version MONSILICV2.7:
;finalisation routine de gestion LCD "LCDEDIT" pour gérer l'afficheur LCD 4 L x 20 C
;ajout routine BULDBYTE (construction d'un octet à partir de 2 caractères héxadécimaux
;optimisation des routines BULDDATA et BULDADDR par l'appel de BULDBYTE
;ajout routine INPTADDR (Prompt pour entrée adresse) pour optimiser les routines 
;  VIEWMEMR, MDFYMEMR, COPYMEMR, COPYEEPR et LOADPROG
;ajout routine INPTDATA (Prompt pour entrée adresse) pour optimiser les routines 
;  VIEWMEMR, MDFYMEMR, COPYMEMR, COPYEEPR et LOADPROG
;ajout routine CNVBCDHX pour conversion nombre BCD <= 256 en nombre Hexadécimal 1 octet
;remplacement noms routines et leurs appels OUTHEXAD par OUTHEXAW et OUTHEXAW par OUTHEXAB
;optimisation routine OUTHEXAD par appel de la routine OUTHEXAB
;réorganisation ordre des routines pour plus de structuration
;réactivation routine READADC lecture entrée analogiques
;ajout entrée pour READADC dans table commandes
;ajout routines OUTDOLAR, OUTDASH et OUTDBPNT pour simplifier affichage des résultats
;annulation constante chaine DOLLARSG et remplacement de ses appels de OUTSTRNG par OUTDOLAR
;amélioration affichage des routines COPYMEMR et MDFYMEMR avec nouvelles routines
;petite optimisation de OUTSTRNG (remplacement sequénce LDA ,X et LEAX 1,X par LDA ,X+
;-----------------------------------------------------------------------------------
;Principaux changemenets et corrections par rapport à la version MONSILICV2.8:
;ajout routines INITKEYB pour initialisatin du CR du PIA pour activation interruption
;  et pour initialisation des variables nécessaires à la gestion clavier PS/2
;  et INPTKEYB pour gestion de récepton octet du clavier PS/2
;  cette routine INPTKEYB est appelée par l'interruption FIRQ du clavier
;ajout appel initialisation clavier dans le programme pricipale MONSILIC
;-----------------------------------------------------------------------------------
;Principaux changemenets et corrections par rapport à la version MONSILICV2.9:
;ajout routines COMPDATA pour comparer le contenu de 2 zones mémoires
;modification routine ASSEMBLE pour la rendre continue (sasie des mnémoniques et
;  instructions une après l'autre en assemblant chaque instruction à la volée et en
;  transférant le code opération assemblé vers une zone mémoire dédiée au programmes
;  assemblés
;modification de la routine LOADPROG en la renommant PROGLOAD et en renommant sa
;  commande d'appel par "P" et en remplaçant le caractère de terminaison de saisie
;  par $0D au lieu de $0D+$0A
;ajout de l'affichage du message de bienvenue et d'aide dans la routine d'initialisation
;ajout de l'entrée commande d'éffacement de l'afficheur LCD dans la table commandes
;annulation affichage message erreur caractère non hexadécimal dans routine SENDACIA
;-----------------------------------------------------------------------------------
;Principaux changemenets et corrections par rapport à la version MONSILICV2.9.2:
;modification de la routine ASSEMBLE en remplaçant le caractère de terminaison de
;  saisie par $0D au lieu de $0D+$0A
;modification de la routine INPTCMND en remplaçant le caractère de terminaison de
;  saisie par $0D au lieu de $0D+$0A
;ajout routine d'affichage de l'aide sur les commandes HELPCMND
;ajout de l'affichage de l'adresse physique des routines correspondantes à chaque commande
;remplacement de la référence à l'adresse fixe du PTM par référence EQU ("PTM")
;utlisation d'une pile propre au moniteur
;correction bug affichage adresses cible des Op Code assemblé dans routie CONVINST
;  en supprimant l'autoincrémentation de l'index Y (adresse cible) et en ajoutant
;  incrémentaion index Y (adresse cible) apprès son affichage
;-----------------------------------------------------------------------------------


;************************************************************************************
;Global Equates
;************************************************************************************
GWAIT	EQU	$F800	;Routine temporisation
DIS_MEM	EQU	$F406	;routine affichage adresse et données sur 7 segments

SRAMSTRT	EQU	$0000	;adresse début RAM (contient variables, piles, MONSILIC)
SRAMEND	EQU	$0FFF	;adresse fin RAM (contient variables, piles, MONSILIC)

EEPROMSTR	EQU	$8000	;adresse début EEPROM (contiendra données à enregistrer)
EEPROMEND	EQU	$BFFF	;adresse fin EEPROM (contiendra données à enregistrer)

EPROMSTRT	EQU	$F000	;adresse début EPROM (contiendra données à enregistrer)
EPROMEND	EQU	$FFFF	;adresse fin EPROM (contient routines ancien moniteur)

ACIA	EQU	$1000	;adresse de base de l'ACIA (port série 6850)
ACIASR	EQU	$1000	;adresse Status Register de l'ACIA (port série 6850)
ACIACR	EQU	$1000	;adresse Control Register de l'ACIA (port série 6850)
ACIATDR	EQU	$1001	;adresse Transmit Data Register de l'ACIA (port série 6850)
ACIARDR	EQU	$1001	;adresse Receive Data Register de l'ACIA (port série 6850)

;PIA base adress
PIA	EQU	$1400	;adresse de base du PIA (port parrallèle 6821)
;port A registers adresses
PIADDRA	EQU	PIA	;adresse port direction A
PIAINA	EQU	PIA	;adresse port entrée A
PIAOUTA	EQU	PIA	;adresse port sortie A
PIACRA	EQU	PIA+1	;adresse Control Register A
PIASRA	EQU	PIA+1	;adresse Status Register A
;port A registers adresses
PIADDRB	EQU	PIA	;adresse port direction B
PIAINB	EQU	PIA+2	;adresse port entrée B
PIAOUTB	EQU	PIA+2	;adresse port sortie B
PIACRB	EQU	PIA+3	;adresse Control Register B
PIASRB	EQU	PIA+3	;adresse Status Register A

PTM	EQU	$4000	;adresse de base du PTM (Programmable Timer Module 6840

LCDCD	EQU	$2000	;LCD Registre de commande
LCDDT	EQU	$2001	;LCD Registre de données

GESTFIRQ	EQU	$00F4	;gestionnaire FIRQ
;____________________________________________________________________________________


;************************************************************************************
;Variables and constants
;************************************************************************************
;Variables pour caractères
TEMPCHAR	EQU	$0180	;variable temporaire de type Char (pour un caractère)
TEMP2CHR	EQU	$0181	;variable temporaire de type Word (pour 2 caractères)
TEMPADDR	EQU	$0183	;variable temporaire de type word (pour les adresses)	
TEMPHEX1	EQU	$0185	;variable temporaire de type Byte (pour code car. Hexa)
TEMPHEX2	EQU	$0186	;variable temporaire de type Byte (pour code car. Hexa)
TEMPHEX3	EQU	$0187	;variable temporaire de type Byte (pour code car. Hexa)
TEMPHEX4	EQU	$0188	;variable temporaire de type Byte (pour code car. Hexa)
PRMPTCHR	EQU	$0189	;variable globale de type Char (contient caractère Prompt)
;variables pour registres
SAVSSTCK	EQU	$018A	;variable globale pour sauvegarde du Stack système
SAVUSTCK	EQU	$018C	;variable globale pour sauvegarde du Stack utilisateur
SAVXINDX	EQU	$018E	;variable globale pour sauvegarde de l'index X
SAVYINDX	EQU	$018E	;variable globale pour sauvegarde de l'index Y
SAVAACCU	EQU	$0190	;variable globale pour sauvegarde de l'accumulateur A
SAVBACCU	EQU	$0191	;variable globale pour sauvegarde de l'accumulateur B
SAVDPREG	EQU	$0192	;variable globale pour sauvegarde du registre DP
SAVCCREG	EQU	$0193	;variable globale pour sauvegarde du registre CC
SAVPCREG	EQU	$0194	;variable globale pour sauvegarde du registre PC

;variables pour octets et mots quelconque
TEMPBYTE	EQU	$0196	;variable temporaire de type Byte (pour données quelconque)
TEMPWORD	EQU	$0197	;variable temporaire de type Byte (pour données quelconque)

;variables pour date et heure compacts
BCENTSEC	EQU	$0199	;variable de sauvegarde temporaire centièmes seconde (octet)
BSECONDE	EQU	$01A0	;variable de sauvegarde temporaire des secondes (octet)
BMINUTES	EQU	$01A1	;variable de sauvegarde temporaire des minutes (octet)
BHOURES	EQU	$01A2	;variable de sauvegarde temporaire des minutes (octet)
BDAYS	EQU	$01A3	;variable de sauvegarde temporaire des jours (octet)
BMONTHS	EQU	$01A4	;variable de sauvegarde temporaire des mois (octet)
BYEAR	EQU	$01A5	;variable de sauvegarde temporaire des minutes (octet)
;variables pour date et heure sous forme de caractères
CCENTSEC	EQU	$01A7	;;variable de sauvegarde temporaire centièmes seconde (car.)
CSECONDE	EQU	$01B0	;variable de sauvegarde temporaire des secondes (caractères)
CMINUTES	EQU	$01B2	;variable de sauvegarde temporaire des minutes (caractères)
CHOURES	EQU	$01B4	;variable de sauvegarde temporaire des minutes (caractères)
CDAYS	EQU	$01B6	;variable de sauvegarde temporaire des jours (caractères)
CMONTHS	EQU	$01B8	;variable de sauvegarde temporaire des mois (caractères)
CYEAR	EQU	$01C0	;variable de sauvegarde temporaire des minutes (caractères)

;variables pour écran LCD
LINADRSS	EQU	$01C4	;variable globale pour adresse Ligne de l'écran LCD
CLNADRSS	EQU	$01C5	;variable globale pour adresse Colonne de l'écran LCD

;variables pour clavier PS/2
KEYBCNTR	EQU	$01C6	;variable globale compteur bits du clavier PS/2
SCANCODE	EQU	$01C7	;variable globale qui contiendra le ScanCode reçu du clavier
PNTBUFKB	EQU	$01C8	;variable globale qui contiendra le pointeur courant du buffer clavier
;STRTRCVD	EQU	$01C7	;variable globale indicat. état bit start: reçu $FF ou non 0

;buffer pour clavier PS/2 
BUFFERKB	EQU	$01CC	;zone buffer clavier	
BUFFKBSZ	EQU	$14	;taille buffer clavier 20 scancodes ou aractère suivant traitement	

;buffer pour chaine de caractères
BUFFERST	EQU	$01E0	;variable temporaire String (pour chaines de caractères)

;caractère Espace
SPACECHR	EQU	$20	;code du caractère espace
;____________________________________________________________________________________

	ORG	$0200	;point d'entrée
	
;************************************************************************************
;Initialisation variables et ACIA
;************************************************************************************
MONSILIC	
	;n'est pas obligatoire pour point d'entrée du programme principal
	;PSHS	A	;sauvegarder regsitre utilisé A
	
	LDS	#$003F
	LDA	#$01
	TFR	A,DP
	
	LDA	#$3E	;code hexadécimal du caractère ">"
	STA	<PRMPTCHR	;initialiser varaiable dédiée par caractère Prompt ">"
	
	LBSR	PTMSBAUD	;initialisation et génération onde rectangulaire 2400 bauds
	
	LBSR	INITACIA	;initialisation ACIA
	
	LBSR	INITLCD	;initialisation afficheur LCD
	
	LBSR	INITKEYB	;appel routine d'initialisation du clavier PS/2
	
	LDX	#WELCOMEM	;message  bienvenue
	LBSR	OUTSTRNG	;son affichage
	
	LBSR	OUTCRLF	;retour nouvelle ligne
	
	LBSR	INPTCMND	;vers point d'entrée du Moniteur: interpreteur commandes
	
	;n'est pas obligatoire pour point d'entrée du programme principal
	;PULS	A	;sauvegarder regsitre utilisé A

	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Command Table
;************************************************************************************
CMNDTABL	FCC	"H"
	FDB	HELPCMND	;adresse HELPCMND

	FCC	"S"
	FDB	INITLCD	;adresse INITLCD

	FCC	"P"
	FDB	PROGLOAD	;adresse PROGLOAD 

	FCC	"E"
	FDB	EXECPROG	;adresse EXECPROG

	FCC	"V"
	FDB	VIEWMEMR	;adresse VIEWMEMR

	FCC	"M"
	FDB	MDFYMEMR	;adresse MDFYMEMR

	FCC	"C"
	FDB	COPYMEMR	;adresse COPYMEMR
	
	FCC	"O"
	FDB	COMPMEMR	;adresse COMPMEMR
	
	FCC	"F"
	FDB	COPYEEPR	;adresse copie EEPROM
	
	FCC	"A"
	FDB	ASSEMBLE	;adresse ASSEMBLE
	
	FCC	"R"
	FDB	RECEIVRS	;adresse RECEIVRS
	
	FCC	"B"
	FDB	BOOTLOAD	;adresse BOOTLOAD Bootloader
	
	FCC	"I"
	FDB	READADC	;adresse READADC lecture entrée analogiques
	
	FCB	$00	;fin table
;____________________________________________________________________________________


;************************************************************************************
;Constants
;************************************************************************************
STRTADDR	FCC	"Adr Deb.: ", $00
ENDADDR	FCC	"Adr Fin: ", $00

SRCEADDR	FCC	"Adr Srce: ", $00
TRGTADDR	FCC	"Adr Cble: ", $00
NBRBYTES	FCC	"Nbr oct/grp: ", $00
NBREGRPS	FCC	"Nbr Groupes: ", $00 

ADDRMESS	FCC	"Adr Prg.: ", $00

MESSDATA	FCC	"Entr donne: ", $00
WELCOMEM	FCC	"SILICONAL Monitor, Abderrahim SAHLI 2015", $00
;____________________________________________________________________________________

	
;************************************************************************************
;Routine WAIT10MS Wait 10 milliseconds
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: Aucune
;************************************************************************************
WAIT10MS	PSHS	X	;sauvegarder registre utilisé
	
	LDX	#$0000	;initialisation compteur
LOOP	LEAX	1,x	;incrémentation compteur
	CMPX	#$02C8	;comparer compteur au nombre correspondant à 10ms
	BNE	LOOP	;si pas encore atteint reboucler
	
	PULS	X	;restaurer registre utilisé
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine PTMSBAUD Generation of rectangular wave for ACIA clock (BAUD 2400)
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: Aucune
;************************************************************************************
PTMSBAUD	PSHS	A,X	;sauvegarder regsitres utilisés
	
	LDX	#$000C	;valeur de comptage
	STX	PTM+6	;T-TM3
	
	LDA	#$92	;programation
	STA	PTM
	
	LDA	#$01	;adresse
	STA	PTM+1	;T-C2, registre de contrôle
	
	LDA	#$00
	STA	PTM	;T-C13, activation des horloges
	
	PULS	A,X	;restaurer registres utilisés
         
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine INITACIA Initialize ACIA for communication via serial port
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: Aucune
;************************************************************************************
INITACIA	PSHS	A	;sauvegarder regsitre utilisé A
	
	LDA	#$03	;master reset
	STA	ACIACR	;envoi au Control Register  
	LDA	#$55	;code binaire de configuration: 01010101
	STA	ACIACR	;envoi au Control Register
	
	PULS	A	;restaurer registre utilisé A
         
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine INITKEYB Initialize PS/2 Keyboard, PIA CR and variables for keyboard
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: Aucune
;************************************************************************************
KEYBTABL	FCC	$15
	FCC	"A"
	
	FCC	$1D
	FCC	"Z"
	
	FCC	$24
	FCC	"E"
	
	FCC	$2D
	FCC	"R"
	
	FCC	$2C
	FCC	"T"
	
	FCC	$35
	FCC	"Y"
	
	FCC	$3C
	FCC	"U"
	
	FCC	$43
	FCC	"I"
	
	FCC	$44
	FCC	"O"
	
	FCC	$4D
	FCC	"P"
		
	FCC	$1C
	FCC	"Q"
	
	FCC	$1B
	FCC	"S"
	
	FCC	$23
	FCC	"D"
	
	FCC	$2B
	FCC	"F"
	
	FCC	$34
	FCC	"G"
	
	FCC	$33
	FCC	"H"
	
	FCC	$3B
	FCC	"J"
	
	FCC	$42
	FCC	"K"
	
	FCC	$4B
	FCC	"L"
	
	FCC	$4C
	FCC	"M"
	
	FCC	$1A
	FCC	"W"
	
	FCC	$22
	FCC	"X"
	
	FCC	$21
	FCC	"C"
	
	FCC	$2A
	FCC	"V"
	
	FCC	$32
	FCC	"B"
	
	FCC	$31
	FCC	"N"
	
	FCC	$41
	FCC	","
	
	FCC	$29
	FCC	" "
	
	FCC	$70
	FCC	"0"
	
	FCC	$69
	FCC	"1"
	
	FCC	$72
	FCC	"2"
	
	FCC	$7A
	FCC	"3"
	
	FCC	$6B
	FCC	"4"
	
	FCC	$73
	FCC	"5"
	
	FCC	$74
	FCC	"6"
	
	FCC	$6C
	FCC	"7"
	
	FCC	$75
	FCC	"8"
	
	FCC	$7D
	FCC	"9"
	
	FCC	$25
	FCC	"#"
	
	FCC	$5B
	FCC	"$"
	
	FCC	$79
	FCC	"+"
	
	FCC	$7B
	FCC	"-"
	
	FCC	$5A
	FCC	$0D
	
	FCC	$14
	FCC	$0A
	
	FCC	$76
	FCC	$1B
	
	FCC	$00
	
INITKEYB	PSHS	A,X,Y	;sauvegarder regsitre utilisé A
	
	LDA	#%00000101;bit 0: IRQ validée, bit1: CB  active sur front descendant
			;bit2: registre OUT adressé, bit3: interrupt. non validée
			;bit5: CB2 en entrée
	STA	PIACRB	;programmation PIA pour niterrupt. CB1

	LDA	#$0B	;initial. compteur de bits à 11, pour recevoir start + 8 bits
	STA	<KEYBCNTR	;sauvegarder compteur bits dans variable globale dédiée
	
	CLR	<SCANCODE	;initialiser à 0 du scancode qui contiendra code reçu clavier
	
	LDX	#BUFFERKB	;X <- adresse du buffer clavier
	STX	<PNTBUFKB	;X -> pointeur courant du buffer clavier
	
;début initialisation contenu buffer clavier à 0
	PSHS	X
	
	LDA	#BUFFKBSZ	;initialisation compteur octets buffer clavier
INIBUFKB	CLR	,X+	;mise à 0 du contenu d'une case mémoire du buffer clavier
	DECA		;décrementer compteur octets buffer clavier
	TSTA		;tester compteur octets buffer clavier
	BNE	INIBUFKB	;si B <> 0, reboucler. sinon (buffer entier initialisé), continuer	
	
	PULS	X
;fin initialisation contenu buffer clavier à 0
	
	;sinon (buffer initialisé en entier), initialisation adresse routine interruption
	LDY	#GESTFIRQ	;programme gestionnaire FIRQ
	LDA	#$7E	;insruction JMP
	STA	,Y
	LDX	#INPTKEYB	;adresse routine gestion interupption clavier (via CB1 du PIA)
	STX	1,Y
	
;début annulée pour test	
	;ANDCC	#%10111111	;activation FIRQ pour valider les demandes d'interruption
;fin annulée pour test	
	
	PULS	A,X,Y	;restaurer registre utilisé A
         
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine INITLCD Initialize LCD Display (Cursor home and clear screen)
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: Aucune
;************************************************************************************
INITLCD	PSHS	A	;sauvegarder regsitre utilisé A
	
	LDA	#$38	;
	STA	LCDCD	;envoi au Controle Register du LCD
	
	LBSR	WAIT10MS	;give time to LCD to run command
	
	LDA	#$0F	;
	STA	LCDCD	;envoi au Controle Register du LCD
	
	LBSR	WAIT10MS	;give time to LCD to run command
	
	LDA	#$06	;
	STA	LCDCD	;envoi au Controle Register du LCD
	
	LBSR	WAIT10MS	;give time to LCD to run command
	
	LDA	#$01	;cursor home and clear screen command
	STA	LCDCD	;envoi au Controle Register du LCD
	
	LBSR	WAIT10MS	;give time to LCD to run command
	
	CLR	<LINADRSS	;initialisation variable temporaire Ligne
	CLR	<CLNADRSS	;initialisation variable temporaire Colonne
	
	PULS	A	;restaurer registre utilisé A
         
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine LCDEDIT Management of LCD display
;Entrée: A: Caractère à afficher, 
;        LINADRSS: valeur sauvegardée de l'adresse de ligne actuelle LCD ($00 à $19)
;        CLNADRSS: valeur sauvegardée de l'adresse de colonne actuelle LCD ($00 à $03)	
;Sorties: Aucune
;Routines appelée: Aucune
;************************************************************************************
LASTLINE	EQU	$04	;numéro d'après dernière ligne
LASTCLMN	EQU	$14	;numéro d'après dernière colonne
	
ORGLINE1	EQU	$00	;adresse DDRAM origine line 1
ORGLINE2	EQU	$40	;adresse DDRAM origine line 2
ORGLINE3	EQU	$14	;adresse DDRAM origine line 3
ORGLINE4	EQU	$54	;adresse DDRAM origine line 4	

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
LCDEDIT	PSHS	B	;sauvegarder registre utilisé
	
	CLR	<TEMPBYTE	;initalisation à 0 variable booléene nouvelle ligne
	
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	
;début test retour ligne envoyé	
	CMPA	#$0D	;comparer caractère à afficher avec "Chariot Return"
	BNE	TSTENDLN	;si non égal, aller gérer le changement de ligne normal
	
	BRA	GONEWLIN	;si "Line Feed" aller traiter retour nouvelle ligne
	
TSTENDLN	LDB	<CLNADRSS	;A <- compteur Colonne
	CMPB	#LASTCLMN	;comparer colonne actuelle avec après dernière colonne
	BNE	TSTLIN1	;si fin de ligne non encore atteint aller tester lignes

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	
GONEWLIN	INC	<LINADRSS	;si égal, incrémenter compteur de lignes
	
	LDB	<LINADRSS	;et affecter A <- compteur ligne
	CMPB	#LASTLINE	;puis comparer ligne actuelle avec après dernière ligne
	BNE	CLRCOLMN	;si non égal après ligne, continuer (en mettant à 0 compteur colonnes)	
	
	CLR	<LINADRSS	;si égal après ligne, revenir à la 1ère ligne puis

CLRCOLMN	CLR	<CLNADRSS	;mettre à 0 le compteur de colonnes
	
	LDB	#$01	;#$01 -> nouvelle ligne
	STB	<TEMPBYTE	;variable considérée logique 
;fin test retour ligne envoyé
;-------------------------------------------------------------------------------------

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;test numéro ligne active pour définir quel origine utiliser pour déterminer adres DDRAM
	
;test ligne 1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
TSTLIN1	LDB	<LINADRSS	;B <- compteur ligne
	CMPB	#$00	;tester si ligne 1
	BNE	TSTLIN2	;si non, aller tester si ligne 2
	
	LDB	#ORGLINE1	;B <- adresse DDRAM origine pour la ligne 1
	ADDB	<CLNADRSS	;ajouter origine au compteur de Colonnes
	ORB	#$80	;ajuster adresse pour commande changement adresse DDRAM
	STB	LCDCD	;et le mettre dans registre commande LCD pour valider changem.
	
	BRA	TSTNEWLN	;aller vérifier si une nouvelle ligne
;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
	
;test ligne 2 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
TSTLIN2	LDB	<LINADRSS	;B <- compteur ligne
	CMPB	#$01	;tester si ligne 2
	BNE	TSTLIN3	;si non, aller tester si ligne 3
	
	LDB	#ORGLINE2	;B <- adresse DDRAM origine pour la ligne 1
	ADDB	<CLNADRSS	;ajouter origine au compteur de Colonnes
	ORB	#$80	;ajuster adresse pour commande changement adresse DDRAM
	STB	LCDCD	;et le mettre dans registre commande LCD pour valider changem.
	
	BRA	TSTNEWLN	;aller vérifier si une nouvelle ligne
;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

;test ligne 3 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
TSTLIN3	LDB	<LINADRSS	;B <- compteur ligne
	CMPB	#$02	;tester si ligne 3
	BNE	TSTLIN4	;si non, aller tester si ligne 4
	
	LDB	#ORGLINE3	;B <- adresse DDRAM origine pour la ligne 1
	ADDB	<CLNADRSS	;ajouter origine au compteur de Colonnes
	ORB	#$80	;ajuster adresse pour commande changement adresse DDRAM
	STB	LCDCD	;et le mettre dans registre commande LCD pour valider changem.
	
	BRA	TSTNEWLN	;aller vérifier si une nouvelle ligne
;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

;test ligne 4 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
TSTLIN4	LDB	<LINADRSS	;B <- compteur ligne
	CMPB	#$03	;tester si ligne 4
	LBNE	ERRDDRAM	;si non, aller tester si ligne 20
	
	LDB	#ORGLINE4	;B <- adresse DDRAM origine pour la ligne 1
	ADDB	<CLNADRSS	;ajouter origine au compteur de Colonnes
	ORB	#$80	;ajuster adresse pour commande changement adresse DDRAM
	STB	LCDCD	;et le mettre dans registre commande LCD pour valider changem.
	
	BRA	TSTNEWLN	;aller vérifier si une nouvelle ligne
;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

TSTNEWLN	TST	<TEMPBYTE	;tester si variable considérée booléene = 0
	
	BEQ	AFLCDCAR	;si 0 donc pas nouvelle ligne, aller afficher caractère
			;si 1 donc nouvelle ligne, aller effacer la ligne
			
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<	
;début effacement nouvelle ligne et remise du curseur en début de ligne
CLRNEWLN	PSHS	A,B	;sauver registre A utilisé comme adresse DDRAM et B
	
	LDB	#$00	;initialistaion compteur adresse afficheur
	
LOOPCLRC	LDA	#SPACECHR	;Afficher caractère (Espace)
	STA	LCDDT	;sur LCD pour effacer sa position
	
	LBSR	WAIT10MS
	
	INCB		;incrémenter compteur adresse afficheur
	CMPB	#LASTCLMN	;tester fin de ligne
	BNE	LOOPCLRC	;si non encore atteinte
	
	PULS	A,B	;restaurer registre A utilisé comme adresse DDRAM et B

	LBSR	WAIT10MS
	
	STB	LCDCD	;restaurer adresse DDRAM d'avant effacement
;fin effacement nouvelle ligne et remise du curseur en début de ligne

	BRA	AFLCDCAR	;aller afficher le caractère sur l'afficher LCD	
;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

ERRDDRAM	BRA	EXITROUT

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
AFLCDCAR	CMPA	#$0D	;tester caractère = "Chariot Return"
	BEQ	EXITROUT	;si = "Line Feed", sortir
	
	CMPA	#$0A	;tester caractère = "Line Feed"
	BEQ	EXITROUT	;si = "Line Feed", sortir
	
	LBSR	WAIT10MS	;si différent de "Line Feed"

	STA	LCDDT	;Afficher donnée sur LCD
	INC	<CLNADRSS	;Incrémenter compteur Colonne LCD
;-------------------------------------------------------------------------------------
	
EXITROUT	PULS	B	;restaurer registre utilisé
	
	RTS
;____________________________________________________________________________________


;************************************************************************************
;Routine SENDACIA Send Byte via ACIA serial port
;Entrée: A=Octet à envoyer au port série
;Sorties: Aucune
;Routines appelée: Aucune
;************************************************************************************
SENDACIA	PSHS	B

	LDB	ACIASR	;(S_SR) lit état du Serial Status Register
	ANDB	#$08	;test CTS (#00001000b)
	BNE	SENDACIA	;reste en loop tant que CTS n'est pas actif
	
LOOPTDRE	LDB	ACIASR	;(S_SR) lit état du Serial Status Register
	ANDB	#$02	;test TDRE (#00000010b) (TxDataRegisterEmpty)
	BEQ	LOOPTDRE	;reste en loop tant que TDRE=0
	
	STA	ACIATDR	;(S_TDR) transfère donnée à TxDataRegister
	
	LBSR	LCDEDIT	;appeler gestionaire editeur LCD pour ajuster adresse affichage
	
	PULS	B
	
	RTS		;Fin de sous routine et retour au programme appelant
;____________________________________________________________________________________


;************************************************************************************
;Routine RECVACIA Receive Byte from ACIA serial port
;Entrée: Aucune
;Sorties: A=Donnée reçue du port série
;Routines appelée: Aucune
;************************************************************************************
RECVACIA	PSHS	B	;sauvegarder registre utilisé

;début annulé pour test entrée par clavier PS/2	
	;LDB	#$15	;(#00010101b) /RTS (bit 6) = 0 : actif
	;STB	ACIACR	;(S_CR) Serial Control Register
;LOOPNDAT	LDB	ACIASR	;(S_SR) Serial Status Register
	;ANDB	#$01	;test RDRF RxDataRegisterFull (bit 6)
	;BEQ	LOOPNDAT	;reste en loop tant qu'il n'y a pas de donnée
	
	;LDB	#$55	;(#01010101b) /RTS (bit 6) = 1 : non actif
	;STB	ACIACR	;(S_CR) Serial Control Register
	;LDA	ACIARDR	;(S_RDR) Serial Receive Data Register
;fin annulé pour test entrée par clavier PS/2	
	
;début test entrée par clavier PS/2
	CWAI	#%10111111
	
	LDA	<TEMPCHAR
	
	;ORCC	#%01000000	;désactivation FIRQ pour éviter autre appel récursif avant fin routine
;fin test entrée par clavier PS/2

	PULS	B	;restaurer registre utilisé
	
	RTS		;Fin de sous routine et retour au programme appelant
;____________________________________________________________________________________
	

;************************************************************************************
;Routine HELPCMND Display commands list
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: 
;************************************************************************************
HELPSCMD	FCC	"S: Clear LCD", $00
HELPPCMD	FCC	"P: Prog Load", $00
HELPECMD	FCC	"E: Exec Prog", $00
HELPVCMD	FCC	"V: View Mem", $00
HELPMCMD	FCC	"M: Modify Mem", $00
HELPCCMD	FCC	"C: Copy Mem", $00
HELPOCMD	FCC	"O: Compare Mem", $00
HELPFCMD	FCC	"F: Copy EEPROM", $00
HELPACMD	FCC	"A: Asmbl Prog", $00
HELPRCMD	FCC	"R: Recv Data", $00
HELPBCMD	FCC	"B: Bootloader", $00
HELPICMD	FCC	"I: Read ADC", $00	

HELPCMND	PSHS	X
	
	LDX	#HELPSCMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	
	LEAX	4,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	;...........................................................
	LDX	#HELPPCMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	LEAX	7,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	;........................................................
	LDX	#HELPECMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	LEAX	$0A,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	LBSR	INPTCHAR	;attente appuie sur touche
	
	;...........................................................
	LDX	#HELPVCMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	LEAX	$0D,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	;...........................................................
	LDX	#HELPMCMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	LEAX	$10,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	;...........................................................
	LDX	#HELPCCMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	LEAX	$13,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	LBSR	INPTCHAR	;attente appuie sur touche
	
	;...........................................................
	LDX	#HELPOCMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	LEAX	$16,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	;...........................................................
	LDX	#HELPFCMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	LEAX	$19,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	;...........................................................
	LDX	#HELPACMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	LEAX	$1C,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	LBSR	INPTCHAR	;attente appuie sur touche
	
	;...........................................................
	LDX	#HELPRCMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	LEAX	$1F,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	;...........................................................
	LDX	#HELPBCMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	LEAX	$22,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	;...........................................................
	LDX	#HELPICMD	;message d'aide sur les commandes
	LBSR	OUTSTRNG	;son affichage	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LDX     #CMNDTABL       ;charger X avec première entrée de la table commandes
	LEAX	$25,X
	
	LDA	,X+
	STA	<TEMP2CHR
	
	LDA	,X
	STA	<TEMP2CHR+1
	
	LBSR	OUTHEXAW
	LBSR	OUTCRLF
	
	PULS	X
	
	RTS
;____________________________________________________________________________________

		
;************************************************************************************
;Routine RECEIVRS Receive data from serial port to memory adress pointed by X
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: RECVACIA, DIS_MEM
;************************************************************************************
RECEIVRS	;demande nombre d'octets par groupes
	LDX	#NBRBYTES	;message entrée donnée
	LBSR	INPTADDR	;construire la donnée à partir des caractères hexa entrés
	
	LDD	<TEMPADDR	;récupération donnée construire à partir de la variable dédiée
	STB	<SAVBACCU	;sauvegarder donnée construire dans variable temporaire
	
	LBSR	OUTCRLF	;retour à la ligne suivante
	
;demande adresse cible
	LDX	#TRGTADDR
	LBSR	INPTADDR
	
	LDX	<TEMPADDR
		
	LBSR	OUTCRLF
		
DSLOOPEX	LDB	<SAVBACCU	;restauration accumulateur B à partir de variable globale

DSLOOPIN	PSHS	A	;Sauve A
	
	PSHS	B	;Sauve B
	
	LBSR	RECVACIA	;Saut vers routine (réception donnée par port série)
	
	STA	,X	;copie donnée reçu dans A vers adresse cible		

	PSHS	X	;sauvegarder index X changé dans routine DIS_MEM
	
	LBSR	DIS_MEM	;Saut vers routine DIS_MEM (Affiche adresse et donnée envoyée)
	
	PULS	X	;restauration index X changé dans routine DIS_MEM
		
	LEAX	1,X	;Incrémente X (compteur adresse source)
	
	PULS	B	;Restaure B (compeur octets de 256)
	PULS	A	;Restaure A (Compteur groupe de 16)
	
	DECB		;Décremente B (compeur octets de 256)
FSLOOPIN	LBNE	DSLOOPIN	;Si <> 0, Réentrer en boucle de 256 octets
	
	DECA		;Décremente A (Compteur de 256 octets)		
FSLOOPEX	LBPL	DSLOOPEX	;Si <> 0, Réentrer en boucle de 16 groupes
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine BOOTLOAD Receive data from serial port to memory adress pointed by X
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: RECVACIA, DIS_MEM
;************************************************************************************
BOOTLOAD	;demande nombre d'octets par groupes
	LDX	#NBRBYTES	;message entrée donnée
	LBSR	INPTADDR	;construire la donnée à partir des caractères hexa entrés
	
	LDD	<TEMPADDR	;récupération donnée construire à partir de la variable dédiée
	STB	<SAVBACCU	;sauvegarder donnée construire dans variable temporaire
	
	LBSR	OUTCRLF	;retour à la ligne suivante
	
;demande adresse cible
	LDX	#TRGTADDR
	LBSR	INPTADDR
	
	LDX	<TEMPADDR
	STX	<SAVXINDX
		
	LBSR	OUTCRLF
		
DBLOOPEX	LDB	<SAVBACCU	;restauration accumulateur B à partir de variable globale

DBLOOPIN	PSHS	A	;Sauve A
	
	PSHS	B	;Sauve B
	
	LBSR	RECVACIA	;Saut vers routine (réception donnée par port série)
	
	STA	,X	;copie donnée reçu dans A vers adresse cible		

	PSHS	X	;sauvegarder index X changé dans routine DIS_MEM
	
	LBSR	DIS_MEM	;Saut vers routine DIS_MEM (Affiche adresse et donnée envoyée)
	
	PULS	X	;restauration index X changé dans routine DIS_MEM
		
	LEAX	1,X	;Incrémente X (compteur adresse source)
	
	PULS	B	;Restaure B (compeur octets de 256)
	PULS	A	;Restaure A (Compteur groupe de 16)
	
	DECB		;Décremente B (compeur octets de 256)
FBLOOPIN	LBNE	DBLOOPIN	;Si <> 0, Réentrer en boucle de 256 octets
	
	DECA		;Décremente A (Compteur de 256 octets)		
FBLOOPEX	LBPL	DBLOOPEX	;Si <> 0, Réentrer en boucle de 16 groupes
	
	LDX	<SAVXINDX
	JSR	0,X	;sauter à sous routine dont l'adresse est contenue dans X
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________
	

;************************************************************************************
;Routine INPTKEYB Input Character from PS/2 keyboard
;Entrée: Aucune
;Sorties: TEMPCHAR=Code Ascii du Caractère saisi
;Routines appelée: INITACIA, RECVACIA
;************************************************************************************
PARIKBCN	FCC	"Part KEYBCNTR: ", $00
STOPKBCN	FCC	"STOP KEYBCNTR: ", $00
STRTKBCN	FCC	"STRT KEYBCNTR: ", $00
SCANMESS	FCC	"SCANCODE KEYB: ", $00
KBBUFPNT	FCC	"KEYBBUF POINT: ", $00

INPTKEYB	ORCC	#%01000000	;désactivation FIRQ pour éviter autre appel récursif avant fin routine
	
	PSHS	A,X	;sauvegarder registre utilisé
		
;début vérification si interruption vient du clavier et pas d'un autre périphérique
;	à implémenter prochainnement
;fin vérification si interruption vient du clavier et pas d'un autre périphérique

	LDX	<PNTBUFKB	;X <- Pointeur courant buffer clavier
	
;lecture PB0 pour lire les bits DATA du clavier	
READDATA	LDA	PIAINB	;puis lecture donnée port B pour lire état CLOCK du clavier
	ANDA	#$01	;isolation bit DATA du clavier, PB0 du port B du PIA
	
	TSTA		;tester bit reçu
	BEQ	BITEQZE	;si bit reçu nul, aller traiter décalage avec Carry = 0
			;si bit reçu non nul, traiter décalage avec Carry = 1
BITEQON	LDA	<SCANCODE	;lire ancienne valeur de l'octet
	ORCC	#$01	;mettre indicateur Carry à 1
	BRA	SHIFTREG	;aller traiter construction de l'octet reçu
	
BITEQZE	LDA	<SCANCODE	;lire ancienne valeur de l'octet
	ANDCC	#$FE	;mettre indicateur Carry à 0

SHIFTREG	RORA		;rotation à droite avec Carry pour enregistrer le bit DATA reçu	
	STA	<SCANCODE	;mettre à jour le scancode avec le nouveau bit reçu
	
	DEC	<KEYBCNTR	;decrémenter compteur octet scancode
	
	LDA	<KEYBCNTR	;tester compteur de bits DATA du clavier reçus
	CMPA	#$02	;comparer avec #$02
	BNE	EXITINKB	;si non égal, donc 8 bits pas tous lus, sortir pour attendre
			;nouveau front descendant horloge clavier pour lire bit DATA suivant
			
			;si égal, donc les huit bits sont tous lus, donc le convertir en code ASCII
	
;début conversion Scancode en code ASCII
	STX	<TEMPWORD	;enregistrer index X dans variable temporaire
	
	LDX	#KEYBTABL	;charger adresse table conversion Scancode dans index X
	
SRCHSCAN	LDA	,X	;charger A avec une entrée de table conversion Scancode
	
	CMPA	<SCANCODE	;si non atteinte, comparer Scancode avec entrée table conversion Scancode
	BEQ	CONVSCAN	;si non égale, aller comparer avec nouvelle entrée
	
	LEAX	2,X	;si égale, aller dans case "correspondance" en decrémentant X (au lieu de
			;l'incrémenter, car il a été incrémenté 2 fois en début de boucle)
	CMPA	#$00	;tester fin de table conversion Scancode
	BNE	SRCHSCAN	;si fin de table conversion scancode ASCII atteinte sortir
	
	LDX	<TEMPWORD	;récupérer index X de variable temporaire
	
	BRA	EXITINKB
	
CONVSCAN	LDA	1,X	;charger A avec code ASCII correspondant
	
	STA	<TEMPCHAR	;et le transférer dans variable caractère temporaire
	
	LDX	<TEMPWORD	;récupérer index X de variable temporaire
;fin conversion Scancode en code ASCII
	
	
	LDA	<TEMPCHAR	;enregistrer le code ASCII trouvé par table conversion conversion Scancode
	STA	,X+	;dans buffer clavier pointé par index X et incrémenter index X
	
;début annulation incrémentation pointeur du buffer clavier pour test
	;STX	<PNTBUFKB	;et mettre à jour le pointeur courant du buffer clavier avec la nouvelle
			;valeur incrémentée qui se trouve dans l'index X
;début annulation incrémentation pointeur du buffer clavier pour test
	
	CMPX	#BUFFERST	;tester si buffer clavier ne déborde pas sur buffer chaine caractères	
	BNE	OUTSCANC	;si pas de déordement du buffer clavier, aller afficher le Scancode
			;si débordement buffer clavier, ramener pointeur buffer clavier au début
			
;début initialisation contenu buffer clavier à 0
	PSHS	A,X
	
	LDA	#BUFFKBSZ	;initialisation compteur octets buffer clavier
INTBUFKB	CLR	,X+	;mise à 0 du contenu d'une case mémoire du buffer clavier
	DECA		;décrementer compteur octets buffer clavier
	TSTA		;tester compteur octets buffer clavier
	BNE	INTBUFKB	;si B <> 0, reboucler. sinon (buffer entier initialisé), continuer	
	
	PULS	A,X
;fin initialisation contenu buffer clavier à 0

	LDX	#BUFFERKB	;X <- adresse du buffer clavier
	STX	<PNTBUFKB	;X -> pointeur courant du buffer clavier
		
OUTSCANC	;LBSR	OUTDOLAR	;afficher signe Dollar
	;STA	<TEMPCHAR	;mettre Scancode dans variable temporaire pour appeler routine
	;LBSR	OUTHEXAB	;d'affichage du code ASCII reçu du clavier
	
	;LBSR	OUTDBPNT	;affichage du double point
	
	;LBSR	OUTSPACE	;affichage d'un espace
	
	;LBSR	OUT1CHAR	;d'affichage du caractère
	
	;LBSR	OUTCRLF	;retour ligne
	
	;LDA	#$0D
	;LBSR	SENDACIA
	
;début temporisation sous test
	LDA	#$10
TEMPLOOP	LBSR	WAIT10MS
	DECA
	TSTA
	BNE	TEMPLOOP
;fin temporisation sous test
	
	;initialisation compteur de bits reçus et du scan code pour un nouveau cycle de réception
	LDA	#$0B
	STA	<KEYBCNTR	;si bit de Stop atteint, reinitialiser compteur de bit à 0
	CLR	<SCANCODE	;et mettre à 0 la variable qui contiendra le nouveau Scancode
			 ;pour recommencer un nouveau cycle
	PULS	A,X	;restaurer registre utilisé
	
	RTI
	
EXITINKB	PULS	A,X	;restaurer registre utilisé
	
	ANDCC	#%10111111;activation FIRQ pour valider les nouvelles demandes d'interruption
	
	RTI		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________
	
	
;************************************************************************************
;Routine INPTCHAR Input Character
;Entrée: Aucune
;Sorties: TEMPCHAR=Code Ascii du Caractère saisi
;Routines appelée: INITACIA, RECVACIA
;************************************************************************************
INPTCHAR	PSHS	A,X	;sauvegarder registre utilisé

	LBSR	RECVACIA	;lecture caractère
	STA	<TEMPCHAR	;le mettre dans varaible dédiée
	
	PULS	A,X	;restaurer registre utilisé
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine INPTHEXA: Input Hexadecimal character
;Entrée: Aucune
;Sorties: A=Code Hexadécimal du Caractère saisi
;Routines appelée: RECVACIA, SENDACIA, OUTSTRNG
;************************************************************************************	
;ERRMESSG	FCC	"Pas hexadecim.!", $00	;message d'erreur à afficher

INPTHEXA	LBSR	RECVACIA	;lecture Caractère
	LBSR	SENDACIA	;affichage caractère reçu
	
	CMPA	#$30	;comparer caractère saisi avec "0"
	BLO	AFERMESS	;si < "O" aller traiter l'erreur
	
TSTHEXA9	CMPA	#$39	;sinon comparer avec "9"
	BGT	TSTHEXAA	;si > "9" donc pas Hexa, aller tester si < "A"
	
	BRA	ITISHEXA	;sinon (<= "9") c'est un caractère Hexadécimal, sortir	
	
TSTHEXAA	CMPA	#$41	;comparer caractère avec "A"
	BLO	AFERMESS	;si < "A" (et déjà > "9") donc pas Hexa, traiter erreur
	
TSTHEXAF	CMPA	#$46	;sinon (>= "A") le comparer avec "F"
	BGT	AFERMESS	;si > "F" donc pas Hexa, aller traiter erruer
	
ITISHEXA	RTS		;sinon (<= "F") donc caractère est Hexa et en A, sortir
	
AFERMESS	;PSHS	X	;sauvegarder X avant son changement

	;LDX	#ERRMESSG	;mettre adresse message d'erreur dans X	
	;LBSR	OUTSTRNG	;pour l'afficher sur teminal série
	
	;PULS	X	;restaurer ancienne valeur de X après son utilisation
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________

	
;************************************************************************************
;Routine INPTHEX1: Input 1st Hexadecimal character
;Entrée: Aucune
;Sorties: TEMPHEX1=Code Hexadécimal du Caractère saisi
;Routines appelée: INPTHEXA
;************************************************************************************
INPTHEX1	PSHS	A	

	BSR	INPTHEXA
	STA	<TEMPHEX1
	
	PULS	A
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________
	
	
;************************************************************************************
;Routine INPTHEX2: Input 2nd Hexadecimal character
;Entrée: Aucune
;Sorties: TEMPHEX2=Code Hexadécimal du Caractère saisi
;Routines appelée: INPTHEXA
;************************************************************************************
INPTHEX2	PSHS	A

	BSR	INPTHEXA
	STA	<TEMPHEX2
	
	PULS	A
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________

	
;************************************************************************************
;Routine INPTHEX3: Input 3rd Hexadecimal character
;Entrée: Aucune
;Sorties: TEMPHEX3=Code Hexadécimal du Caractère saisi
;Routines appelée: INPTHEXA
;************************************************************************************
INPTHEX3	PSHS	A

	BSR	INPTHEXA
	STA	<TEMPHEX3
	
	PULS	A
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________
	
	
;************************************************************************************
;Routine INPTHEX4: Input 4th Hexadecimal character
;Entrée: Aucune
;Sorties: TEMPHEX4=Code Hexadécimal du Caractère saisi
;Routines appelée: INPTHEXA
;************************************************************************************
INPTHEX4	PSHS	A
	
	BSR	INPTHEXA
	STA	<TEMPHEX4
	
	PULS	A
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________
	
	
;************************************************************************************
;Routine OUT1CHAR Out a Character
;Entrée: A=TEMPCHAR=Code Ascii du Caractère à afficher
;Sorties: Aucune
;Routines appelée: SENDACIA
;************************************************************************************
OUT1CHAR	PSHS	A	;sauvegarder registre utilisé
	
	LDA	<TEMPCHAR
	LBSR	SENDACIA
	
	PULS	A	;restaurer registre utilisé
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************	
;Routine OUT2CHAR Out 2 Characters
;Entrée: TEMP2CHR=Code Ascii du Caractère à afficher
;Sorties: Aucune
;Routines appelée: SENDACIA
;************************************************************************************
OUT2CHAR	PSHS	A	;sauvegarder registre utilisé

	LDA	<TEMP2CHR
	LBSR	SENDACIA
	
	LBSR	WAIT10MS

	LDA	<TEMP2CHR+1
	LBSR	SENDACIA
	
	PULS	A	;restaurer registre utilisé
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________
	
	
;************************************************************************************
;Routine OUTPRMPT Out Prompt Character
;Entrée: Aucune
;Sorties: TEMPCHAR=">" 
;Routines appelée: SENDACIA
;************************************************************************************
OUTPRMPT	PSHS	A	;sauvegarder registre utilisé
	
	LDA	<PRMPTCHR
	LBSR	SENDACIA

	PULS	A	;restaurer registre utilisé
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________

	
;************************************************************************************
;Routine OUTSPACE Out Space Character
;Entrée: Aucune
;Sorties: Aucune 
;Routines appelée: SENDACIA
;************************************************************************************
OUTSPACE	PSHS	A	;sauvegarder registre utilisé

	LDA	#SPACECHR
	LBSR	SENDACIA
	
	PULS	A	;restaurer registre utilisé
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________

	
;************************************************************************************
;Routine OUTCRLF: Out Chariot Return & Line Feed
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: SENDACIA
;************************************************************************************
OUTCRLF	PSHS	A	;sauvegarder registre utilisé

	LDA	#$0D
	LBSR	SENDACIA
	
	LBSR	WAIT10MS

	LDA	#$0A
	LBSR	SENDACIA
	
	PULS	A	;restaurer registre utilisé

	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine OUTDOLAR: Out Dollar sign "$"
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: INITACIA
;************************************************************************************
OUTDOLAR	PSHS	A	;sauvegarder registre utilisé

	LDA	#'$
	LBSR	SENDACIA
		
	PULS	A	;restaurer registre utilisé

	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine OUTDASH: Out Dash sign "-"
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: INITACIA
;************************************************************************************
OUTDASH	PSHS	A	;sauvegarder registre utilisé

	LDA	#'-
	LBSR	SENDACIA
		
	PULS	A	;restaurer registre utilisé

	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine OUTDBPNT: Out double point ":"
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: INITACIA
;************************************************************************************
OUTDBPNT	PSHS	A	;sauvegarder registre utilisé

	LDA	#':
	LBSR	SENDACIA
		
	PULS	A	;restaurer registre utilisé

	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine OUTSTRNG: Out String to serial port
;Entrée: X=Chaine de caractèrer à afficher, terminée par "0"
;Sorties: Aucune
;Routines appelée: SENDACIA
;*******************************************************************
OUTSTRNG	PSHS	A	;sauvegarder registre utilisé
	
	LDA	,X+	;Charger A avec premier charactère de la chaine
	
OUTSTRN1	LBSR	SENDACIA	;le transférer au terminal série
	
	LDA	,X+	;charger A avec caractère suivant	
	CMPA	#$00	;le comparer avec "0" terminal (caractère de fin de la chaine)	
	BNE	OUTSTRN1	;si fin chaine non encore atteinte, continuer en transférant au terminal
	
	PULS	A	;si fin de chaine restaurer registre A
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************	
;Routine OUTHEXAB Out Hexadecimal number in 2 characters
;Entrée: TEMPCHAR=Code Ascii du Caractère à afficher en hexadécimal
;Sorties: TEMP2CHR=Nibble supérieur, TEMP2CHR+1=Nibble inférieur
;Routines appelée: Aucune
;************************************************************************************
OUTHEXAB	PSHS	A,B

	LDA	<TEMPCHAR
	TFR	A,B
	ANDA	#$0F
	ORA	#$30
	ASRB
	ASRB
	ASRB
	ASRB
	ANDB	#$0F
	ORB	#$30
	CMPB	#$39
	BGT	CORRIGEB

AFFICHEB	STB	<TEMP2CHR
	
	BRA	TRAITEA

CORRIGEB	ADDB	#$07
	BRA	AFFICHEB

TRAITEA	CMPA	#$39
	BGT	CORRIGEA

AFFICHEA	STA	<TEMP2CHR+1
	
	LBSR	OUT2CHAR
	
	PULS	A,B
	
	RTS

CORRIGEA	ADDA	#$07
	BRA	AFFICHEA
;____________________________________________________________________________________
	
	
;************************************************************************************	
;Routine OUTHEXAW Out Hexadecimal number in 4 characters
;Entrée: TEMP2CHR=Code Ascii du 1er Caractère MSB à afficher en hexadéc.
;        TEMP2CHR+1=Code Ascii du 2eme Caractère LSB à afficher en hexa
;Sorties: TEMPHEX1=Nibble supérieur du 1ere nombre hexadécimal
;	TEMPHEX2=Nibble inférieur du 1ere nombre hexadécimal
;	TEMPHEX3=Nibble supérieur du 2eme nombre hexadécimal
;	TEMPHEX4=Nibble inférieur du 2eme nombre hexadécimal
;Routines appelée: OUTHEXAB
;************************************************************************************
OUTHEXAW	PSHS	A,B
	
	LDA	<TEMP2CHR
	LDB	<TEMP2CHR+1
	
;1er nombre hexadécimal
	STA	<TEMPCHAR
	
	BSR	OUTHEXAB
	
	LDA	<TEMP2CHR
	STA	<TEMPHEX1
	
	LDA	<TEMP2CHR+1
	STA	<TEMPHEX2

;2ème nombre hexadécimal		
	STB	<TEMPCHAR
	
	BSR	OUTHEXAB
	
	LDB	<TEMP2CHR
	STB	<TEMPHEX3
	
	LDB	<TEMP2CHR+1
	STB	<TEMPHEX4
	
	PULS	A,B
	
	RTS
;____________________________________________________________________________________

	
;************************************************************************************
;Routine CNVHXBCD Convert Hexadecimal number to BCD number
;Entrée: A=Nombre en hexadécimal à convertir
;Sorties: TEMPCHAR=Unités, TEMP2CHR=Dizaines, TEMP2CHR+1=Centaines
;Routines appelée: Aucune
;************************************************************************************
CNVHXBCD	CLR	<TEMPCHAR	;remise à 0 de variables temporaire
	CLR	<TEMP2CHR	;à utiliser dans la conversion
	CLR	<TEMP2CHR+1
	
CENTAINE	CMPA	#$64
	BLO	DIZAINES
	
	SUBA	#$64
	INC	<TEMPCHAR
	
	BRA	CENTAINE
	
DIZAINES	CMPA	#$0A
	BLO	UNITES
	
	SUBA	#$0A
	INC	<TEMP2CHR
	BRA	DIZAINES
	
UNITES	STA	<TEMP2CHR+1

	RTS
;____________________________________________________________________________________


;************************************************************************************
;Routine CNVBCDHX Convert BCD number to Hexadecimal number
;Entrée: TEMPCHAR=Unités, TEMP2CHR=Dizaines, TEMP2CHR+1=Centaines à convertir
;Sorties: A=MSB du Nombre en hexadécimal,B=LSB du Nombre en hexadécimal
;Routines appelée: Aucune
;************************************************************************************
CNVBCDHX	RTS
;____________________________________________________________________________________


;************************************************************************************
;Routine BULDBYTE Build a byte from 2 Hexa characters
;Entrée: A, B = 2 Hexa characters
;Sorties: TEMPCHAR = Data
;Routines appelée: Aucune
;************************************************************************************
;first hexa
BULDBYTE	CMPA	#$41
	BLO	NUMERIC5
	
ALPHANM5	SUBA	#$37
	BRA	BULDHEX5
	
NUMERIC5	SUBA	#$30

BULDHEX5	ASLA
	ASLA
	ASLA
	ASLA
	
	STA	<TEMPCHAR

;second hexa	
	CMPB	#$41
	BLO	NUMERIC6
	
ALPHANM6	SUBB	#$37
	BRA	BULDHEX6
	
NUMERIC6	SUBB	#$30

BULDHEX6	ORB	<TEMPCHAR
	STB	<TEMPCHAR
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________

	
;************************************************************************************
;Routine BULDADDR Build Address
;Entrée: TEMPHEX1, TEMPHEX2, TEMPHEX3, TEMPHEX4 = 4 Hexa characters
;Sorties: TEMPADDR, TEMPADDR+1 = Address
;Routines appelée: Aucune
;************************************************************************************
BULDADDR	PSHS	A,B	;sauvegarder registre utilisés
	
	LDA	<TEMPHEX1
	LDB	<TEMPHEX2
	
	BSR	BULDBYTE
	
	LDA	<TEMPCHAR
	STA	<TEMPADDR

	LDA	<TEMPHEX3
	LDB	<TEMPHEX4
	
	BSR	BULDBYTE
	
	LDA	<TEMPCHAR
	STA	<TEMPADDR+1
	
	PULS	A,B	;restaurer registres utilisés
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine BULDDATA Build Data
;Entrée: TEMPHEX1, TEMPHEX2 = 2 Hexa characters
;Sorties: TEMPCHAR = Data
;Routines appelée: BULDBYTE
;************************************************************************************
BULDDATA	PSHS	A,B	;sauvegarder registre utilisés
	
	LDA	<TEMPHEX1
	LDB	<TEMPHEX2
	
	BSR	BULDBYTE		

	PULS	A,B	;restaurer registres utilisés
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine INPTADDR: demande saisie adresse de fin
;Entrée: X: Adresse chaine caractères à afficher comme prompt de saisie d'adresse
;Sorties: TEMPADDR
;Routines appelée: Aucune
;************************************************************************************
INPTADDR	LBSR	OUTSTRNG	;afficher message d'entrée d'adresse
	
	LBSR	OUTDOLAR	;afficher signe "$"
	
	LBSR	INPTHEX1	;entrer 1er caractère Hexa de l'adresse
	LBSR	INPTHEX2	;entrer 2eme caractère Hexa de l'adresse
	LBSR	INPTHEX3	;entrer 3eme caractère Hexa de l'adresse
	LBSR	INPTHEX4	;entrer 4eme caractère Hexa de l'adresse
	
	LBSR	BULDADDR	;construire l'adresse à partir des caractères hexa entrés
	
	RTS
;____________________________________________________________________________________

	
;************************************************************************************
;Routine INPTDATA: demande saisie donnée (octet)
;Entrée: X: Adresse chaine caractères à afficher commoe prompt de saisie d'adresse
;Sorties: TEMPADDR
;Routines appelée: Aucune
;************************************************************************************
INPTDATA	LBSR	OUTDOLAR
	
	LBSR	INPTHEX1	;entrer 1er caractère Hexa de la donnée
	LBSR	INPTHEX2	;entrer 2eme caractère Hexa de la donnée
	
	LBSR	BULDDATA	;construire la donnée à partir des caractères hexa entrés
	
	RTS
;____________________________________________________________________________________


;************************************************************************************
;Routine INPTCMND Input Command
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: INPTCHAR, OUT1CHAR, EXECCMND
;************************************************************************************
INPTCMND	PSHS	A,X	;sauvegarder les registres utilisés

	LBSR	OUTPRMPT	;afficher Prompt pour l'attente de commande
	
	LDX	#BUFFERST	;index X pointe sur zone mémoire BUFFERST
	
INPTCMD1	LBSR	RECVACIA	;lecture Caractère
	
	LBSR	SENDACIA	;ecriture caractère reçu
	
	CMPA	#$0D	;caractère reçu = "Chariot Return"?
	;BEQ	INPTCMD2	;si oui aller à INPTCMND2: saisir et tester caractère suivant
	BEQ	INPTCMD3	;si oui aller à INPTCMND3: charger caractère $00 (0 terminal)
	
	STA	,X+	;sinon (caractère normal) le charger dans BUFFERST
	
	BRA	INPTCMD1	;aller lire caractère suivant
	
;INPTCMD2	STA	<TEMPCHAR	;sauvegarder premier caractère (CR) pour utilisation ultérieure
	
	;LBSR	RECVACIA	;lecture Caractère
	
	;LBSR	SENDACIA	;ecriture caractère reçu
	
	;STA	<TEMP2CHR	;sauvegarder premier caractère (CR) pour utilisation ultérieure
	
	;LDA	<TEMP2CHR	;sauvegarder premier caractère (CR) pour utilisation ultérieure
	
	;CMPA	#$0A	;caractère reçu = "Line Feed"?
	;BEQ	INPTCMD3	;si oui aller à INPTCMND3: charger caractère $00 dans BUFFERST
	
	;LDA	<TEMPCHAR	;sinon (caractère normal), charger caractère "CR"  
	;STA	,X+	;dans BUFFERST puisque caractère suivant est <> de "LF"	
	
	;LDA	<TEMP2CHR	;charger caractère (normal) suivant le caractère "CR"
	;STA	,X+	;dans BUFFERST puisque caractère suivant "CR" est <> de "LF"
	
	;BRA	INPTCMD1	;aller lire caractère suivant
	
INPTCMD3	LDA	#$00	;charger caractère $00 (caractère 0 terminal)
	STA	,X	;dans BUFFERST
	
	BSR	EXECCMND	;executer commande saisie
	
	PULS	A,X	;restaurer les registres utilisés
	
	BRA	INPTCMND
	
	RTS		;Fin de sous routine et retour au programme appelant
;____________________________________________________________________________________
	
	
;************************************************************************************
;Routine EXECCMND Execute command
;Entrée: BUFFERST=Commande reçue par RS232
;Sorties: 
;Routines appelée: OUTSTRNG, OUTCRLF
;************************************************************************************
ERCMDMES	FCC	"Cmnde non trv.!", $00	;si fin de table commandes atteint

EXECCMND	PSHS	A,X	;sauvegarder les registres utilisés

	LDX	#CMNDTABL	;charger X avec première entrée de la table commandes
	
CMPENTRY	LDA	,X	;A<-entrée de table commandes
	
	CMPA	<BUFFERST	;comparer commande saisie avec entrée de table commandes
	BEQ	EXECUTCMD	;si égale l'exécuter

	LEAX	3,X	;passer à l'adresse de l'entrée suivante de la table commandes
	
	CMPA	#$00
	BNE	CMPENTRY
	
	LDX	#ERCMDMES
	LBSR	OUTSTRNG	;afficher message d'erreur "Commande non trouvée!"
	LBSR	OUTCRLF
	
	BRA	RESTREXIT	;aller restaurer registres et sortir

EXECUTCMD	LDX	1,X	;charger X avec adresse contenue dans X+1
	
	JSR	,X	;sauter à sous routine dont l'adresse est contenue dans X
	
RESTREXIT	PULS	A,X	;restaurer les registres utilisés

	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________
	
	
;************************************************************************************
;Routine VIEWMEMR: Affiche une zone mémoire, début pointée par X et fin pointée par Y
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: INPTADDR, OUTCRLF, OUTHEXAW, OUTSPACE, OUTDBLPNT
;************************************************************************************
VIEWMEMR	PSHS	A,X
	
	LDX	#STRTADDR	;message entrée adresse début
	LBSR	INPTADDR	;demande saisie adresse
	
	LDX	<TEMPADDR
	
	PSHS	X
	
	LBSR	OUTCRLF
	
	LDX	#ENDADDR	;message entrée adresse fin
	LBSR	INPTADDR	;demande saisie adresse
	
	LBSR	OUTCRLF
	
	PULS	X
	
	CMPX	<TEMPADDR	;comparer adresse début avec adresse fin 
	BLE	VIEWMEM1	;si inférieure aller à VIEMEM1
	
	STX	<TEMPADDR	;sinon (début > fin) mettre adresse début dans adresse fin
	
VIEWMEM1	STX	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW	;afficher adresse en Hexadécimal
	LBSR	OUTDBPNT
	LBSR	OUTSPACE
	
	LDA	,X+
	STA	<TEMPCHAR
	
	LBSR	OUTHEXAB	;afficher donnée en Hexadécimal
	
	LBSR	OUTCRLF
	
	CMPX	<TEMPADDR
	BLS	VIEWMEM1
	
	PULS	A,X
	
	RTS
;____________________________________________________________________________________


;************************************************************************************
;Routine MDFYMEMR: Modifie une case mémoire en saisissant son nouveau contenu
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: INPTADDR, OUTHEXAW, OUTSPACE, OUTHEXAB, OUTDBPNT, INPTDATA, OUTCRLF
;************************************************************************************
MDFYMEMR	PSHS	A,X
	
	LDX	#STRTADDR	;message entrée adresse début
	LBSR	INPTADDR	;demande saisie adresse
		
	LDX	<TEMPADDR
	PSHS	X
	
	LBSR	OUTCRLF
	
	LDX	#ENDADDR	;message entrée adresse fin
	LBSR	INPTADDR	;demande saisie adresse
		
	LBSR	OUTCRLF
	
	PULS	X
	
	CMPX	<TEMPADDR	;comparer adresse début avec adresse fin 
	BLE	MDFYMEM1	;si inférieure aller à VIEMEM1
	
	STX	<TEMPADDR	;sinon (début > fin) mettre adresse début dans adresse fin
	
MDFYMEM1	STX	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW	;afficher adresse en Hexadécimal
	LBSR	OUTSPACE
	
	;affichage donnée
	LDA	,X
		
	STA	<TEMPCHAR
	
	LBSR	OUTHEXAB	;afficher donnée en Hexadécimal
	
	LBSR	OUTDBPNT	
	
	LBSR	OUTSPACE
	;fin affichage donnée
	
	LBSR	INPTDATA	;demande saisie donnée (octet) et construire la donnée
			;à partir des caractères hexa entrés
	LDA	<TEMPCHAR	;sauvegarder donnée construire dans variable dédiée
	
	LBSR	OUTCRLF
	
	STA	,X+	;la transférer dans l'adresse désignée
	
	CMPX	<TEMPADDR
	BLS	MDFYMEM1
	
	PULS	A,X
	
	RTS	
;____________________________________________________________________________________
	
	
;************************************************************************************
;Routine COPYMEMR: Copie une zone mémoire X de A groupes de B octets dans une autre zone Y
;Entrée: A=Nombre de groupes, B=Nombre d'octets par groupe, X=Adresse source, Y=Adresse cible
;Sorties: Aucune
;Routines appelée: INPTADDR, OUTHEXAW, OUTSPACE, OUTHEXAB, OUTDBPNT, INPTDATA,
;                  OUTCRLF, OUTSTRNG, OUTDASH, OUTPRMPT
;************************************************************************************
COPYMEMR	
;demande adresse source
	LDX	#SRCEADDR
	LBSR	INPTADDR
	
	LDX	<TEMPADDR
	
	PSHS	X	;sauvegarder X (adresse source)
	
	LBSR	OUTCRLF

;demande adresse cible	
	LDX	#TRGTADDR
	LBSR	INPTADDR
	
	LDY	<TEMPADDR
	
	LBSR	OUTCRLF	;retour à la ligne suivante
		
;demande nombre d'octets par groupes
	LDX	#NBRBYTES	;message entrée donnée
	LBSR	OUTSTRNG	;afficher message d'entrée d'adresse
	
	LBSR	INPTDATA	;demande saisie donnée (octet) et construire la donnée
			;à partir des caractères hexa entrés
	LDB	<TEMPCHAR	;utiliser donnée construire dans variable dédiée
	
	STB	<SAVBACCU	;sauvegarder données construite dans variable temporaire
	
	LBSR	OUTCRLF	;retour à la ligne suivante
	
	;début demande nombre groupes d'octets
	LDX	#NBREGRPS	;message entrée donnée
	LBSR	OUTSTRNG	;afficher message d'entrée d'adresse
	
	LBSR	INPTDATA	;demande saisie donnée (octet) et construire la donnée
			;à partir des caractères hexa entrés
	LDA	<TEMPCHAR	;sauvegarder donnée construire dans variable dédiée
	
	PULS	X	;restaurer X (adresse source) pour début de copie
	
	LBSR	OUTCRLF	;retour à la ligne suivante
	;fin demande nombre groupes d'octets
		
;copie des données	
DLOOPEX	LDB	<SAVBACCU	;utiliser donnée construire dans variable dédiée
		
	PSHS	A	;Sauve A (Compteur de groupes)
	
DLOOPIN	LDA	,X	;Charge donnée de mémoire source dans A		
	STA	,Y	;Mémorise donnée lue en mémoire cible
	
	;début affichage adresse source
	STX	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW	;afficher adresse en Hexadécimal
	LBSR	OUTDBPNT
	LBSR	OUTSPACE
	;fin affichage adresse source
	
	;début affichage donnée à copier
	LDA	,X
		
	STA	<TEMPCHAR
	
	LBSR	OUTHEXAB	;afficher donnée en Hexadécimal
	;fin affichage donnée à copier
	
	;début affichage signes de copie
	LBSR	OUTSPACE
	
	LBSR	OUTDASH	
	LBSR	OUTPRMPT
	
	LBSR	OUTSPACE
	;début affichage signes de copie
	
	;début affichage adresse cible
	STY	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW	;afficher adresse en Hexadécimal
	LBSR	OUTSPACE
	
	LBSR	OUTCRLF	;retour ligne
	;fin affichage adresse cible
	
	LEAX	1,X	;incrémentation index X
	
	LEAY	1,Y	;incrémentation index Y
		
	DECB		;Décremente B (compteur octets de 64)
FLOOPIN	BNE	DLOOPIN	;Si <> 0, Réentrer en boucle de 64 octets
	
	PULS	A	;Restaure A (Compteur de groupes)
	
	DECA		;Décremente A (Compteur d'octets)
FLOOPEX	BNE	DLOOPEX	;Si <> 0, Réentrer en boucle de 32 groupes

	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________
	
	
	
;************************************************************************************
;Routine COMPMEMR: Compare une zone mémoire X de A groupes de B octets avec une autre zone Y
;Entrée: A=Nombre de groupes, B=Nombre d'octets par groupe, X=Adresse source, Y=Adresse cible
;Sorties: Aucune
;Routines appelée: INPTADDR, GWAIT, DIS_MEM
;************************************************************************************
COMPMEMR	
;demande adresse source
	LDX	#SRCEADDR
	LBSR	INPTADDR
	
	LDX	<TEMPADDR
	
	PSHS	X	;sauvegarder X (adresse source)
	
	LBSR	OUTCRLF

;demande adresse cible	
	LDX	#TRGTADDR
	LBSR	INPTADDR
	
	LDY	<TEMPADDR
	
	LBSR	OUTCRLF	;retour à la ligne suivante
		
;demande nombre d'octets par groupes
	LDX	#NBRBYTES	;message entrée donnée
	LBSR	OUTSTRNG	;afficher message d'entrée d'adresse
	
	LBSR	INPTDATA	;demande saisie donnée (octet) et construire la donnée
			;à partir des caractères hexa entrés
	LDB	<TEMPCHAR	;utiliser donnée construire dans variable dédiée
	
	STB	<SAVBACCU	;sauvegarder données construite dans variable temporaire
	
	LBSR	OUTCRLF	;retour à la ligne suivante
	
	;début demande nombre groupes d'octets
	LDX	#NBREGRPS	;message entrée donnée
	LBSR	OUTSTRNG	;afficher message d'entrée d'adresse
	
	LBSR	INPTDATA	;demande saisie donnée (octet) et construire la donnée
			;à partir des caractères hexa entrés
	LDA	<TEMPCHAR	;sauvegarder donnée construire dans variable dédiée
	
	PULS	X	;restaurer X (adresse source) pour début de copie
	
	LBSR	OUTCRLF	;retour à la ligne suivante
	;fin demande nombre groupes d'octets
		
;copie des données	
DOLOOPEX	LDB	<SAVBACCU	;utiliser donnée construire dans variable dédiée
		
	PSHS	A	;Sauve A (Compteur de groupes)
	
DOLOOPIN	LDA	,X	;Charge donnée de mémoire source dans A		
	;STA	,Y	;Mémorise donnée lue en mémoire cible
	CMPA	,Y	;comparer donnée lue avec donnée en mémoire source
	BEQ	SUITE
	
	;début affichage adresse source
	STX	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW	;afficher adresse en Hexadécimal
	LBSR	OUTDBPNT
	LBSR	OUTSPACE
	;fin affichage adresse source
	
	;début affichage donnée source
	LDA	,X
		
	STA	<TEMPCHAR
	
	LBSR	OUTHEXAB	;afficher donnée en Hexadécimal
	;fin affichage donnée source
	
	;début affichage signes de copie
	LBSR	OUTSPACE
	
	LBSR	OUTDASH	
	
	LBSR	OUTSPACE
	;début affichage signes de copie
	
	;début affichage adresse cible
	STY	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW	;afficher adresse en Hexadécimal
	LBSR	OUTDBPNT
	LBSR	OUTSPACE
	;fin affichage adresse cible
	
	;début affichage donnée cible
	LDA	,Y
		
	STA	<TEMPCHAR
	
	LBSR	OUTHEXAB	;afficher donnée en Hexadécimal
	
	LBSR	OUTCRLF	;retour ligne
	;fin affichage donnée cible
	
SUITE	LEAX	1,X	;incrémentation index X
	
	LEAY	1,Y	;incrémentation index Y
		
	DECB		;Décremente B (compteur octets de 64)
FOLOOPIN	BNE	DOLOOPIN	;Si <> 0, Réentrer en boucle de 64 octets
	
	PULS	A	;Restaure A (Compteur de groupes)
	
	DECA		;Décremente A (Compteur d'octets)
FOLOOPEX	BNE	DOLOOPEX	;Si <> 0, Réentrer en boucle de 32 groupes

	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________
	
	
;************************************************************************************
;Routine COPYEEPR: Copie une zone mémoire X de A groupes de B octets dans une autre zone Y EEPROM
;Entrée: A=Nombre de groupes, B=Nombre d'octets par groupe, X=Adresse source, Y=Adresse cible
;Sorties: Aucune
;Routines appelée: INPTADDR, GWAIT, DIS_MEM
;************************************************************************************
;demande adresse source
COPYEEPR	LDX	#SRCEADDR
	LBSR	INPTADDR
	
	LDX	<TEMPADDR
	
	PSHS	X	;sauvegarder X (adresse source)
	
	LBSR	OUTCRLF

;demande adresse cible	
	LDX	#TRGTADDR
	LBSR	INPTADDR
	
	LDY	<TEMPADDR
	
	LBSR	OUTCRLF	;retour à la ligne suivante
		
;demande nombre d'octets par groupes
	LDX	#NBRBYTES	;message entrée donnée
	LBSR	OUTSTRNG	;afficher message d'entrée d'adresse
	
	LBSR	INPTDATA	;demande saisie donnée (octet) et construire la donnée
			;à partir des caractères hexa entrés
	LDB	<TEMPCHAR	;sauvegarder donnée construire dans variable dédiée
	
	LBSR	OUTCRLF	;retour à la ligne suivante
	
;demande nombre groupes d'octets
	LDX	#NBREGRPS	;message entrée donnée
	LBSR	OUTSTRNG	;afficher message d'entrée d'adresse
	
	LBSR	INPTDATA	;demande saisie donnée (octet) et construire la donnée
			;à partir des caractères hexa entrés
	LDA	<TEMPCHAR	;sauvegarder donnée construire dans variable dédiée
	
	PULS	X	;restaurer X (adresse source) pour début de copie
	
	LBSR	OUTCRLF	;retour à la ligne suivante
	
;mise en place de protection
	;PULS	A	;sauvegarde registres utilisés pour la protection
	
	;LDA	#$AA
	;STA	$5555	;adresse réelle à convertir en adresse EEPROM mapée selon décodage adresse
	
	;LDA	#$55
	;STA	$2AAA	;adresse réelle à convertir en adresse EEPROM mapée selon décodage adresse
	
	;LDA	#$AO
	;STA	$5555	;adresse réelle à convertir en adresse EEPROM mapée selon décodage adresse
	
	;PSHS	A	;restauration registres utilisés pour la protection
	
;copie des données	
DLOOPEXE	PSHS	B	;Sauve B (Compteur d'octets)
	
	PSHS	A	;Sauve A (Compteur de groupes)
	
DLOOPINE	LDA	,X+	;Charge donnée de mémoire source dans A		
	STA	,Y+	;Mémorise donnée lue en mémoire cible
	DECB		;Décremente B (compteur octets de 64)
FLOOPINE	BNE	DLOOPINE	;Si <> 0, Réentrer en boucle de 64 octets
	
	LDA	#$08	;8ms
	JSR	GWAIT	;Temporisation	

	JSR	DIS_MEM	;Saut vers routine DIS_MEM (Affiche adresse et donnée envoyée)
	
	PULS	A	;Restaure A (Compteur de groupes)
	
	DECA		;Décremente A (Compteur d'octets)
	
	PULS	B	;Restaure B pour le remettre au nombre d'octets initial
	
FLOOPEXE	BNE	DLOOPEXE	;Si <> 0, Réentrer en boucle de 32 groupes

	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________

	
;************************************************************************************
;Routine PROGLOAD: Load program into given adress (and execute it)
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: INPTADDR, OUTSTRNG, INPTHEX1, INPTHEX2, INPTHEX3, INPTHEX4
;		BULDADDR, BULDDATA, EXECPROG
;************************************************************************************
PROGLOAD	PSHS	A,X	;sauvegarder les registres utilisés

	LDX	#STRTADDR	;message entrée adresse début
	LBSR	INPTADDR	;demande saisie adresse
	
	LDX	<TEMPADDR	;sauvegarder adresse construire dans variable dédiée
	STX	<SAVXINDX	;sauvegarder adresse départ pour éxecution ultérieure
	
	PSHS	X	;sauvegarder X (adresse début)
	
	LBSR	OUTCRLF	;retour à la ligne suivante
		
	LDX	#MESSDATA	;message entrée donnée
	LBSR	OUTSTRNG	;afficher message d'entrée d'adresse
	
	PULS	X	;restaurer X (adresse début)
	
INPUTHEX	LBSR	OUTCRLF	

	STX	<TEMP2CHR	;X -< adresse programme coutante
	LBSR	OUTHEXAW	;afficher adresse courante
	LBSR	OUTSPACE	;plus un espace
	
	LBSR	INPTHEX1	;demande saisie donnée (octet) et construire la donnée
			;à partir des caractères hexa entrés
	
	LDA	<TEMPHEX1
	CMPA	#$0D	;compare with CR
	BEQ	EXECUTPRG	;si "CR", aller executer le programme
	
	LBSR	INPTHEX2
	
	LBSR	BULDDATA
	
	LDA	<TEMPCHAR	;sauvegarder donnée construire dans variable dédiée
	
	STA	,X+	;et le transférer dans l'adresse programme courante, incrémenter index
	
	BRA	INPUTHEX	;sinon, aller saisir nouvel octet programme
		
EXECUTPRG	LDX	SAVXINDX

	JSR	,X	;sauter à sous routine dont l'adresse est contenue dans X
	
	PULS	A,X	;restaurer les registres utilisés
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************
;Routine EXECPROG Execute program in specified adress
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée: INPTADDR, OUTSTRNG, INPTHEXA, BULDADDR
;************************************************************************************
EXECPROG	PSHS	X	;sauvegarder registre utilisé
	
	LDX	#ADDRMESS
	LBSR	INPTADDR
	
	LDX	<TEMPADDR
	
	LBSR	OUTCRLF
	
	JSR	,X
	
	PULS	X	;restaurer registre utilisé
	
	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;************************************************************************************	
;routines et programmes du nouveau assembleur ASSMSILIC et ses routines complémentaires	
;------------------------------------------------------------------------------------

;************************************************************************************
;Routine ASSEMBLE, Simple inline assembler for SILICONAL Kit
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée:
;************************************************************************************
ASSEMBLE	PSHS	A,X,Y	;sauvegarder les registres utilisés
	
	LDY	#$0F00	;index table op. codes
	
LOOPASSM	LDX	#BUFFERST	;index X pointe sur zone mémoire BUFFERST
	
ASSEMBLE1	LBSR	RECVACIA	;lecture Caractère
	LBSR	SENDACIA	;ecriture caractère reçu
	
	PSHS	A
	CMPA	#$0D	;caractère reçu = "Chariot Return"?
	;BEQ	ASSEMBLE2	;si oui aller à ASSEMBLE2: saisir et tester caractère suivant
	PULS	A
	BEQ	ASSEMBLE3	;si oui aller à ASSEMBLE3: charger caractère $00
	
	CMPA	#$1B
	BEQ	EXITASMBL
	
	STA	,X+	;sinon (caractère normal) le charger dans BUFFERST
	
	BRA	ASSEMBLE1	;aller lire caractère suivant
	
;ASSEMBLE2	STA	<TEMPCHAR	;sauvegarder premier caractère (CR) pour utilisation ultérieure
	
	;LBSR	RECVACIA	;lecture Caractère
	;LBSR	SENDACIA	;ecriture caractère reçu
	;STA	<TEMP2CHR	;sauvegarder premier caractère (CR) pour utilisation ultérieure
	
	;CMPA	#$0A	;caractère reçu = "Line Feed"?
	;BEQ	ASSEMBLE3	;si oui aller à ASSEMBLE3: charger caractère $00 dans BUFFERST
	
	;LDA	<TEMPCHAR	;sinon (caractère normal), charger caractère "CR"  
	;STA	,X+	;dans BUFFERST puisque caractère suivant est <> de "LF"	
	
	;LDA	<TEMP2CHR	;charger caractère (normal) suivant le caractère "CR"
	;STA	,X+	;dans BUFFERST puisque caractère suivant "CR" est <> de "LF"
	
	;BRA	ASSEMBLE1	;aller lire caractère suivant
	
ASSEMBLE3	LDA	#$00	;charger caractère $00 (caractère 0 terminal)
	STA	,X	;dans BUFFERST
	
	BSR	CONVISNT	;convertir instruction saisie
	
	LBSR	OUTCRLF	;retourner à la ligne suivante et
	
	BRA	LOOPASSM	 ;revenir à LOOPASSM pour saisir une nouvelle instruction
	
EXITASMBL	PULS	A,X,Y	;restaurer les registres utilisés
	
	RTS		;Fin de sous routine et retour au programme appelant
;____________________________________________________________________________________
	
	
;************************************************************************************
;Routine CONVISNT Convert instruction to op. code
;Entrée: BUFFERST=Commande reçue par RS232
;Sorties: 
;Routines appelée: OUTSTRNG
;************************************************************************************
ERINSMES	FCC	"Instr. non trv!", $00	;mess. fin de table commandes atteint
ERRMDADD	FCC	"Mde adr. indsp!", $00	;mess. mode adressage non disp.
ERINXMES	FCC	"Index incorrect!",$00	;mess. index utilisé est incorrect

CONVISNT	PSHS	A,B,X	;sauvegarder les registres utilisés

	LDX	#INSTTABL	;charger X avec première entrée de la table instructions
	
COMPINST	LDA	,X+	;A<-entrée de table instructions puis incrémenter index
	
	CMPA	BUFFERST	;comparer première lettre instr. saisie avec entrée de table instr.
	BEQ	COMP2NDL	;si égale, aller comparer seconde lettre	

	CMPA	#$00	;si non égal, test fin de table instructions
	BNE	CTRLBYT1	;pas encore atteinte
	
	LDX	#ERINSMES	;si fin de table atteinte, préparer message d'erreur
	LBSR	OUTSTRNG	;afficher message d'erreur "Instruction non trouvée!"
	
	LBRA	RSTREXIT	;aller restaurer registres et sortir

CTRLBYT1	LEAX	3,X	;incrémenter index pour atteindre octet de contrôle modes adressage
	BRA	NXTENTRY
	
COMP2NDL	LDA	,X+	;A<-entrée de table instructions puis incrémenter index
	CMPA	BUFFERST+1;comparer 2 eme lettre instr. avec entrée de table instr.
	BEQ	COMP3RDL	;si égale, aller comparer 3eme lettre	

	CMPA	#$00	;si non égal, test fin de table instructions
	BNE	CTRLBYT2	;pas encore atteinte
	
	LDX	#ERINSMES	;si fin de table atteinte, préparer message d'erreur
	LBSR	OUTSTRNG	;afficher message d'erreur "Instruction non trouvée!"
	
	LBRA	RSTREXIT	;aller restaurer registres et sortir
	
CTRLBYT2	LEAX	2,X	;incrémenter index pour atteindre octet de contrôle modes adressage
	BRA	NXTENTRY
	
COMP3RDL	LDA	,X+	;A<-entrée de table instructions puis incrémenter index
	CMPA	BUFFERST+2;comparer 3 eme lettre instr. avec entrée de table instr.
	BEQ	COMP4THL
	
	CMPA	#$00	;si non égal, test fin de table instructions
	BNE	CTRLBYT3	;pas encore atteinte
	
	LDX	#ERINSMES	;si fin de table atteinte, préparer message d'erreur
	LBSR	OUTSTRNG	;afficher message d'erreur "Instruction non trouvée!"
	
	LBRA	RSTREXIT	;aller restaurer registres et sortir
	
CTRLBYT3	LEAX	1,X	;incrémenter index pour atteindre octet de contrôle modes adressage
	BRA	NXTENTRY

COMP4THL	LDA	,X+	;A<-entrée de table instructions puis incrémenter index
	CMPA	BUFFERST+3;comparer 4 eme lettre instr. avec entrée de table instr.
	BEQ	EXECCONV
	
	CMPA	#$00	;si non égal, test fin de table instructions
	BNE	NXTENTRY	;pas encore atteinte
	
	LDX	#ERINSMES	;si fin de table atteinte, préparer message d'erreur
	LBSR	OUTSTRNG	;afficher message d'erreur "Instruction non trouvée!"
	
	LBRA	RSTREXIT	;aller restaurer registres et sortir
	
;calcul adresse nouvelle entrée instruction dans table instructions
NXTENTRY	CLRB		;mise à 0 du compteur de modes d'adressage disponibles
	
	LDA	,X+
	ASLA		;isolation indicateur mode adressage Immédiat
	BCC	ADDRMOD1	;si indicateur mode adressage Immédiat non actif	
	INCB		;incrémenter compteur modes d'adressage	

ADDRMOD1	ASLA		;isolation indicateur mode adressage Direct
	BCC	ADDRMOD2	;si indicateur mode adressage Direct non actif		
	INCB		;incrémenter compteur modes d'adressage

ADDRMOD2	ASLA		;isolation indicateur mode adressage Indéxé	
	BCC	ADDRMOD3	;si indicateur mode adressage Indéxé non actif		
	INCB		;incrémenter compteur modes d'adressage	

ADDRMOD3	ASLA		;isolation indicateur mode adressage Etendu	
	BCC	ADDNXTIN	;si indicateur mode adressage Etendu non actif		
	INCB		;incrémenter compteur modes d'adressage
	
ADDNXTIN	CMPB	#$00	;test nombre modes d'adressage
	BNE	MOVNXTIN	;si <> 0, donc continuer
	LDB	#$01	;si aucun mode d'adressage, donc mode Inhérent seul

MOVNXTIN	LEAX	B,X	;X <- adresse prochaine entrée dans la table instructions
	
	LBRA	COMPINST	;aller comparer l'instruction saisie avec cette entrée

EXECCONV	CLRB		;mise à 0 d'un compteur de modes d'adressage indisponibles
	
	LDA	,X	;A <- X (adresse mot de controle des modes disponibles)
	
	ASLA		;isolation indicateur mode adressage Immédiat
	BCS	CONTINUE	;si indicateur mode adressage Immédiat inactif, incrémenter B	
	DECB		;incrémenter compteur de modes adressage indisponibles
	
	ASLA		;isolation indicateur mode adressage Direct
	BCS	CONTINUE	;si indicateur mode adressage Immédiat inactif, incrémenter B	
	DECB		;incrémenter compteur de modes adressage indisponibles
	
CONTINUE	LDA	<BUFFERST+5

	CMPA	#'#	;test caractère suivant l'espace si c'est "#"
	BEQ	IMMEDIAT	;donc mode adressage Immédiat
	
	CMPA	#'$	;sinon le comparer avec "$"
	BEQ	TSTDRECT	;si égal donc aller tester si Direct ou Etendu
	
	CMPA	#',	;si <> "$" comparer avec ","
	LBEQ	INDEXNUL	;si égal donc mode adressage Indéxé déplacement nul
	
	CMPA	#$00	;test caractère suivant l'espace si c'est $00
	LBEQ	INHERENT	;donc mode adressage Inhérent
	
	LBRA	INDXOFFS	

;-----------------------------------------------------------------------------------
;traitement de l'assemblage du mode d'adressage Immédiat
;-----------------------------------------------------------------------------------
IMMEDIAT	;vérification si ce mode est disponible pour cette instruction
	LDA	,X+
	ASLA		;isolation indicateur mode adressage Immédiat, et incrémentation X
	LBCC	ERRMODIM	;si indicateur mode adressage Immédiat non actif	
	
	LDA	,X	;si oui, copier le code dans zone mémoire Op Code		
	STA	,Y	;indéxée par Y
	
	;début test affichage adresse copie Op Code
	STY	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW
	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LEAY	1,Y	 ;incrémenter Y
	;fin test affichage adresse copie Op Code
	
	STA	<TEMPCHAR	
	LBSR	OUTHEXAB	;afficher code opération assemblé
	
	LDA	<BUFFERST+7;A <- nibble suppérieur de la valeur immédiate
	STA	<TEMPCHAR	
	LBSR	OUT1CHAR;afficher nibble supérieur de la valeur immédiate
	
	LDA	<BUFFERST+8;A <- nibble inférieur de la valeur immédiate
	STA	<TEMPCHAR	
	LBSR	OUT1CHAR	;afficher nibble inférieur de la valeur immédiate
	
	LDA	<BUFFERST+7;A <- nibble suppérieur de la valeur immédiate
	LDB	<BUFFERST+8;B <- nibble inférieur de la valeur immédiate
	LBSR	BULDBYTE	;construction de l'octet à partir des deux nibbles	
	LDA	<TEMPCHAR	;récupération du l'octet construit
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
	
	LBRA	RSTREXIT	;aller vers restauration registres et exit
	
TSTDRECT	LDA	<BUFFERST+8
	CMPA	#$00
	LBNE	EXTENDED
	
;-----------------------------------------------------------------------------------
;traitement de l'assemblage du mode d'adressage Direct
;-----------------------------------------------------------------------------------
DIRECT	;vérification si ce mode est disponible pour cette instruction
	LDA	,X+	;incrémentation pour tomber sur l'op. code Direct
	ASLA		;isolation indicateur mode adressage Immédiat
	ASLA		;isolation indicateur mode adressage Direct, et incrémentation X
	LBCC	ERRMODIM	;si indicateur mode adressage Immédiat non actif	
	
	LEAX	1,X	;incrémentation pour tomber sur l'op. code Direct
	
	LEAX	B,X	;déduire le nombre de modes indisponible de X pour commencer
			;à partir du 1er mode disponible
	LDA	,X	;si oui, copier le code dans zone mémoire Op Code		
	STA	,Y	;indéxée par Y
	
	;début test affichage adresse copie Op Code
	STY	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW
	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LEAY	1,Y	 ;incrémenter Y
	;fin test affichage adresse copie Op Code
	
	STA	<TEMPCHAR	
	LBSR	OUTHEXAB	;afficher code opération assemblé
	
	LDA	<BUFFERST+6;A <- nibble suppérieur de l'adresse directe
	STA	<TEMPCHAR	
	LBSR	OUT1CHAR	;afficher nibble supérieur de l'adresse directe
	
	LDA	<BUFFERST+7;A <- nibble inférieur de l'adresse directe
	STA	<TEMPCHAR	
	LBSR	OUT1CHAR	;afficher nibble inférieur de l'adresse directe
	
	LDA	<BUFFERST+6;A <- nibble suppérieur de la valeur immédiate
	LDB	<BUFFERST+7;B <- nibble inférieur de la valeur immédiate
	LBSR	BULDBYTE	;construction de l'octet à partir des deux nibbles	
	LDA	<TEMPCHAR	;récupération du l'octet construit
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
		
	LBRA	RSTREXIT	;aller vers restauration registres et exit

;-----------------------------------------------------------------------------------
;traitement de l'assemblage du mode d'adressage Indexé déplacement nul
;-----------------------------------------------------------------------------------	
INDEXNUL	;vérification si ce mode est disponible pour cette instruction
	LDA	,X+	
	ASLA		;isolation indicateur mode adressage Immédiat
	ASLA		;isolation indicateur mode adressage Direct
	ASLA		;isolation indicateur mode adressage Indéxé, et incrémentation X
	LBCC	ERRMODIM	;si indicateur mode adressage Immédiat non actif	
	
	LEAX	2,X	;2 incrémentations de X pour tomber sur l'op.code Indéxé
	
	LEAX	B,X	;déduire le nombre de modes indisponible de X pour commencer
			;à partir du 1er mode disponible
	LDA	,X	;si oui, copier le code dans zone mémoire Op Code		
	STA	,Y	;indéxée par Y
	
	;début test affichage adresse copie Op Code
	STY	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW
	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LEAY	1,Y	 ;incrémenter Y
	;fin test affichage adresse copie Op Code
	
	STA	<TEMPCHAR	
	LBSR	OUTHEXAB	;afficher code opération assemblé
	
;traitement décodage Post Byte offset nul
	LDA	<BUFFERST+6;extraction index utilisé dans l'instruction	
	CMPA	#'X	;comparer avec X
	BNE	TSTINDXY
	
	LDA	#$84
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
	STA	<TEMPCHAR	
	LBSR	OUTHEXAB	;afficher Post Byte de l'index X
	
	LBRA	RSTREXIT	;aller vers restauration registres et exit

TSTINDXY	LDA	<BUFFERST+6;extraction index utilisé dans l'instruction
	CMPA	#'Y
	BNE	TSTINDXU
	
	LDA	#$A4
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
	STA	<TEMPCHAR	
	LBSR	OUTHEXAB	;afficher Post Byte de l'index U
	
	LBRA	RSTREXIT	;aller vers restauration registres et exit

TSTINDXU	LDA	<BUFFERST+6;extraction index utilisé dans l'instruction
	CMPA	#'U
	BNE	TSTINDXS
	
	LDA	#$C4
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
	STA	<TEMPCHAR	
	LBSR	OUTHEXAB	;afficher Post Byte de l'index X
	
	LBRA	RSTREXIT	;aller vers restauration registres et exit

TSTINDXS	LDA	<BUFFERST+6;extraction index utilisé dans l'instruction
	CMPA	#'S
	LBNE	ERRINDEX
	
	LDA	#$E4
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
	STA	<TEMPCHAR	
	LBSR	OUTHEXAB	;afficher Post Byte de l'index X
	
	LBRA	RSTREXIT	;aller vers restauration registres et exit

;-----------------------------------------------------------------------------------
;traitement de l'assemblage du mode d'adressage Indexé déplacement non nul
;-----------------------------------------------------------------------------------
INDXOFFS	;vérification si ce mode est disponible pour cette instruction
	LDA	,X+	
	ASLA		;isolation indicateur mode adressage Immédiat
	ASLA		;isolation indicateur mode adressage Direct
	ASLA		;isolation indicateur mode adressage Indéxé, et incrémentation X
	LBCC	ERRMODIM	;si indicateur mode adressage Immédiat non actif	
	
	LEAX	2,X	;2 incrémentations de X pour tomber sur l'op.code Indéxé
	
	LEAX	B,X	;déduire le nombre de modes indisponible de X pour commencer
			;à partir du 1er mode disponible
	LDA	,X	;si oui, copier le code dans zone mémoire Op Code		
	STA	,Y	;indéxée par Y
	
	;début test affichage adresse copie Op Code
	STY	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW
	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LEAY	1,Y	 ;incrémenter Y
	;fin test affichage adresse copie Op Code
	
	STA	<TEMPCHAR	
	LBSR	OUTHEXAB	;afficher code opération assemblé

;traitement décodage Post Byte mode indexé deplacement non nul
	LDA	<BUFFERST+6;extraction caractère mode indexé deplacement non nul	
	CMPA	#',	;comparer avec ","
	LBNE	INCDECPC	;aller traiter les modes indexé auto-ncrémenté/decrémenté, relatif PC
	
;tester le mode de deplacement autre que indexé nul à partir du caractère dans l'instruction
	LDA	<BUFFERST+5;extraction deplacement utilisé dans l'instruction	
	CMPA	#'0	;comparer avec X
	BLT	TSTACDEP	;aller traiter deplacement Accumulateur	
	
	CMPA	#'9	;comparer avec X
	BLE	TSTDEPCT	;aller tester deplacement constant
	
;-----------------------------------------------------------------------------------
;traitement de l'assemblage du mode d'adressage Indexé déplacement accumulateur
;-----------------------------------------------------------------------------------
;test accumulateur deplacement et détermination LSB du Post Byte
TSTACDEP	CMPA	#'A
	BEQ	DEPACCUA
	
	CMPA	#'B
	BEQ	DEPACCUB
	
	CMPA	#'D
	BEQ	DEPACCUD
	
	LBRA	ERRINDEX

DEPACCUA	LDA	#$06
	STA	<TEMPCHAR
	BRA	TSTINDX
	
DEPACCUB	LDA	#$05
	STA	<TEMPCHAR
	BRA	TSTINDX
	
DEPACCUD	LDA	#$0B
	STA	<TEMPCHAR	
	
;test index pour determiner MSB du Post Byte
TSTINDX	LDA	<BUFFERST+7;extraction index utilisé dans l'instruction
	CMPA	#'X
	BNE	TSTINDY
	
	LDA	#$80
	ADDA	<TEMPCHAR	
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
	STA	<TEMPCHAR
	LBSR	OUTHEXAB	;afficher Post Byte de l'index X
	
	LBRA	RSTREXIT	;aller vers restauration registres et exit
	
;test index utilisé pour déterminer le Post Byte
TSTINDY	LDA	<BUFFERST+7;extraction index utilisé dans l'instruction
	CMPA	#'Y
	BNE	TSTINDU
	
	LDA	#$A0
	ADDA	<TEMPCHAR	
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
	STA	<TEMPCHAR
	LBSR	OUTHEXAB	;afficher Post Byte de l'index U
	
	LBRA	RSTREXIT	;aller vers restauration registres et exit

TSTINDU	LDA	<BUFFERST+7;extraction index utilisé dans l'instruction
	CMPA	#'U
	BNE	TSTINDS
	
	LDA	#$C0
	ADDA	<TEMPCHAR	
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
	STA	<TEMPCHAR
	LBSR	OUTHEXAB	;afficher Post Byte de l'index X
	
	LBRA	RSTREXIT	;aller vers restauration registres et exit

TSTINDS	LDA	<BUFFERST+7;extraction index utilisé dans l'instruction
	CMPA	#'S
	LBNE	ERRINDEX
	
	LDA	#$E0
	ADDA	<TEMPCHAR
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
	STA	<TEMPCHAR	
	LBSR	OUTHEXAB	;afficher Post Byte de l'index X	
	
	LBRA	RSTREXIT	;aller vers restauration registres et exit

;-----------------------------------------------------------------------------------
;traitement de l'assemblage du mode d'adressage Indexé déplacement constant
;-----------------------------------------------------------------------------------
;test indexé à déplacement constant
TSTDEPCT	LBRA	RSTREXIT	;aller vers restauration registres et exit

;-----------------------------------------------------------------------------------
;traitement de l'assemblage du mode d'adressage Indexé auto-ncrémenté/decrémenté, relatif PC
;-----------------------------------------------------------------------------------
;traiter les modes indexé auto-ncrémenté/decrémenté, relatif PC
INCDECPC	LBRA	RSTREXIT	;aller vers restauration registres et exit

;-----------------------------------------------------------------------------------
;traitement de l'assemblage du mode d'adressage Etendu
;-----------------------------------------------------------------------------------	
EXTENDED	;vérification si ce mode est disponible pour cette instruction
	LDA	,X+
	ASLA		;isolation indicateur mode adressage Immédiat
	ASLA		;isolation indicateur mode adressage Direct
	ASLA		;isolation indicateur mode adressage Indéxé
	ASLA		;isolation indicateur mode adressage Etendu, et incrémentation X
	LBCC	ERRMODIM	;si indicateur mode adressage Immédiat non actif	
	
	LEAX	3,X	;puis 2 autres incrémentation de X pour tomber sur l'op.code Etendu
	
	LEAX	B,X	;déduire le nombre de modes indisponible de X pour commencer
			;à partir du 1er mode disponible	
	LDA	,X	;si oui, copier le code dans zone mémoire Op Code		
	STA	,Y	;indéxée par Y
	
	;début test affichage adresse copie Op Code
	STY	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW
	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LEAY	1,Y	 ;incrémenter Y
	;fin test affichage adresse copie Op Code
	
	STA	<TEMPCHAR	
	LBSR	OUTHEXAB	;afficher code opération assemblé
	
	LDA	<BUFFERST+6;A <- nibble suppérieur du MSB de l'adresse étendue
	STA	<TEMPCHAR	
	LBSR	OUT1CHAR	;afficher nibble supérieur du MSB de l'adresse étendue
	
	LDA	<BUFFERST+7;A <- nibble inférieur du MSB de l'adresse étendue
	STA	<TEMPCHAR	
	LBSR	OUT1CHAR	;afficher nibble inférieur du MSB de l'adresse étendue
	
	LDA	<BUFFERST+8;A <- nibble suppérieur du LSB de l'adresse étendue
	STA	<TEMPCHAR	
	LBSR	OUT1CHAR	;afficher nibble supérieur du LSB de l'adresse étendue
	
	LDA	<BUFFERST+9;A <- nibble inférieur du LSB de l'adresse étendue
	STA	<TEMPCHAR	
	LBSR	OUT1CHAR	;afficher nibble inférieur du LSB de l'adresse étendue
	
	LDA	<BUFFERST+6;A <- nibble suppérieur de la valeur étendue
	LDB	<BUFFERST+7;B <- nibble inférieur de la valeur étendue
	LBSR	BULDBYTE	;construction de l'octet à partir des deux nibbles	
	LDA	<TEMPCHAR	;récupération du l'octet construit
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
	
	LDA	<BUFFERST+8;A <- nibble suppérieur de la valeur étendue
	LDB	<BUFFERST+9;B <- nibble inférieur de la valeur étendue
	LBSR	BULDBYTE	;construction de l'octet à partir des deux nibbles	
	LDA	<TEMPCHAR	;récupération du l'octet construit
	STA	,Y+	;copier octet vers mémoire indéxée par Y et incrémenter Y
	
	BRA	RSTREXIT	;aller vers restauration registres et exit

;-----------------------------------------------------------------------------------
;traitement de l'assemblage du mode d'adressage Inhérent
;-----------------------------------------------------------------------------------	
INHERENT	;vérification si ce mode est disponible pour cette instruction
	LDA	,X+
	ASLA		;isolation indicateur mode adressage Immédiat
	BCS	ERRMODIM	;si indicateur mode adressage Immédiat actif, Erreur mode indisp.	
	ASLA		;isolation indicateur mode adressage Direct
	BCS	ERRMODIM	;si indicateur mode adressage Immédiat actif, Erreur mode indisp.	
	ASLA		;isolation indicateur mode adressage Indéxé
	BCS	ERRMODIM	;si indicateur mode adressage Immédiat actif, Erreur mode indisp.	
	ASLA		;isolation indicateur mode adressage Etendu, et incrémentation X
	BCS	ERRMODIM	;si indicateur mode adressage Immédiat actif, Erreur mode indisp.	
	
	LDA	,X	;si oui, copier le code dans zone mémoire Op Code		
	STA	,Y	;indéxée par Y
	
	;début test affichage adresse copie Op Code
	STY	<TEMP2CHR	;mettre adresse début dans variable
	
	LBSR	OUTHEXAW
	
	LBSR	OUTDASH	;retour nouvelle ligne
	LBSR	OUTPRMPT
	
	LEAY	1,Y	 ;incrémenter Y
	;fin test affichage adresse copie Op Code
	
	STA	<TEMPCHAR	
	LBSR	OUTHEXAB	;afficher code opération assemblé
	;LBSR	OUTCRLF	;et retourner à la ligne
	
	BRA	RSTREXIT	;aller vers restauration registres et exit

;traitement erreur index dans le mode d'adressage indexé
ERRINDEX	LBSR	OUTCRLF	;retourner à la ligne suivante et
	LDX	#ERINXMES	;si aucun index (X,Y,U ou S) existant dans l'instruction
	LBSR	OUTSTRNG	;afficher message d'erreur "Index incorrect!"
	
	BRA	RSTREXIT	;aller vers restauration registres et exit

;traitement erreur de mode d'adressage	
ERRMODIM	LDX	#ERRMDADD	;sinon afficher message "Mode adressage non dispo."
	LBSR	OUTSTRNG	;afficher message d'erreur "Mode adressage non dispo."
	
RSTREXIT	PULS	A,B,X	;restaurer les registres utilisés

	RTS		;Fin de sous routine et retour au programme moniteur
;____________________________________________________________________________________


;début exemple codage conversion instruction
	;FCC	"STA "	;instruction
	;FCC	%01110100	;pattern adressage disp. nibble MSB: 1->disp. 0->indisp.
			;bits: 7->Immediat, 6->Direct, 5->Indéxé, 4->Etendu
			;mode Inhérent disponible si aucun autre mode n'est disp.
			;nibble LSB: 3 bits MSB->nombre d'octets code operation
			;dans cet exemple: modes d'adressage disponibles:
			;Direct, Indéxé et Etendu. nombre d'octets Direct: 2
			
	;FCC	%10011000	;ce bit est supplémentaire et ajouté en cas de besoin:
			;si le nombre de modes d'adressage disponibles est > 1:
			;bit 0 octet précédent + bits 7 et 6->nombre octets code
			;operation adressage 1, bits 5 à 0-> par paquet de 3 bits
			;->nombre octets code opération par même ordre que celui
			;des bits de pattern des modes d'adressage
			;dans cet exemple nombre d'octets Indéxé: 2, nombre d'octets
			;Etendu: 3, les bits restant n'ont aucune signification
			;puisqu'il n'y a que 3 modes d'adressage pour cette "STA"
			
	;FCC	$97	;code operation par même ordre que celui des bits de
	;FCC	$A7	;dans cet exemple: code opération mode Direct -> $97, code
	;FCC	$B7	;pattern des modes d'adressage Immediat, Direct, Indéxé,
			;Etendu puis Inhérent
			;mode Indéxé -> $A7, code mode Etendu -> $B7
;fin exemple codage conversion instruction

INSTTABL	FCC	"ABX "	;tables des instructions autres que les branchements (+ JMP et JSR)	
	FCC	%00000010				
	FCC	$3A		 

	FCC	"ADCA"
	FCC	%11110100
	;FCC	%10010011
	FCC	$89
	FCC	$99
	FCC	$A9
	FCC	$B9
	
	FCC	"ADCB"
	FCC	%11110100
	;FCC	%10010011
	FCC	$C9
	FCC	$D9
	FCC	$E9
	FCC	$F9
	
	FCC	"ADDA"
	FCC	%11110100
	;FCC	%10010011
	FCC	$8B
	FCC	$9B
	FCC	$AB
	FCC	$BB
	
	FCC	"ADDB"
	FCC	%11110100
	;FCC	%10010011
	FCC	$CB
	FCC	$DB
	FCC	$EB
	FCC	$FB
	
	FCC	"ADDD"
	FCC	%11110110
	;FCC	%10010011
	FCC	$C3
	FCC	$D3
	FCC	$E3
	FCC	$F3
	
	FCC	"ANDA"
	FCC	%11110100
	;FCC	%10010011
	FCC	$84
	FCC	$94
	FCC	$A4
	FCC	$B4
	
	FCC	"ANDB"
	FCC	%11110100
	;FCC	%10010011
	FCC	$C4
	FCC	$D4
	FCC	$E4
	FCC	$F4
	
	FCC	"ANDC"
	FCC	%10000100
	FCC	$1C
	
	FCC	"ASLA"
	FCC	%00000010
	FCC	$48
	
	FCC	"ASLB"
	FCC	%00000010
	FCC	$58
	
	FCC	"ASL "
	FCC	%01110100
	;FCC	%10011000
	FCC	$08
	FCC	$68
	FCC	$78
	
	FCC	"ASRA"
	FCC	%00000010
	FCC	$47
	
	FCC	"ASRB"
	FCC	%00000010
	FCC	$57
	
	FCC	"ASR "
	FCC	%01110100
	;FCC	%10011000
	FCC	$07
	FCC	$67
	FCC	$77
	
	FCC	"BITA"
	FCC	%11110100
	;FCC	%10010011
	FCC	$85
	FCC	$95
	FCC	$A5
	FCC	$B5
	
	FCC	"BITB"
	FCC	%11110100
	;FCC	%10010011
	FCC	$C5
	FCC	$D5
	FCC	$E5
	FCC	$F5
	
	FCC	"CLRA"
	FCC	%00000010				
	FCC	$4F
	
	FCC	"CLRB"
	FCC	%00000010				
	FCC	$5F
	
	FCC	"CLR "
	FCC	%01110100
	;FCC	%10011000
	FCC	$0F
	FCC	$6F
	FCC	$7F
	
	FCC	"CMPA"
	FCC	%11110100
	;FCC	%10010011
	FCC	$81
	FCC	$91
	FCC	$A1
	FCC	$B1
	
	FCC	"CMPB"
	FCC	%11110100
	;FCC	%10010011
	FCC	$C1
	FCC	$D1
	FCC	$E1
	FCC	$F1
	
	FCC	"CMPD"
	FCC	%11111000
	;FCC	%11011100
	FCC	$1083
	FCC	$1093
	FCC	$10A3
	FCC	$10B3
	
	FCC	"CMPS"
	FCC	%11111000
	;FCC	%11011100
	FCC	$118C
	FCC	$119C
	FCC	$11AC
	FCC	$11BC
	
	FCC	"CMPU"
	FCC	%11111000
	;FCC	%11011100
	FCC	$1183
	FCC	$1193
	FCC	$11A3
	FCC	$11B3
	
	FCC	"CMPX"
	FCC	%11110110
	;FCC	%10010011
	FCC	$8C
	FCC	$9C
	FCC	$AC
	FCC	$BC
	
	FCC	"CMPY"
	FCC	%11111000
	;FCC	%11011100
	FCC	$108C
	FCC	$109C
	FCC	$10AC
	FCC	$10BC
	
	FCC	"COMA"
	FCC	%00000010				
	FCC	$43
	
	FCC	"COMB"
	FCC	%00000010				
	FCC	$53
	
	FCC	"COM "
	FCC	%01110100
	;FCC	%10011000
	FCC	$03
	FCC	$63
	FCC	$73
	
	FCC	"CWAI"
	FCC	%10000100				
	FCC	$3C
	
	FCC	"DAA "
	FCC	%00000010				
	FCC	$19
	
	FCC	"DECA"
	FCC	%00000010				
	FCC	$4A
	
	FCC	"DECB"
	FCC	%00000010				
	FCC	$5A
	
	FCC	"DEC "
	FCC	%01110100
	;FCC	%10011000
	FCC	$0A
	FCC	$6A
	FCC	$7A
	
	FCC	"EORA"
	FCC	%11110100
	;FCC	%10010011
	FCC	$88
	FCC	$98
	FCC	$A8
	FCC	$B8
	
	FCC	"EORB"
	FCC	%11110100
	;FCC	%10010011
	FCC	$C1
	FCC	$D1
	FCC	$E1
	FCC	$F1
	
	FCC	"EXG "
	FCC	%10000100
	FCC	$1E

	FCC	"INCA"
	FCC	%00000010				
	FCC	$4C
	
	FCC	"INCB"
	FCC	%00000010				
	FCC	$5C
	
	FCC	"INC "
	FCC	%01110100
	;FCC	%10011000
	FCC	$0C
	FCC	$6C
	FCC	$7C
	
	FCC	"JMP "
	FCC	%01110100
	;FCC	%10011000
	FCC	$0E
	FCC	$6E
	FCC	$7E
	
	FCC	"JSR "
	FCC	%01110100
	;FCC	%10011000
	FCC	$9D
	FCC	$AD
	FCC	$BD
	
	FCC	"LDA "
	FCC	%11110100
	;FCC	%10010011
	FCC	$86
	FCC	$96
	FCC	$A6
	FCC	$B6
	
	FCC	"LDB "
	FCC	%11110100
	;FCC	%10010011
	FCC	$C6
	FCC	$D6
	FCC	$E6
	FCC	$F6
	
	FCC	"LDD "
	FCC	%11110110
	;FCC	%10010011
	FCC	$CC
	FCC	$DC
	FCC	$EC
	FCC	$FC
	
	FCC	"LDS "
	FCC	%11111000
	;FCC	%11011100
	FCC	$10CE
	FCC	$10DE
	FCC	$10EE
	FCC	$10FE
	
	FCC	"LDU "
	FCC	%11110110
	;FCC	%10010011
	FCC	$CE
	FCC	$DE
	FCC	$EE
	FCC	$FE
	
	FCC	"LDX "
	FCC	%11110110
	;FCC	%10010011
	FCC	$8E
	FCC	$9E
	FCC	$AE
	FCC	$BE
	
	FCC	"LDY "
	FCC	%11111000
	;FCC	%11011100
	FCC	$108E
	FCC	$109E
	FCC	$10AE
	FCC	$10BE
	
	FCC	"LEAS"
	FCC	%00100100
	FCC	$32
	
	FCC	"LEAU"
	FCC	%00100100
	FCC	$33
	
	FCC	"LEAX"
	FCC	%00100100
	FCC	$30
	
	FCC	"LEAY"
	FCC	%00100100
	FCC	$31
	
	FCC	"LSLA"
	FCC	%00000010				
	FCC	$48
	
	FCC	"LSLB"
	FCC	%00000010				
	FCC	$58
	
	FCC	"LSL "
	FCC	%01110100
	;FCC	%10011000
	FCC	$08
	FCC	$68
	FCC	$78
	
	FCC	"LSRA"
	FCC	%00000010				
	FCC	$44
	
	FCC	"LSRB"
	FCC	%00000010				
	FCC	$54
	
	FCC	"LSR "
	FCC	%01110100
	;FCC	%10011000
	FCC	$04
	FCC	$64
	FCC	$74
	
	FCC	"MUL "
	FCC	%00000010				
	FCC	$3D
	
	FCC	"NEGA"
	FCC	%00000010				
	FCC	$40
	
	FCC	"NEGB"
	FCC	%00000010				
	FCC	$50
	
	FCC	"NEG "
	FCC	%01110100
	;FCC	%10011000
	FCC	$00
	FCC	$60
	FCC	$70
	
	FCC	"NOP "
	FCC	%00000010				
	FCC	$12
	
	FCC	"ORA "
	FCC	%11110100
	;FCC	%10010011
	FCC	$8A
	FCC	$9A
	FCC	$AA
	FCC	$BA
	
	FCC	"ORB "
	FCC	%11110100
	;FCC	%10010011
	FCC	$CA
	FCC	$DA
	FCC	$EA
	FCC	$FA
	
	FCC	"ORCC"
	FCC	%10000100
	FCC	$1A
	
	FCC	"PSHS"
	FCC	%10000100
	FCC	$34
	
	FCC	"PSHU"
	FCC	%10000100
	FCC	$36
	
	FCC	"PULS"
	FCC	%10000100
	FCC	$35
	
	FCC	"PULU"
	FCC	%10000100
	FCC	$37
	
	FCC	"ROLA"
	FCC	%00000010				
	FCC	$49
	
	FCC	"ROLB"
	FCC	%00000010				
	FCC	$59
	
	FCC	"ROL "
	FCC	%01110100
	;FCC	%10011000
	FCC	$09
	FCC	$69
	FCC	$79
	
	FCC	"RORA"
	FCC	%00000010				
	FCC	$46
	
	FCC	"RORB"
	FCC	%00000010				
	FCC	$56
	
	FCC	"ROR "
	FCC	%01110100
	;FCC	%10011000
	FCC	$06
	FCC	$66
	FCC	$76
	
	FCC	"RTI "
	FCC	%00000010				
	FCC	$3B
	
	FCC	"RTS "
	FCC	%00000010				
	FCC	$39
	
	FCC	"SBCA"
	FCC	%11110100
	;FCC	%10010011
	FCC	$82
	FCC	$92
	FCC	$A2
	FCC	$B2
	
	FCC	"SBCB"
	FCC	%11110100
	;FCC	%10010011
	FCC	$C2
	FCC	$B2
	FCC	$E2
	FCC	$F2
	
	FCC	"SEX "
	FCC	%00000010				
	FCC	$1D
	
	FCC	"STA "
	FCC	%01110100
	;FCC	%10011000
	FCC	$97
	FCC	$A7
	FCC	$B7
	
	FCC	"STB "
	FCC	%01110100
	;FCC	%10011000
	FCC	$D7
	FCC	$E7
	FCC	$F7
	
	FCC	"STD "
	FCC	%01110100
	;FCC	%10011000
	FCC	$DD
	FCC	$ED
	FCC	$FD
	
	FCC	"STS "
	FCC	%01110110
	;FCC	%11100000
	FCC	$10DF
	FCC	$10EF
	FCC	$10FF
	
	FCC	"STU "
	FCC	%01110100
	;FCC	%10011000
	FCC	$DF
	FCC	$EF
	FCC	$FF
	
	FCC	"STX "
	FCC	%01110100
	;FCC	%10011000
	FCC	$9F
	FCC	$AF
	FCC	$BF
	
	FCC	"STY "
	FCC	%01110110
	;FCC	%11100000
	FCC	$109F
	FCC	$10AF
	FCC	$10BF
	
	FCC	"SUBA"
	FCC	%11110100
	;FCC	%10010011
	FCC	$80
	FCC	$90
	FCC	$A0
	FCC	$B0
	
	FCC	"SUBB"
	FCC	%11110100
	;FCC	%10010011
	FCC	$C0
	FCC	$D0
	FCC	$E0
	FCC	$F0
	
	FCC	"SUBD"
	FCC	%11110110
	;FCC	%10010011
	FCC	$83
	FCC	$93
	FCC	$A3
	FCC	$B3
	
	FCC	"SWI "
	FCC	%00000010
	FCC	$3F
	
	FCC	"SWI2"
	FCC	%00000010
	FCC	$103F
	
	FCC	"SWI3"
	FCC	%00000100				
	FCC	$113F
	
	FCC	"SYNC"
	FCC	%00000010				
	FCC	$13
	
	FCC	"TFR "
	FCC	%10000100
	FCC	$1F
	
	FCC	"TSTA"
	FCC	%00000010				
	FCC	$4D
	
	FCC	"TSTB"
	FCC	%00000010				
	FCC	$5D
	
	FCC	"TST "
	FCC	%01110100
	;FCC	%10011000
	FCC	$0D
	FCC	$6D
	FCC	$7D
	
	FCB	$00	;fin table INSTTABL

;table des instructions de branchement "régulieres"	
RGBRTABL	FCC	"BRN"	
	FCC	$21
	FCC	"BCC"
	FCC	$24
	FCC	"BHS"
	FCC	$24
	FCC	"BCS"
	FCC	$25
	FCC	"BLO"
	FCC	$25
	FCC	"BPL"
	FCC	$2A
	FCC	"BMI"
	FCC	$2B
	FCC	"BVC"
	FCC	$28
	FCC	"BVS"
	FCC	$29
	FCC	"BNE"
	FCC	$26
	FCC	"BEQ"
	FCC	$27
	FCC	"BLT"
	FCC	$2D
	FCC	"BGT"
	FCC	$2E
	FCC	"BHI"
	FCC	$22
	FCC	"BGE"
	FCC	$2C
	FCC	"BLE"
	FCC	$2F
	FCC	"BLS"
	FCC	$23
	FCC	$00
	
	
;************************************************************************************	
;routines et programmes utilitaires et applications	
;************************************************************************************
	
;************************************************************************************
;Routine READADC, Read Analog to Digital converter
;Entrée: Aucune
;Sorties: Aucune
;Routines appelée:
;************************************************************************************
U_FIRQ	EQU	$00F4
D_AD0	EQU	$1C00
D_AD1	EQU	$1C01	
D_AD2	EQU	$1C02	
	
T2	EQU	$00E0
DIS_BYT	EQU	$F3E3
DIS_BAC	EQU	$F36F

MESSADC0	FCC	"Lumiere: ", $00
MESSADC1	FCC	"Temper.: ", $00
MESSADC2	FCC	"Tension: ", $00

MESSDEGC	FCC	" Degr. C", $00
MESSKLUX	FCC	" Kil Lux", $00
MESSVOLT	FCC	" Dc Volt", $00

READADC	PSHS	A,X

LOOPCONV	;lecture entrée 0 du multiplexeur vers convertisseur A/D
	STA	D_AD0	;début conversion
		
	LDX	#MESSADC0	;message entrée adresse début
	LBSR	OUTSTRNG	;afficher message d'entrée d'adresse
	
	LBSR	WAIT10MS
	
	LDA	D_AD0	;lit état provenant du convertisseur
	
	LBSR	CNVHXBCD
	
	LDA	<TEMPCHAR
	ADDA	#$30
	STA	<TEMPCHAR
	
	LBSR	OUT1CHAR
	
	LDA	<TEMP2CHR
	ADDA	#$30
	STA	<TEMP2CHR
	
	LDA	<TEMP2CHR+1
	ADDA	#$30
	STA	<TEMP2CHR+1
	
	LBSR	OUT2CHAR
	
	LDX	#MESSKLUX	;message Klux
	LBSR	OUTSTRNG	;afficher message KLux
	
	LBSR	OUTCRLF
	
;lecture entrée 1 du multiplexeur vers convertisseur A/D
	;STA	D_AD1	;début conversion
		
	;LDX	#MESSADC1	;message entrée adresse début
	;LBSR	OUTSTRNG	;afficher message d'entrée d'adresse
	
	;LBSR	WAIT10MS
	
	;LDA	D_AD1	;lit état provenant du convertisseur
	
	;SUBA	#$AF
	
	;LBSR	CNVHXBCD
	
	;LDA	<TEMPCHAR
	;ADDA	#$30
	;STA	<TEMPCHAR
	
	;LBSR	OUT1CHAR
	
	;LDA	<TEMP2CHR
	;ADDA	#$30
	;STA	<TEMP2CHR
	
	;LDA	<TEMP2CHR+1
	;ADDA	#$30
	;STA	<TEMP2CHR+1
	
	;LBSR	OUT2CHAR
	
	;LDX	#MESSDEGC	;message °C
	;LBSR	OUTSTRNG	;afficher message °C
	
	;LBSR	OUTCRLF
	
;lecture entrée 2 du multiplexeur vers convertisseur A/D
	;STA	D_AD2	;début conversion
		
	;LDX	#MESSADC2	;message entrée adresse début
	;LBSR	OUTSTRNG	;afficher message d'entrée d'adresse
	
	;LBSR	WAIT10MS
	
	;LDA	D_AD2	;lit état provenant du convertisseur
	
	;LBSR	CNVHXBCD
	
	;LDA	<TEMPCHAR
	;ADDA	#$30
	;STA	<TEMPCHAR
	
	;LBSR	OUT1CHAR
	
	;LDA	<TEMP2CHR
	;ADDA	#$30
	;STA	<TEMP2CHR
	
	;LDA	<TEMP2CHR+1
	;ADDA	#$30
	;STA	<TEMP2CHR+1
	
	;LBSR	OUT2CHAR
	
	;LDX	#MESSVOLT	;message Volt
	;LBSR	OUTSTRNG	;afficher message Volt
	
	;LBSR	OUTCRLF
		
	PULS	A,X
	
	RTS	