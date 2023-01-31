*** Settings ***
Documentation       This file contains test cases related to invalid login

Resource    ../resource/Base/common_functionalities.resource

Library     DataDriver      file=../test_data/Boat_data.xlsx        sheet_name=Invalid_Login_Test
Task Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser

Test Template       Invalid Login Template

*** Test Cases ***

Invalid Login Test


*** Keywords ***
Invalid Login Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Click Element    xpath=//img[@src="https://cdn.shopify.com/s/files/1/0057/8938/4802/files/Profile-1.png?v=1663762989"]
    Click Element    link=Login
    Input Text    name:customer[email]    ${username}
    Input Password    name:customer[password]    ${password}
    Click Element    xpath=//span[@class="loader-button__text"]
    Element Should Contain    xpath=//p[contains(@class,'banner__content')]      ${expected_error}








