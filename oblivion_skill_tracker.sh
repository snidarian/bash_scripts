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



# variable designations for general purpose use in script
dashband="-------------------------------------------"




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
    echo -ne "Enter first favored attribute: "
    read fav_attr_1
    echo "fav_attr_1=\"$fav_attr_1\"" >> "$character_name.oblivionprofile"
    echo -ne "Enter second favored attribute: "
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
    echo "from inside set_attributes function";echo "$sex $race $birthsign $fav_attr_1 $fav_attr_2" #test statements

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

    
	
}


# function sets major skills - is called by set_attributes function (because race and sex plays a role in skill intitial variable declarations)
# set skills function will set skills based on sex, race, and major skill selections
set_skills()
{
    # variables set by function call from set_attributes() function

    
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


create_profile


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

#load_profile



