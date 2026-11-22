
#!/bin/bash

# Simple Interest Calculator
# Author: Jose Alejandro Castro

echo "================================"
echo "   SIMPLE INTEREST CALCULATOR"
echo "================================"

# Request principal amount
read -p "Enter the principal amount: " principal

# Request annual interest rate
read -p "Enter the annual interest rate (%): " rate

# Request time period
read -p "Enter the time period (years): " time

# Validate that inputs are non-negative numbers
number='^[0-9]+([.][0-9]+)?$'

if ! [[ $principal =~ $number &&
        $rate =~ $number &&
        $time =~ $number ]]; then
    echo "Error: Please enter valid non-negative numbers."
    exit 1
fi

# Calculate simple interest
# Formula: SI = (P * R * T) / 100

interest=$(awk -v p="$principal" \
               -v r="$rate" \
               -v t="$time" \
               'BEGIN {printf "%.2f", (p*r*t)/100}')

# Display result
echo "================================"
echo "Principal Amount: $principal"
echo "Annual Interest Rate: $rate%"
echo "Time Period: $time years"
echo "Simple Interest: $interest"
echo "================================"
