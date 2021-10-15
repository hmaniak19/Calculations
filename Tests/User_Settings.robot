*** Settings ***
Resource  ../Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***


*** Test Cases ***
User Changes Username
    [Setup]  Run Keywords  Begin Web Test
    ...      AND           TopNav.Go to Login Page
    ...      AND           LoginPage.Populate Login Form And Sumbit  ${VALID_USER_EMAIL}  ${VALID_USER_PASSWORD}
    ...      AND           TopNav.Verify User Is Signed In
    ...      AND           TopNav.Go To User Profile
    BuiltIn.Log  Step 1: I enter new username
    UserSettings.Input New Username And Save
    TopNav.Navigate To Main Page
    TopNav.Verify User Menu Includes Username  ${NEW_USERNAME}

