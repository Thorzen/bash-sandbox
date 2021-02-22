#!/bin/bash
min_num=1;
max_num=100;
num=$(($min_num + $RANDOM % $max_num)); #Rand number from min to max.
re='^[0-9]+$';

guess=
attempts=0
until [[ $num -eq $guess ]]; do
    printf "Guess a number between %s and %s\n" $min_num $max_num
    read -r guess;
    if ! [[ $guess =~ $re ]]; then 
        echo "Must be number"
    elif [[ $guess == $num ]]; then
        echo "YOU GUESSED RIGHT!"
    elif [[ $guess -gt $num ]]; then 
        echo "Guess Lower"
        ((attempts++))
    else
        echo "Guess Higher";
        ((attempts++))
    fi
done

printf "It took %s attempts\n" $attempts