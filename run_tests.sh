#!/bin/bash

# ANSI escape codes for text color
green='\e[32m'
red='\e[31m'
reset='\e[0m' # Reset text color

# Iterate through each .c file in the script's directory
for test_file in *.c; do
    if [ -f "$test_file" ]; then
        # Extract the test name without extension
        test_name=$(basename "$test_file" .c)

        # Check if the test name starts with "public" or "student"
        if [[ "$test_name" == public* || "$test_name" == student* ]]; then
            # Compile the test and redirect compiler and linker messages to /dev/null
            gcc "$test_file" walrus.c checkmem.o -o "${test_name}.x" 2>/dev/null

            # Check if the compilation was successful
            if [ $? -eq 0 ]; then
                # Run the test and compare the output with the expected output
                "./${test_name}.x" | diff -b - "${test_name}.output" > /dev/null

                # Check the exit code of the 'diff' command to determine if the test passed
                if [ $? -eq 0 ]; then
                    echo -e "Test name: ${green}${test_name} pass${reset}"
                else
                    echo -e "Test name: ${red}${test_name} fail${reset}"
                fi
            else
                echo -e "Test name: ${red}${test_name} compile error${reset}"
            fi
            rm "./${test_name}.x"
        fi
    fi
done
