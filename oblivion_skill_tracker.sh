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
    echo "Enter character race (lowercase)"
    read race
    echo "race=\"$race\"" >> "$character_name.oblivionprofile"
    
    # character birthsignsign
    echo -ne "Enter character birthsign (lowercase)\n(Options: apprentice, atronach, lady, lord, lover, mage, ritual, serpent, shadow, steed, thief, tower, warrior)\n Birthsign: "
    read birthsign
    echo "birthsign=\"$birthsign\"" >> "$character_name.oblivionprofile"

    # Enter characters two favored attributes (The two attributes you can add +5 to at beginning of game)
    echo -ne "Enter first favored attribute: "
    read fav_attr_1
    echo -ne "Enter second favored attribute: "
    read fav_attr_2
    echo "" #newline
    # add these to attribute totals calculated after race and sex calculations
    set_attributes $sex $race $birthsign $fav_attr_1 $fav_attr_2
}


# function sets major skills - is called by set_attributes function (because race and sex plays a role in skill intitial variable declarations)

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
	"altmer"|"high elf")
	    echo "you are high elf"
	    ;;
	"argonian")
	    echo "you are argonian"
	    ;;
	"bosmer"|"wood elf")
	    echo "you are a wood elf"
	    ;;
	"breton")
	    echo "you are breton"
	    ;;
	"dunmer"|"dark elf")
	    echo "you are a dark elf"
	    ;;
	"imperial")
	    echo "you are imperial"
	    ;;
	"khajiit")
	    echo "you are khajiit"
	    ;;
	"nord")
	    echo "you are a nord"
	    ;;
	"orsimer"|"orc")
	    echo "you are an orc"
	    ;;
	"redguard")
	    echo "you are redguard"
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
	    speed=$((speed+=10))
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
    


    

    echo "attributes set to:"
    echo -ne "strength=$strength\nintelligence=$intelligence\nwillpower=$willpower\nagility=$agility\nspeed=$speed\nendurance=$endurance\npersonality=$personality\nluck=$luck\n"




    # add favored attributes to total

    #1st - favored attributes cannot equal each other
    if [[ $fav_attr_1 == $fav_attr_2 ]]; then
	echo "Error: favored attributes one and two cannot be the same"
	exit -1
    else
	# case statement which will add the favored attributes to totals
	echo "case statement"
    fi
    
	
}


# set skills function will set skills based on sex, race, and major skill selections
set_skills()
{
    #function body
}


create_profile


# load .oblivionprofile file
load_profile()
{
    echo -ne "type character name to load profile: "
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





