#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t -q --no-align -c"

# Functions definitions
#######################

UPDATE_USER_DATABASE(){
  # First argument is CURRENT_NUMBER_OF_GUESSES

  # Check if it's the first time playing for this user
  if [[ -z $($PSQL "SELECT username FROM users WHERE username='$USERNAME';") ]]
  then
    # Add first game to the database for the user
    echo $($PSQL "INSERT INTO users(username, n_games_played, best_games_guesses) VALUES('$USERNAME', 1, $1);")
  else
    # Retrieve number of games played from the database
    GAMES_PLAYED=$($PSQL "SELECT n_games_played FROM users WHERE username='$USERNAME';")

    # Update the number of games played in the database
    GAMES_PLAYED=$(($GAMES_PLAYED+1))
    echo $($PSQL "UPDATE users SET n_games_played=$GAMES_PLAYED WHERE username='$USERNAME';")

    # Retrieve number of guesses for best game
    BEST_GAME=$($PSQL "SELECT best_games_guesses FROM users WHERE username='$USERNAME';")

    # Update the number of guesses for best game in the database
    if (( $1 < $BEST_GAME ))
    then
      echo $($PSQL "UPDATE users SET best_games_guesses=$1 WHERE username='$USERNAME';")
    fi

  fi
}

PLAY_GAME(){
  # First argument is the INPUT_NUMBER
  INPUT_NUMBER=$1
  # Second argument is the CURRENT_NUMBER_OF_GUESSES
  CURRENT_NUMBER_OF_GUESSES=$2
  
  # Check if the INPUT_NUMBER is an integer:
  if [[ $INPUT_NUMBER =~ ^[+-]?[0-9]+$ ]]
  then
    # Evaluate the INPUT_NUMBER
    if (( $INPUT_NUMBER > $RANDOM_NUMBER ))
    then
      # If user's number is bigger:
      echo -e "\nIt's lower than that, guess again:"
      read INPUT_NUMBER
      CURRENT_NUMBER_OF_GUESSES=$(($CURRENT_NUMBER_OF_GUESSES+1))

      PLAY_GAME $INPUT_NUMBER $CURRENT_NUMBER_OF_GUESSES
    elif (( $INPUT_NUMBER < $RANDOM_NUMBER ))
    then
      # If user's number is lower:
      echo -e "\nIt's higher than that, guess again:"
      read INPUT_NUMBER
      CURRENT_NUMBER_OF_GUESSES=$(($CURRENT_NUMBER_OF_GUESSES+1))

      PLAY_GAME $INPUT_NUMBER $CURRENT_NUMBER_OF_GUESSES
    else
      # Once the right number is guessed:
      echo -e "\nYou guessed it in $CURRENT_NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

      UPDATE_USER_DATABASE $CURRENT_NUMBER_OF_GUESSES
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
    read INPUT_NUMBER
    PLAY_GAME $INPUT_NUMBER $CURRENT_NUMBER_OF_GUESSES
  fi
}

#Start the program
##################

# randomly generate a number that users have to guess
echo -e "\n~~~The random number guessing game~~~\n"


# Ask the user for an username
echo "Enter your username:"
read USERNAME

# Check if USERNAME is already in the database
if [[ ! -z $($PSQL "SELECT username FROM users WHERE username='$USERNAME';") ]]
then
  # If USERNAME already in the database:
  GAMES_PLAYED=$($PSQL "SELECT n_games_played FROM users WHERE username='$USERNAME';")
  BEST_GAME=$($PSQL "SELECT best_games_guesses FROM users WHERE username='$USERNAME';")
  
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi


# Generate random number between 1 and 1000:
RANDOM_NUMBER=$((1 + $RANDOM % 1000))


# Start the game
echo -e "\nGuess the secret number between 1 and 1000:"
read INPUT_NUMBER

PLAY_GAME $INPUT_NUMBER 1