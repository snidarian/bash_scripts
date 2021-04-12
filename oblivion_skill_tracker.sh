#!/usr/bin/bash
# There are 21 skills in oblivion
# There are 7 attributes that each has three of these skills
# leveling 10 in any skill will give +5 at the next level increase
# You select major skill for your character (the rest are minor skills)
# leveling any number-comination of major skills (selected) will level you up


# Available signs
# the apprentice, the lady, the mage, the thief, the atronach
# the lord, the lover, the ritual, the serpent, the shadow
# the steed, the tower, the warrior




# Ansi bold color escape sequence variables
red="\e[1;31m"
green="\e[0;32m"
yellow="\e[0;33m"
cyan="\e[0;36m"
purple="\e[0;35m"
white="\e[0;37m"
reset="\e[0m"


# variable designations for general purpose use in script
dashband="-------------------------------------------------------------"




# function create oblivion profile
create_profile()
{
    # sets character name, sex, race, birthsign, and two favored attributes (+5)
    immutables
}


# called by create_profile() sets and writes basic character immutable characteristics to .oblivionprofile file
immutables()
{
    # character name
    echo "Enter your character's name (no space - use underscore or dash)"
    read character_name
    echo "character_name=\"$character_name\"" > "$character_name.oblivionprofile"

    # character sex
    echo "Enter character sex (lowercase)(m/f)"
    read sex
    echo "sex=\"$sex\"" >> "$character_name.oblivionprofile"

    # character race
    echo -ne "Enter character race (lowercase)\n(Options: altmer (high elf), argonian, bosmer (wood elf), breton, dunmer (dark elf), imperial, khajiit, nord, orsimer (orc), redguard:\nRace: "
    read race
    echo "race=\"$race\"" >> "$character_name.oblivionprofile"
    
    # character birthsign
    echo -ne "Enter character birthsign (lowercase)\n(Options: apprentice, atronach, lady, lord, lover, mage, ritual, serpent, shadow, steed, thief, tower, warrior)\n Birthsign: "
    read birthsign
    echo "birthsign=\"$birthsign\"" >> "$character_name.oblivionprofile"

    # Enter characters two favored attributes (The two attributes you can add +5 to at beginning of game)
    echo -ne "Enter first favored attribute: Options: strength, intelligence, willpower, agility, speed, endurance, personality, luck\nFirst attribute: "
    read fav_attr_1
    echo "fav_attr_1=\"$fav_attr_1\"" >> "$character_name.oblivionprofile"
    echo -ne "Second attribute: "
    read fav_attr_2
    echo "fav_attr_2=\"$fav_attr_2\"" >> "$character_name.oblivionprofile"
    echo "" #newline
    # add these to attribute totals calculated after race and sex calculations
    set_attributes $sex $race $birthsign $fav_attr_1 $fav_attr_2
}




# function that will take race, sex, and favored attributes and calculate .oblivionprofile attributes
set_attributes()
{
    sex=$1
    race=$2
    birthsign=$3
    fav_attr_1=$4
    fav_attr_2=$5
    echo "$sex $race $birthsign $fav_attr_1 $fav_attr_2" #test statements

    # declare all attributes variables
    let strength=0; let intelligence=0; let willpower=0; let agility=0; let speed=0; let endurance=0; let personality=0; let luck=50
    # Set attributes based on sex and race
    case $race in
	"altmer"|"Altmer") # high elf
	    if [[ $sex == "m" ]]; then
		strength=$((strength+=30));intelligence=$((intelligence+=50));willpower=$((willpower+=40));agility=$((agility+=40));speed=$((speed+=30));endurance=$((endurance+=40));personality=$((personality+=40))
	    elif [[ $sex == "f" ]]; then
		strength=$((strength+=30));intelligence=$((intelligence+=50));willpower=$((willpower+=40));agility=$((agility+=40));speed=$((speed+=40));endurance=$((endurance+=30));personality=$((personality+=40))
	    else
		echo "Error: Invalid sex selection"
	    fi
	    ;;
	"argonian") # argonian
	    if [[ $sex == "m" ]]; then
		strength=$((strength+=40));intelligence=$((intelligence+=40));willpower=$((willpower+=30));agility=$((agility+=50));speed=$((speed+=50));endurance=$((endurance+=30));personality=$((personality+=30))
	    elif [[ $sex == "f" ]]; then
		strength=$((strength+=40));intelligence=$((intelligence+=50));willpower=$((willpower+=40));agility=$((agility+=40));speed=$((speed+=40));endurance=$((endurance+=30));personality=$((personality+=30))
	    else
		echo "Error: Invalid sex selection"
	    fi
	    ;;
	"bosmer"|"Bosmer") # wood elf
	    if [[ $sex == "m" ]]; then
		strength=$((strength+=30));intelligence=$((intelligence+=40));willpower=$((willpower+=30));agility=$((agility+=50));speed=$((speed+=50));endurance=$((endurance+=40));personality=$((personality+=30))
	    elif [[ $sex == "f" ]]; then
		strength=$((strength+=30));intelligence=$((intelligence+=40));willpower=$((willpower+=30));agility=$((agility+=50));speed=$((speed+=50));endurance=$((endurance+=30));personality=$((personality+=40))
	    else
		echo "Error: Invalid sex selection"
	    fi
	    ;;
	"breton") # breton
	    if [[ $sex == "m" ]]; then
		strength=$((strength+=40));intelligence=$((intelligence+=50));willpower=$((willpower+=50));agility=$((agility+=30));speed=$((speed+=30));endurance=$((endurance+=30));personality=$((personality+=40))
	    elif [[ $sex == "f" ]]; then
		strength=$((strength+=30));intelligence=$((intelligence+=50));willpower=$((willpower+=50));agility=$((agility+=30));speed=$((speed+=40));endurance=$((endurance+=30));personality=$((personality+=40))
	    else
		echo "Error: Invalid sex selection"
	    fi
	    ;;
	"dunmer"|"Dunmer") # dark elf
	    if [[ $sex == "m" ]]; then
		strength=$((strength+=40));intelligence=$((intelligence+=40));willpower=$((willpower+=30));agility=$((agility+=40));speed=$((speed+=50));endurance=$((endurance+=40));personality=$((personality+=30))
	    elif [[ $sex == "f" ]]; then
		strength=$((strength+=40));intelligence=$((intelligence+=40));willpower=$((willpower+=30));agility=$((agility+=40));speed=$((speed+=50));endurance=$((endurance+=30));personality=$((personality+=40))
	    else
		echo "Error: Invalid sex selection"
	    fi
	    ;;
	"imperial") # imperial
	    if [[ $sex == "m" ]]; then
		strength=$((strength+=40));intelligence=$((intelligence+=40));willpower=$((willpower+=30));agility=$((agility+=30));speed=$((speed+=40));endurance=$((endurance+=40));personality=$((personality+=50))
	    elif [[ $sex == "f" ]]; then
		strength=$((strength+=40));intelligence=$((intelligence+=40));willpower=$((willpower+=40));agility=$((agility+=30));speed=$((speed+=30));endurance=$((endurance+=40));personality=$((personality+=50))
	    else
		echo "Error: Invalid sex selection"
	    fi
	    ;;
	"khajiit")
	    if [[ $sex == "m" ]]; then
		strength=$((strength+=40));intelligence=$((intelligence+=40));willpower=$((willpower+=30));agility=$((agility+=50));speed=$((speed+=40));endurance=$((endurance+=30));personality=$((personality+=40))
	    elif [[ $sex == "f" ]]; then
		strength=$((strength+=30));intelligence=$((intelligence+=40));willpower=$((willpower+=30));agility=$((agility+=50));speed=$((speed+=40));endurance=$((endurance+=40));personality=$((personality+=40))
	    else
		echo "Error: Invalid sex selection"
	    fi
	    ;;
	"nord")
	    if [[ $sex == "m" ]]; then
		strength=$((strength+=50));intelligence=$((intelligence+=30));willpower=$((willpower+=30));agility=$((agility+=40));speed=$((speed+=40));endurance=$((endurance+=50));personality=$((personality+=30))
	    elif [[ $sex == "f" ]]; then
		strength=$((strength+=50));intelligence=$((intelligence+=30));willpower=$((willpower+=40));agility=$((agility+=40));speed=$((speed+=40));endurance=$((endurance+=40));personality=$((personality+=30))
	    else
		echo "Error: Invalid sex selection"
	    fi
	    ;;
	"orsimer"|"Orsimer") # orc
	    if [[ $sex == "m" ]]; then
		strength=$((strength+=45));intelligence=$((intelligence+=30));willpower=$((willpower+=50));agility=$((agility+=35));speed=$((speed+=30));endurance=$((endurance+=50));personality=$((personality+=30))
	    elif [[ $sex == "f" ]]; then
		strength=$((strength+=45));intelligence=$((intelligence+=40));willpower=$((willpower+=45));agility=$((agility+=35));speed=$((speed+=30));endurance=$((endurance+=50));personality=$((personality+=25))
	    else
		echo "Error: Invalid sex selection"
	    fi
	    ;;
	"redguard")
	    if [[ $sex == "m" ]]; then
		strength=$((strength+=50));intelligence=$((intelligence+=30));willpower=$((willpower+=30));agility=$((agility+=40));speed=$((speed+=40));endurance=$((endurance+=50));personality=$((personality+=30))
	    elif [[ $sex == "f" ]]; then
		strength=$((strength+=40));intelligence=$((intelligence+=30));willpower=$((willpower+=30));agility=$((agility+=40));speed=$((speed+=40));endurance=$((endurance+=50));personality=$((personality+=40))
	    else
		echo "Error: Invalid sex selection"
	    fi
	    ;;
	*)
	    echo "Error: Invalid race entered:"
	    exit -1
	    ;;
    esac
    
    # Add atributes from star sign to totals calculated by race/sex variables
    case $birthsign in
	"the lady"|"lady")
	    willpower=$((willpower+=10))
	    endurance=$((endurance+=10))
	    ;;
	"the steed"|"steed")
	    speed=$((speed+=20))
	    ;;
	"the thief"|"thief")
	    agility=$((agility+=10))
	    luck=$((luck+=10))
	    speed=$((speed+=10))
	    ;;
	"the warrior"|"warrior")
	    strength=$((strength+=10))
	    endurance=$((endurance+=10))
	    ;;
	# Entry for attribute-irrelevant birthsigns
	"apprentice"|"atronach"|"lord"|"lover"|"mage"|"ritual"|"serpent"|"shadow"|"tower")
	    ;;
	
	*)
	    echo "Error: invalid birthsign entered"
	    echo "birthsign entered: $birthsign"
	    ;;
    esac
    


    # add favored attributes to total

    #1st - favored attributes cannot equal each other
    if [[ $fav_attr_1 == $fav_attr_2 ]]; then
	echo "Error: favored attributes one and two cannot be the same"
	exit -1
    else
	
	# favored attribute 1 case statement
	case $fav_attr_1 in
	    "strength"|"Strength")
		strength=$((strength+=5))
		;;
	    "intelligence"|"Intelligence")
		intelligence=$((intelligence+=5))
		;;
	    "willpower"|"Willpower")
		willpower=$((willpower+=5))
		;;
	    "agility"|"Agility")
		agility=$((agility+=5))
		;;
	    "speed"|"Speed")
		speed=$((speed+=5))
		;;
	    "endurance"|"Endurance")
		endurance=$((endurance+=5))
		;;
	    "personality"|"Personality")
		personality=$((personality+=5))
		;;
	    "luck"|"Luck")
		luck=$((luck+=5))
		;;
	    *)
		echo "Error: invalid data entry: invalid favored attribute 1"
		exit -1
		;;
	esac

	
	# favored attribute 2 case statement
	case $fav_attr_2 in
	    "strength"|"Strength")
		strength=$((strength+=5))
		;;
	    "intelligence"|"Intelligence")
		intelligence=$((intelligence+=5))
		;;
	    "willpower"|"Willpower")
		willpower=$((willpower+=5))
		;;
	    "agility"|"Agility")
		agility=$((agility+=5))
		;;
	    "speed"|"Speed")
		speed=$((speed+=5))
		;;
	    "endurance"|"Endurance")
		endurance=$((endurance+=5))
		;;
	    "personality"|"Personality")
		personality=$((personality+=5))
		;;
	    "luck"|"Luck")
		luck=$((luck+=5))
		;;
	    *)
		echo "Error: invalid data entry: invalid favored attribute 1"
		exit -1
		;;
	esac
	
    fi
    


    echo "attributes set to:"
    echo -ne "strength=$strength\nintelligence=$intelligence\nwillpower=$willpower\nagility=$agility\nspeed=$speed\nendurance=$endurance\npersonality=$personality\nluck=$luck\n"

    set_skills $race
	
}


# function sets major skills - is called by set_attributes function (because race and sex plays a role in skill intitial variable declarations)
# set skills function will set skills based on sex, race, and major skill selections
set_skills()
{
    # variables set by function call from set_attributes() function
    $race=$1
    let acrobatics=5;let alchemy=5;let alteration=5; let armorer=5; let athletics=5; let blade=5;let block=5;let blunt=5;let conjuration=5;let desctruction=5;let hand2hand=5;
    let heavy_armor=5;let illusion=5;let lightarmor=5; let marksman=5;let mercantile=5;let mysticism=5;let restoration=5; let security=5; let sneak=5; let speechcraft=5



    #case statement here that intializes skills (blade, block etc..) based on character race

    
    
    # character's major skills - there are seven
    echo "list major skills one by one (lowercase)"
    # takes input for major skills
    for((i=0;i<7;i++))
       {
       echo -ne "major skill $(expr $i + 1): "
       read major_skills[i]
       }
    # stores major skill input in .oblivionprofile file
    for((i=0;i<7;i++))
       {
       echo -ne "major_skill_$(expr $i + 1)=" >> "$character_name.oblivionprofile"
       echo "\"${major_skills[i]}\"" >> "$character_name.oblivionprofile"
       }
}


# load .oblivionprofile file
load_profile()
{
    echo -ne ".oblivionprofile file to load: "
    read profilefile
    source "$profilefile"
    echo "your character is $character_name and is the $race race"
    echo "Major Skills: "
    echo -ne "$major_skill_1, "
    echo -ne "$major_skill_2, "
    echo -ne "$major_skill_3, "
    echo -ne "$major_skill_4, "
    echo -ne "$major_skill_5, "
    echo -ne "$major_skill_6, "
    echo -ne "$major_skill_7."
       
}

# free style leveling function
freestyle_leveling()
{
    echo "Select number of skill to advance skill for current level. type \"quit\" to break the loop"
    echo -ne "Enter current level: "
    read current_level
    # skill variables
    let acrobatics=0;let alchemy=0;let alteration=0; let armorer=0; let athletics=0; let blade=0;let block=0;let blunt=0;let conjuration=0;let destruction=0;let hand2hand=0;
    let heavy_armor=0;let illusion=0;let light_armor=0; let marksman=0;let mercantile=0;let mysticism=0;let restoration=0; let security=0; let sneak=0; let speechcraft=0;    
    echo -ne "Setting Major Skills - Enter 1 for each major skill and 0 or newline char if not\n"
    skill_name_array=("Acrobatics" "Alchemy" "Alteration" "Armorer" "Athletics" "Blade" "Block" "Blunt" "Conjuration" "Descruction" "Hand-to-Hand" "Heavy Armor" "Illusion" "Light Armor" "Marksman" "Mercantile" "Mysticism" "Restoration" "Security" "Sneak" "Speechcraft")

    # row one and row two stabilizers - intially set to empty strings until a skill for row one or two grows to double digit size

    
    # points towards various attributes
    let points_str=0; let points_intel=0;let points_will=0; let points_agil=0;let points_speed=0;let points_endur=0;let points_pers=0

    # increase attribute value variables
    let str=1; let intel=1;let will=1; let agil=1; let speed=1; let endur=1;let pers=1;

    while [ 1 ]; do
	clear
	echo $dashband 
	echo -ne "Current level: ${white}$current_level${reset}\n$dashband\n\n"; echo -e "                      ${white}Attribute increases at level $(expr $current_level + 1):${reset}"
	echo "----------------------------------------------------------------------------------"
	echo "| Strength | Intelligence | Willpower | Agility | Speed | Endurance | Personality |"
	echo -e "|     ${green}$str${reset}    |       ${green}$intel${reset}      |     ${green}$will${reset}     |    ${green}$agil${reset}    |   ${green}$speed${reset}   |     ${green}$endur${reset}     |      ${green}$pers${reset}      |"
	echo -ne "----------------------------------------------------------------------------------\n\n"
	echo -ne "                                           ${white}Skill advances for current level${reset}\n"
	echo "$dashband$dashband"
	echo -ne "Acrobatics | Alchemy | Alteration | Armorer | Athletics | Blade | Block | Blunt | Conjuration | Descruction | Hand-to-Hand|\n"
	echo -ne "     $acrobatics     |    $alchemy    |      $alteration     |    $armorer    |     $athletics     |   $blade   |   $block   |   $blunt   |      $conjuration      |       $destruction     |       $hand2hand     |\n"
	echo "$dashband$dashband"
	echo -ne "Heavy Armor | Illusion | Light Armor | Marksman | Mercantile | Mysticism | Restoration | Security | Sneak | Speechcraft |\n"
	echo -ne "     $heavy_armor      |    $illusion     |      $light_armor      |     $marksman    |     $mercantile      |     $mysticism     |      $restoration      |    $security     |   $sneak   |      $speechcraft      |\n"

	echo "$dashband$dashband"
	echo -e "${white}Enter skill to advance${reset}"
	echo -ne "1) Acrobatics    ${purple}[Speed]${reset}\n2) alchemy       ${purple}[Intelligence]${reset}\n3) Alteration    ${purple}[Willpower]${reset}\n4) Armorer       ${purple}[Endurance]${reset}\n5) Athletics     ${purple}[Speed]${reset}\n6) Blade         ${purple}[Strength]${reset}\n7) Block         ${purple}[Endurance]${reset}\n8) Blunt         ${purple}[Strength]${reset}\n9) Conjuration   ${purple}[Intelligence]${reset}\n10) Destruction  ${purple}[Willpower]${reset}\n11) Hand-to-Hand ${purple}[Strength]${reset}\n"
	echo -ne "12) Heavy Armor  ${purple}[Endurance]${reset}\n13) Illusion     ${purple}[Personality]${reset}\n14) Light Armor  ${purple}[Speed]${reset}\n15) Marksman     ${purple}[Agility]${reset}\n16) Mercantile   ${purple}[Personality]${reset}\n17) Mysticism    ${purple}[Intelligence]${reset}\n18) Restoration  ${purple}[Willpower]${reset}\n19) Security     ${purple}[Agility]${reset}\n20) Sneak        ${purple}[Agility]${reset}\n21) Speechcraft  ${purple}[Personality]${reset}\n\nAdditional options: load, save, reset, quit.\n${cyan}-->${reset} "
	read skill_advance
	# case statement here that increments projected attribute increases based on level increases
	case $skill_advance in
	    1|"acro")
		acrobatics=$((acrobatics+=1))
		points_speed=$((points_speed+=1))
		echo -e "${red}Acrobatics level-up${reset}"
		sleep .5
		;;
	    2|"alch"|"alchemy")
		alchemy=$((alchemy+=1))
		points_intel=$((points_intel+=1))
		echo -e "${red}Alchemy level-up${reset}"
		sleep .5
		;;
	    3|"alt")
		alteration=$((alteration+=1))
		points_will=$((points_will+=1))
		echo -e "${red}Alteration level-up${reset}"
		sleep .5
		;;
	    4|"armor"|"arm")
		armorer=$((armorer+=1))
		points_endur=$((points_endur+=1))
		echo -e "${red}Armorer level-up${reset}"
		sleep .5
		;;
	    5|"ath"|"athletics")
		athletics=$((athletics+=1))
		points_speed=$((points_speed+=1))
		echo -e "${red}Athletics level-up${reset}"
		sleep .5
		;;
	    6|"blade")
		blade=$((blade+=1))
		points_str=$((points_str+=1))
		echo -e "${red}Blade level-up${reset}"
		sleep .5
		;;
	    7|"block")
		block=$((block+=1))
		points_endur=$((points_endur+=1))
		echo -e "${red}Block level-up${reset}"
		sleep .5
		;;
	    8|"blunt")
		blunt=$((blunt+=1))
		points_str=$((points_str+=1))
		echo -e "${red}Blunt level-up${reset}"
		sleep .5
		;;
	    9|"conj"|"conjuration")
		conjuration=$((conjuration+=1))
		points_intel=$((points_intel+=1))
		echo -e "${red}Conjuration level-up${reset}"
		sleep .5
		;;
	    10|"destruction"|"dest")
		desctruction=$((destruction+=1))
		points_will=$((points_will+=1))
		echo -e "${red}Destruction level-up${reset}"
		sleep .5
		;;
	    11|"h2h")
		hand2hand=$((hand2hand+=1))
		points_str=$((points_str+=1))
		echo -e "${red}Hand-to-hand level-up${reset}"
		sleep .5
		;;
	    12|"ha")
		heavy_armor=$((heavy_armor+=1))
		points_endur=$((points_endur+=1))
		echo -e "${red}Heavy Armor level-up${reset}"
		sleep .5
		;;
	    13|"illusion")
		illusion=$((illusion+=1))
		points_pers=$((points_pers+=1))
		echo -e "${red}Illusion level-up${reset}"
		sleep .5
		;;
	    14|"la")
		light_armor=$((light_armor+=1))
		points_speed=$((points_speed+=1))
		echo -e "${red}Light Armor level-up${reset}"
		sleep .5
		;;
	    15|"mark"|"archery")
		marksman=$((marksman+=1))
		points_agil=$((points_agil+=1))
		echo -e "${red}Marksman level-up${reset}"
		sleep .5
		;;
	    16|"merc"|"merch")
		mercantile=$((mercantile+=1))
		points_pers=$((points_pers+=1))
		echo -e "${red}Mercantile level-up${reset}"
		sleep .5
		;;
	    17|"mist"|"myst")
		mysticism=$((mysticism+=1))
		points_intel=$((points_intel+=1))
		echo -e "${red}Mysticism level-up${reset}"
		sleep .5
		;;
	    18|"rest")
		resoration=$((restoration+=1))
		points_will=$((points_will+=1))
		echo -e "${red}Restoration level-up${reset}"
		sleep .5
		;;
	    19|"sec")
		security=$((security+=1))
		points_agil=$((points_agil+=1))
		echo -e "${red}Security level-up${reset}"
		sleep .5
		;;
	    20|"sneak")
		sneak=$((sneak+=1))
		points_agil=$((points_agil+=1))
		echo -e "${red}Sneak level-up${reset}"
		sleep .5
		;;
	    21|"speech")
		speechcraft=$((speechcraft+=1))
		points_pers=$((points_pers+=1))
		echo -e "${red}Speechcraft level-up${reset}"
		sleep .5
		;;
	    "lvl"|"level"|420)
		current_level=$((current_level+=1))
		# level up -used when you level up in order restart the process
		    let acrobatics=0;let alchemy=0;let alteration=0; let armorer=0; let athletics=0; let blade=0;let block=0;let blunt=0;let conjuration=0;let destruction=0;let hand2hand=0;
		    let heavy_armor=0;let illusion=0;let light_armor=0; let marksman=0;let mercantile=0;let mysticism=0;let restoration=0; let security=0; let sneak=0; let speechcraft=0;
		    # points towards attributes reset
		    let points_str=0; let points_intel=0;let points_will=0; let points_agil=0;let points_speed=0;let points_endur=0;let points_pers=0;
		    # attribute level increase indicators reset
		    let str=1; let intel=1;let will=1; let agil=1; let speed=1; let endur=1;let pers=1;
		    ;;
	    999|"save")
		echo -ne "${green}Enter character name:${reset} "
		read character_name
		echo -ne "${green}Enter current level:${reset} "
		read current_level
		# Now it echoes all the values plus all points towards attribute levels from current profile into .oblivionprofile file
		echo -e "character_name=\"$character_name\"" > "$character_name.oblivionprofile"
		echo "current_level=$current_level" >> "$character_name.oblivionprofile"
		# points towards attributes values

		# Level values to save to .oblivionprofile file
		echo "acrobatics=$acrobatics" >> "$character_name.oblivionprofile"
		echo "alchemy=$alchemy" >> "$character_name.oblivionprofile"
		echo "alteration=$alteration" >> "$character_name.oblivionprofile"
		echo "armorer=$armorer" >> "$character_name.oblivionprofile"
		echo "athletics=$athletics" >> "$character_name.oblivionprofile"
		echo "blade=$blade" >> "$character_name.oblivionprofile"
		echo "block=$block" >> "$character_name.oblivionprofile"
		echo "blunt=$blunt" >> "$character_name.oblivionprofile"
		echo "conjuration=$conjuration" >> "$character_name.oblivionprofile"
		echo "destruction=$destruction" >> "$character_name.oblivionprofile"
		echo "hand2hand=$hand2hand" >> "$character_name.oblivionprofile"
		echo "heavy_armor=$heavy_armor" >> "$character_name.oblivionprofile"
		echo "illusion=$illusion" >> "$character_name.oblivionprofile"
		echo "light_armor=$light_armor" >> "$character_name.oblivionprofile"
		echo "marksman=$marksman" >> "$character_name.oblivionprofile"
		echo "mercantile=$mercantile" >> "$character_name.oblivionprofile"
		echo "mysticism=$mysticism" >> "$character_name.oblivionprofile"
		echo "restoration=$restoration" >> "$character_name.oblivionprofile"
		echo "security=$security" >> "$character_name.oblivionprofile"
		echo "sneak=$sneak" >> "$character_name.oblivionprofile"
		echo "speechcraft=$speechcraft" >> "$character_name.oblivionprofile"
		
		# points towards attribute values to save into the .oblivionprofile file
		echo "points_str=$points_str" >> "$character_name.oblivionprofile"
		echo "points_intel=$points_intel" >> "$character_name.oblivionprofile"
		echo "points_will=$points_will" >> "$character_name.oblivionprofile"
		echo "points_agil=$points_agil" >> "$character_name.oblivionprofile"
		echo "points_speed=$points_speed" >> "$character_name.oblivionprofile"
		echo "points_endur=$points_endur" >> "$character_name.oblivionprofile"
		echo "points_pers=$points_pers" >> "$character_name.oblivionprofile"
		
		;;
	    1000|"load")
		echo -ne "\n${cyan}Profile files in ~/${reset}\n${green}$(ls -a *.oblivionprofile)${reset}\n"
		echo -ne "\n${white}Enter name of .oblivionprofile file to load:${reset} "
		read desired_file
		source $desired_file
		;;
	    "reset")
		# Used to completely reset all values given to the program
		echo -ne "Enter current level: "
		read current_level
		    let acrobatics=0;let alchemy=0;let alteration=0; let armorer=0; let athletics=0; let blade=0;let block=0;let blunt=0;let conjuration=0;let destruction=0;let hand2hand=0;
		    let heavy_armor=0;let illusion=0;let light_armor=0; let marksman=0;let mercantile=0;let mysticism=0;let restoration=0; let security=0; let sneak=0; let speechcraft=0;
		    # points towards attributes reset
		    let points_str=0; let points_intel=0;let points_will=0; let points_agil=0;let points_speed=0;let points_endur=0;let points_pers=0;
		    # attribute level increase indicators reset
		    let str=1; let intel=1;let will=1; let agil=1; let speed=1; let endur=1;let pers=1;
		    ;;
	    "quit")
		echo -ne "${red}Quitting${reset}"
		let i=0
		while [ $i -le 6 ]; do
		    echo -ne "${red}\rQuitting.   ${reset}"
		    sleep .2
		    echo -ne "${red}\rQuitting..  ${reset}"
		    sleep .2
		    echo -ne "${red}\rQuitting... ${reset}"
		    sleep .2
		    i=$((i+=1))
		done
		exit 0
		;;
	    *)
		echo "Error: invalid entry"
		sleep 1
		;;
	esac

	# if structure that adds the attribute totals for current level when points_toward_attributes get to a certain level

	# Strength attribute calc
	if [ $points_str -gt 10 ]; then
	    str=$((str=5))
	    echo -e "DANGER: ${red}OVERLEVELING STRENGTH${reset}"
	    sleep 2
	elif [ $points_str -eq 10 ]; then
	    str=$((str=5))
	    echo -e "${green}STRENGTH OPTIMAL${reset}"
	    sleep 2
	elif [ $points_str -lt 10 ] && [ $points_str -gt 7 ]; then
	    str=$((str=4))
	elif [ $points_str -lt 8 ] && [ $points_str -gt 4 ]; then
	    str=$((str=3))
	elif [ $points_str -lt 5 ] && [ $points_str -gt 0 ]; then
	    str=$((str=2))
	fi

	# Intelligence attribute calc
	if [ $points_intel -gt 10 ]; then
	    intel=$((intel=5))
	    echo -e "DANGER: ${red}OVERLEVELING INTELLIGENCE${reset}"
	    sleep 2
	elif [ $points_intel -eq 10 ]; then
	    intel=$((intel=5))
	    echo -e "${green}INTELLIGENCE OPTIMAL${reset}"
	    sleep 2
	elif [ $points_intel -lt 10 ] && [ $points_intel -gt 7 ]; then
	    intel=$((intel=4))
	elif [ $points_intel -lt 8 ] && [ $points_intel -gt 4 ]; then
	    intel=$((intel=3))
	elif [ $points_intel -lt 5 ] && [ $points_intel -gt 0 ]; then
	    intel=$((intel=2))
	fi

	# Willpower attribute calc
	if [ $points_will -gt 10 ]; then
	    will=$((will=5))
	    echo -e "DANGER: ${red}OVERLEVELING WILLPOWER${reset}"
	    sleep 2
	elif [ $points_will -eq 10 ]; then
	    will=$((will=5))
	    echo -e "${green}WILLPOWER OPTIMAL${reset}"
	    sleep 2
	elif [ $points_will -lt 10 ] && [ $points_will -gt 7 ]; then
	    will=$((will=4))
	elif [ $points_will -lt 8 ] && [ $points_will -gt 4 ]; then
	    will=$((will=3))
	elif [ $points_will -lt 5 ] && [ $points_will -gt 0 ]; then
	    will=$((will=2))
	fi

	# Agility attribute calc
	if [ $points_agil -gt 10 ]; then
	    agil=$((agil=5))
	    echo -e "DANGER: ${red}OVERLEVELING AGILITY${reset}"
	    sleep 2
	elif [ $points_agil -eq 10 ]; then
	    agil=$((agil=5))
	    echo -e "${green}AGILITY OPTIMAL${reset}"
	    sleep 2
	elif [ $points_agil -lt 10 ] && [ $points_agil -gt 7 ]; then
	    agil=$((agil=4))
	elif [ $points_agil -lt 8 ] && [ $points_agil -gt 4 ]; then
	    agil=$((agil=3))
	elif [ $points_agil -lt 5 ] && [ $points_agil -gt 0 ]; then
	    agil=$((agil=2))
	fi


	# Speed attribute calc
	if [ $points_speed -gt 10 ]; then
	    speed=$((speed=5))
	    echo -e "DANGER: ${red}OVERLEVELING SPEED${reset}"
	    sleep 2
	elif [ $points_speed -eq 10 ]; then
	    speed=$((speed=5))
	    echo -e "${green}SPEED OPTIMAL${reset}"
	    sleep 2
	elif [ $points_speed -lt 10 ] && [ $points_speed -gt 7 ]; then
	    speed=$((speed=4))
	elif [ $points_speed -lt 8 ] && [ $points_speed -gt 4 ]; then
	    speed=$((speed=3))
	elif [ $points_speed -lt 5 ] && [ $points_speed -gt 0 ]; then
	    speed=$((speed=2))
	fi

	# Endurance attribute calc
	if [ $points_endur -gt 10 ]; then
	    endur=$((endur=5))
	    echo -e "DANGER: ${red}OVERLEVELING ENDURANCE${reset}"
	    sleep 2
	elif [ $points_endur -eq 10 ]; then
	    endur=$((endur=5))
	    echo -e "${green}ENDURANCE OPTIMAL${reset}"
	    sleep 2
	elif [ $points_endur -lt 10 ] && [ $points_endur -gt 7 ]; then
	    endur=$((endur=4))
	elif [ $points_endur -lt 8 ] && [ $points_endur -gt 4 ]; then
	    endur=$((endur=3))
	elif [ $points_endur -lt 5 ] && [ $points_endur -gt 0 ]; then
	    endur=$((endur=2))
	fi


	# Personality attribute calc
	if [ $points_pers -gt 10 ]; then
	    pers=$((pers=5))
	    echo -e "DANGER: ${red}OVERLEVELING PERSONALITY${reset}"
	    sleep 2
	elif [ $points_pers -eq 10 ]; then
	    pers=$((pers=5))
	    echo -e "${green}PERSONALITY OPTIMAL${reset}"
	    sleep 2
	elif [ $points_pers -lt 10 ] && [ $points_pers -gt 7 ]; then
	    pers=$((pers=4))
	elif [ $points_pers -lt 8 ] && [ $points_pers -gt 4 ]; then
	    pers=$((pers=3))
	elif [ $points_pers -lt 5 ] && [ $points_pers -gt 0 ]; then
	    pers=$((pers=2))
	fi

	
    done
    
	
}


help_message_function()
{
    echo "$dashband$dashband"
    echo -ne "\n${green}create profile${reset} creates a new .oblivionprofile file for your character\n"
    echo -ne "${green}load profile${reset} loads an existing .oblivionprofile file on a character\n"
    echo -ne "freestyle leveling allows you to level and calculate attribute returns without saving a profile\n\n"
    echo "$dashband$dashband"
}


# main event loop

while [ 1 ]; do
    echo -ne "Select option:\n1) create profile\n2) load profile\n3) freestyle leveling loop\n4) help message\n${cyan}-->${reset} "
    read selectvar

    case $selectvar in
	1)
	    createprofile
	    ;;
	2)
	    loadprofile
	    ;;
	3)
	    freestyle_leveling
	    ;;
	4)
	    help_message_function
	    ;;
	*)
	    echo "Error: invalid selection"
	    ;;
    esac
done



