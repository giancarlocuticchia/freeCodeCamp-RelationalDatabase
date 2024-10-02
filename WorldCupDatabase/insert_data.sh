#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Empty the tables if not empty
echo "$($PSQL "TRUNCATE TABLE games, teams;")"

### Insert teams data

# Read the games.csv file
COUNTRIES_SEEN=""
COUNTRIES_TO_INSERT=$(
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Ignore the header for the winners
  if [[ $WINNER != 'winner' ]]
  then
    # Check that the winner country has not been seen already
    if ! [[ $COUNTRIES_SEEN =~ $WINNER ]]
    then
      # Add the country to the seen countries
      if [[ $COUNTRIES_SEEN = "" ]]
      then
        COUNTRIES_SEEN+="('$WINNER'"
      else
        COUNTRIES_SEEN+="), ('$WINNER'"
      fi
    fi
  fi

  # Ignore the header for the opponents
  if [[ $OPPONENT != 'opponent' ]]
  then
    # Check that the opponent country has not been seen already
    if ! [[ $COUNTRIES_SEEN =~ $OPPONENT ]]
    then
      # Add the country to the seen countries
      if [[ $COUNTRIES_SEEN = "" ]]
      then
        COUNTRIES_SEEN+="('$OPPONENT'"
      else
        COUNTRIES_SEEN+="), ('$OPPONENT'"
      fi
    fi
  fi

  # echo the updated seen countries
  echo "$COUNTRIES_SEEN"
done | tail -n 1
)
COUNTRIES_TO_INSERT+=")"

#echo -e "\nCountries to insert:"
#echo $COUNTRIES_TO_INSERT

# Insert the values into the teams table
echo "Inserting teams into the teams table."
echo "$($PSQL "INSERT INTO teams(name) VALUES $COUNTRIES_TO_INSERT ;")"
echo "Values successfully inserted."


### Insert games data

echo "Inserting information into the games table."
# Read the games.csv file
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Check that we are not using the header of the .csv
  if [[ $WINNER != 'winner' ]]
  then
    # Get the winner id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    # Get the opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    # Insert the data into the games table
    echo "$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")"
  fi
done
echo "Information successfully inserted."
