# BBTOOLS
Execute unit tests in bash/dash/ksh/csh/shell scripts.


## What is BBTOOLS ?
BBTOOL **is an overlay** of SHUNIT2 acting as an helper to write and execute **unit tests** easily. It's also an overlay of
Shellcheck to process a source code analysis of script files.


## Which scripts languages supported ?
Mainly DASH & BASH but anything else compliant with both SHUNIT2 and Shellcheck such as CSH, KSH and so on.


## How to install BBTOOLS ?
* Download the repository.
* Place it somewhere on your hard drive.
* Add the **bb executable** (the one under <BBTOOLS EXTRACT DIR>/bin/bb) to your $PATH variable.

And that's it !


## How to run it ?
There is three parameters to the bb command line :
- **bb check** : check the shell scripts using Shellcheck
- **bb clean** : clean the working directory
- **bb test** : generate the test suite and process it
- **bb help** : display help


## How to write unit tests ?
First of all, BBTOOLS respects the Apache Maven convention about the directory tree, so you should have this :
```
project-folder
    |__ src/
        |__ main/
        |   |__ shell/                  # Place your bash code there
        |       |__ lib_string.sh
        |__ test/
            |__ shell/                  # Place yours unit tests file there
        |       |__ lib_string_test.sh  # All unit test files HAVE TO end with 'test'
```

Content of **lib_string.sh** :
```bash
#!/usr/bin/env bash
# LOAD THE FILE TO TEST
. "${SRC_PATH}/lib_string.sh"


## WRITE YOUR UNIT TEST FUNCTION
## These HAVE TO start with 'test_'
test_string_should_return_true_when_contained_pattern() {
    # Given
    str="It is a big string with data into it"
    pattern="string with"

    # When
    result=`STRING_contains "${str}" "${pattern}"`

    # Then
    assertTrue "${result}"
}

test_string_should_return_false_with_empty_pattern() {
    # Given
    str="some value"
    pattern=""

    # When
    result=`STRING_contains "${str}" "${pattern}"`

    # Then
    assertFalse "${result}"
}

# ADD THIS UNIT TEST FILE INTO THE TEST SUITE
. ${RUN_TEST}
```


## Which assertions keywords are available ?
In your unit tests, you can use the following assert functions :

Note : the option [message] **is optional**.

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
