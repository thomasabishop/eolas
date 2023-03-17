---
categories:
  - Programming Languages
tags:
  - shell
---

# Capturing user input in Bash

We use [read](/Programming_Languages/Shell/Read.md) to gather user input.

## Capturing raw inputs

```bash
# Wait for the input
echo "What is your name?"
read name

# Silently gather the input and proceed (the input won't show up in the terminal)
echo "What is your password?"
read -s pass

# Combine in single line
read  -p "What's your favourite animal? " animal

echo name: $name, pass $pass, animal: $animal
```

## Offering a selection

We can use `select` to get the user to choose from a series of options.

```sh
select animal in "bird" "dog" "cow"
do
    echo "You selected $animal"
    break
done
```

This will present each option as number that can be inputted:

```
1) bird
2) dog
3) cow
#? 1
You selected bird
```

We could make this more robust by using a case statement:

```sh
select animal in "bird" "dog" "cow"
do
    case $animal in
        bird) echo "Birds like to tweet";;
        dog) echo "Dogs like to woof";;
        cow) echo "Cows like to moo";;
        quit) break;;
        *) "I'm not sure what that means"
    esac
done
```

## Validating the user inputs

Here we test that the right number of [arguments](/Programming_Languages/Shell/Passing_arguments_and_options_to_Bash_scripts.md) have been passed to the script:

```sh
if (( $#<3 )); then
    echo "This command requires three arguments:"a
    echo "username, userId, and favouriteNumber"
else
    echo "username: $1"
    echo "userid: $2"
    echo "favourite number: $3"
fi
```
