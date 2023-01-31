*** Settings ***
Documentation       This file contains test cases related to product details
...     records

Resource    ../resource/Base/common_functionalities.resource

Library     DataDriver      file=../test_data/Boat_data.xlsx        sheet_name=Valid_Add_Product_Details



Task Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser
Test Template       Add Product Details Template

*** Test Cases ***
TC_${test_case}

*** Keywords ***
Add Product Details Template
    [Arguments]     ${username}     ${password}     ${street}    ${apartment}   ${city}    ${pincode}   ${couponcode}   ${validcode}      ${expected_city}

    Click Element    xpath=//img[@src="https://cdn.shopify.com/s/files/1/0057/8938/4802/files/Profile-1.png?v=1663762989"]
    Click Element    link=Login
    Input Text    name:customer[email]    ${username}
    Input Password    name:customer[password]    ${password}
    Click Element    xpath=//span[@class="loader-button__text"]
    Click Element    xpath=//a[@class="button button--primary"]
    Mouse Over    xpath=//span[text()='Categories']
    Click Element    xpath=//b[text()='Airdopes True Wireless']
    Click Element    xpath=//button[@class="popover-button hidden-pocket"]
    Click Element   xpath=//*[contains(text(),'Best selling')]
    Click Element    link= Airdopes 131
    Click Element    xpath=(//span[@class="loader-button__text"])[2]
    Sleep    10s
    Click Element    xpath=//span[@class="checkmark"]
    Click Element    xpath=//span[normalize-space()='PLACE ORDER']
    Input Text    name:checkout[shipping_address][address1]     ${street}
    Input Text    name:checkout[shipping_address][address2]    ${apartment}
    Input Text    name:checkout[shipping_address][city]    ${city}
    Input Text    name:checkout[shipping_address][zip]    ${pincode}
    Input Text    name:checkout[reduction_code]    ${couponcode}
    Click Element    checkout_submit
    Element Should Contain    xpath=//*[contains(text(),'Enter a valid')]       ${validcode}
    Element Attribute Value Should Be    xpath=//input[@id="checkout_shipping_address_city"]        value       ${expected_city}


























