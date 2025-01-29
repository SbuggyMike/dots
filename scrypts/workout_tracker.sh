#! /bin/bash
# configuration file
CONFIG_FILE="exercises.cfg"
WORKOUT_FILE="$HOME/life_org/workouts"

# Load exercises from the config file
load_exercises() {
    if [[ -f "$CONFIG_FILE" ]]; then
        mapfile -t EXERCISES < "$CONFIG_FILE"
    else
        echo "Configuration file '$CONFIG_FILE' not found. Please create it with a list of exercises."
        exit 1
    fi 
}

# Display the list of exercises as a numbered menu
display_exercises() {
    echo "Select an exercise:"
    for i in "${!EXERCISES[@]}"; do
        echo "$((i+1)). ${EXERCISES[$i]}"
    done
    echo "0. Exit"
}

# Upload a workout
upload_workout() {
    local date=$(date +%Y-%m-%d)
    local exercise=""
    local sets=""
    local reps=""
    local weight=""

    while true; do
        display_exercises
        read -p "Choose an exercise by number (or 0 to finish): " choice

        if [[ "$choice" -eq 0 ]]; then
            break
        elif [[ "$choice" -gt 0 && "$choice" -le "${#EXERCISES[@]}" ]]; then
            exercise="${EXERCISES[$((choice-1))]}"
            read -p "Enter sets: " sets
            read -p "Enter reps: " reps
            read -p "Enter weight (kg): " weight

            echo "$date,$exercise,$sets,$reps,$weight" >> "$WORKOUT_FILE"
            echo "Workout logged: $date, $exercise, $sets sets, $reps reps, $weight kg"
        else
            echo "Invalid choice. Please try again."
        fi
    done
}

# Search for the maximum weight for a given exercise
search_max_weight() {
    local exercise=""
    display_exercises
    read -p "Choose an exercise by number: " choice

    if [[ "$choice" -gt 0 && "$choice" -le "${#EXERCISES[@]}" ]]; then
        exercise="${EXERCISES[$((choice-1))]}"
        max_weight=$(awk -F, -v ex="$exercise" '$2 == ex {if ($5 > max) max=$5} END {print max+0}' "$WORKOUT_FILE")

        if [[ "$max_weight" -gt 0 ]]; then
            echo "Maximum weight for $exercise: $max_weight kg"
        else
            echo "No records found for $exercise."
        fi
    else
        echo "Invalid choice. Please try again."
    fi
}

# Main menu
main_menu() {
    while true; do
        echo "1. Upload Workout"
        echo "2. Search Maximum Weight for an Exercise"
        echo "3. Exit"
        read -p "Choose an option: " option

        case "$option" in
            1) upload_workout ;;
            2) search_max_weight ;;
            3) break ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

# Load exercises and start the main menu
load_exercises
main_menu
