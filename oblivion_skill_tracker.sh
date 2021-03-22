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
    # character name
    echo "Enter your character's name (no space - use underscore or dash)"
    read character_name
    echo "character_name=\"$character_name\"" > "$character_name.oblivionprofile"

    # character race
    echo "list character race (lowercase)"
    read race
    echo "race=\"$race\"" >> "$character_name.oblivionprofile"

    # character sex
    echo "list character sex (lowercase)(m/f)"
    read sex
    echo "sex=\"$sex\"" >> "$character_name.oblivionprofile"

    # character star sign
    echo "enter character star sign (lowercase)"
    read sign
    echo "sign=\"$sign\"" >> "$character_name.oblivionprofile"
    # character's major skills - there are seven
    major_skills=()
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

#create_profile


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

load_profile









