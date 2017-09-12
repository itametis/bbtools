#!/usr/bin/env bash
#####
## COPYRIGHT © ITAMETIS - TOUS DROITS RÉSERVÉS
## Pour plus d'information veuillez contacter : copyright@itametis.com
#####


## INTRODUCION
## ----------------------------------------------------------------------------
## This file is provided as sample in order to help you to write unit tests in 
## shell scripts.
##
## There is always three steps to respect during the testing process :
## 1) Source the file to test with command like `. "$SRC_PATH/my_lib.sh"`.
## 2) Write yours testing functions just below the line [1].
## 3) Declare the testing script as unit test file to process at the end of
##    the file with the command `. $RUN_TEST`.
##
##
##
## ASSERTIONS
## ----------------------------------------------------------------------------
## In your unit tests, you can use the following assert functions
##
## Equality
##  - assertEquals [message] 'expected value' '$value'
##  - assertNotEquals [message] 'expected value' '$value'
##
## Identity
##  - assertSame [message] 'expected value' '$value'
##  - assertNotSame [message] 'expected value' '$value'
##
## Rightness
##  - assertFalse [message] '$value'
##  - assertTrue [message] '$value'
##
## Nullity
##  - assertNull [message] '$value'
##  - assertNotNull [message] '$value'
##



## SAMPLE
## ----------------------------------------------------------------------------
. "$SRC_PATH/lib_string.sh"


## Then write your unit TEST
test_string_should_return_true_when_contained_pattern() {
    # Given
    str="It is a big string with data into it"
    pattern="string with"

    # When
    result=`STRING_contains "$str" "$pattern"`

    # Then
    assertTrue "$result"
}

test_string_should_return_false_when_not_contained_pattern() {
    # Given
    str="It is a big string with data into it"
    pattern="unmatchable pattern"

    # When
    result=`STRING_contains "$str" "$pattern"`

    # Then
    assertFalse "$result"
}

test_string_should_return_false_with_empty_string() {
    # Given
    str=""
    pattern="pattern"

    # When
    result=`STRING_contains "$str" "$pattern"`

    # Then
    assertFalse "$result"
}

test_string_should_return_false_with_empty_pattern() {
    # Given
    str="some value"
    pattern=""

    # When
    result=`STRING_contains "$str" "$pattern"`

    # Then
    assertTrue "$result"
}

. $RUN_TEST
