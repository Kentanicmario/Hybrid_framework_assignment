*** Settings ***
Library     AppiumLibrary

*** Test Cases ***
TC1
    [Documentation]     #working with native app access scrolling
    Open Application    remote_url=http://localhost:4723/wd/hub
    ...     platformName=android
    ...     deviceName=motoonrfusionplus
    ...     appPackage=com.meesho.supply
    ...     appActivity=com.meesho.supply.main.MainActivity
    ...     noReset=true

    Set Appium Timeout    20s
    Run Keyword And Ignore Error    Wait Until Page Contains Element    xpath=//*[@resource-id='com.meesho.supply:id/close']
    Run Keyword And Ignore Error    Click Element    xpath=//*[@resource-id='com.meesho.supply:id/close']
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Electronics"]
    Click Element    xpath=//android.widget.TextView[@text="Electronics"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Fitbands"]
    Click Element    xpath=//android.widget.TextView[@text="Fitbands"]
    ${abc}      Get Matching Xpath Count    xpath=//android.widget.TextView[@text="₹272 with 2 Special Offers"]
    WHILE    ${abc}==0
        Swipe By Percent    90    70    90    20
        ${abc}      Get Matching Xpath Count    xpath=//android.widget.TextView[@text="₹272 with 2 Special Offers"]
    END
    Click Element    xpath=//android.widget.TextView[@text="₹272 with 2 Special Offers"]
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="Add to Cart"]
    Click Element   xpath=//android.widget.Button[@text="Add to Cart"]
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="Add to Cart"]
    Click Element   xpath=//android.widget.Button[@text="Add to Cart"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="USE ANOTHER MOBILE NUMBER"]
    Click Element    xpath=//android.widget.TextView[@text="USE ANOTHER MOBILE NUMBER"]
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="NONE OF THE ABOVE"]
    Click Element    xpath=//android.widget.Button[@text="NONE OF THE ABOVE"]
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@text="Phone Number"]
    Click Element    xpath=//android.widget.EditText[@text="Phone Number"]
    Input Text    xpath=//android.widget.EditText[@text="Phone Number"]    987678756754
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text="Continue"]
    Click Element    xpath=//android.widget.Button[@text="Continue"]
    Wait Until Page Contains Element    xpath=//*[contains(@text,'valid')]
    Element Should Contain Text      xpath=//*[contains(@text,'valid')]       Enter a valid mobile number
