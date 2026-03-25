#!/usr/bin/env ruby

def number_prediction_game
  # Display an introduction message for the game
  puts "=== Number Prediction Game ==="
  puts "Enter a number (0-24) each round. The game exits if you match a prediction.\n"

  cycle_count = 0
  predictions = [] # Initialize an empty array to store the predictions
  matched_numbers = []
  bet = 0

  loop do
    cycle_count += 1
    
    if cycle_count <= 3
      puts "--- Cycle #{cycle_count} ---"
      puts "No prediction yet. Enter a number (0-24):"
      input = gets.chomp.to_i
      
      # Validate the user's input and provide feedback if necessary
      if input < 0 || input > 24
        puts "Please enter a number between 0 and 24."
        next
      end
      
      # Check if the input matches any previous prediction
      if predictions.any? { |p| p == input }
        puts "You matched a predicted number! Game over."
        break
      end
    else
      puts "--- Cycle #{cycle_count} ---"
      bet += 0.5 # Increase the betting amount by 0.5 for each cycle
      puts "--- Bet #{bet} ---"
      puts "Suggested numbers: #{predictions.join(', ')}"
      puts "Enter a number (0-24):"
      input = gets.chomp.to_i
      
      if input < 0 || input > 24
        puts "Please enter a number between 0 and 24."
        next
      end
      
      # Check if the input matches any prediction
      if predictions.any? { |p| p == input }
        puts "You matched a predicted number! Game over."
        break
      end
    end

    # After 3 cycles, generate new predictions with guaranteed uniqueness
    if cycle_count > 3
      # Create an array of numbers from 0 to 24 excluding the existing predictions
      used_numbers = (0..24).to_a - predictions
      
      # Select 4 unique numbers randomly from the available numbers
      new_predictions = used_numbers.sample(4)
      
      # Clear the current predictions array and add the newly generated predictions
      predictions.clear
      predictions += new_predictions
    end
  end
end

# Run the game
number_prediction_game

