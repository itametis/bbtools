# BBTOOLS
Execute unit tests in bash / ksh / csh / shell scripts


## What is BBTOOLS ?
BBTOOL **is an overlay** of SHUNIT2 acting as an helper to write and execute **unit tests** easily.


## Which scripts languages supported ?
Mainly BASH but anything else compliant with SHUNIT2 like CSH, KSH and so on.


## How to install BBTOOLS ?
* Download the last archive inside the [release section]().
* Extract it somewhere on your hard drive.
* Add the **bb executable** under <BBTOOLS EXTRACT DIR>/bin/bb to your $PATH variable.

And that's it !


## How to run it ?
There is three parameters to the bb command line :
- **bb clean** : clean the working directory
- **bb test** : generate the test suite and process it
- **bb help** : display help


## How to write unit tests ?
First of all, BBTOOLS respects the Apache Maven convention about the directory tree, so you should have this :
```
project-folder
    |__ src/
        |__ main/
        |   |__ bash/                   # Place your bash code there
        |       |__ lib_string.sh
        |__ test/
            |__ bash/                   # Place yours unit tests file there
        |       |__ lib_string_test.sh  # All unit test files HAVE TO end with 'test'
```

Content of **lib_string.sh** :
```bash
#!/usr/bin/env bash
# LOAD THE FILE TO TEST
. "$SRC_PATH/lib_string.sh"


## WRITE YOUR UNIT TEST FUNCTION
## These HAVE TO start with 'test_'
test_string_should_return_true_when_contained_pattern() {
    # Given
    str="It is a big string with data into it"
    pattern="string with"

    # When
    result=`STRING_contains "$str" "$pattern"`

    # Then
    assertTrue "$result"
}

test_string_should_return_false_with_empty_pattern() {
    # Given
    str="some value"
    pattern=""

    # When
    result=`STRING_contains "$str" "$pattern"`

    # Then
    assertFalse "$result"
}

# ADD THIS UNIT TEST FILE INTO THE TEST SUITE
. $RUN_TEST
```


## Which assertions keywords are available ?
In your unit tests, you can use the following assert functions :

```bash
## Equality
assertEquals [message] 'expected value' '$value'
assertNotEquals [message] 'expected value' '$value'

## Identity
assertSame [message] 'expected value' '$value'
assertNotSame [message] 'expected value' '$value'

## Rightness
assertFalse [message] '$value'
assertTrue [message] '$value'

## Nullity
assertNull [message] '$value'
assertNotNull [message] '$value'
```