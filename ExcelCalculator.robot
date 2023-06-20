*** Settings ***
Library  SeleniumLibrary
Library  DataDriver     ./TestData/bmidata.xlsx     sheet_name=Sheet1
Test Template   Test Calculator
Suite Setup      Launch Browser and Navigate to Url
Suite Teardown   Browser Close
*** Variables ***
${url}      https://www.calculator.net/bmi-calculator.html
${browser}  Chrome
*** Test Cases ***
Test BMI Calculator Template    ${age}      ${gender}      ${height}      ${weight}      ${status}
*** Keywords ***
Test calculator
    [Arguments]     ${age}      ${gender}      ${height}      ${weight}      ${status}
    input text      //input[@id='cage']             ${age}
    execute javascript      document.querySelector('input[value=${gender}]').click()
    input text      //input[@id='cheightmeter']     ${height}
    input text      //input[@id='ckg']              ${weight}
    click element   //input[@alt='Calculate']
    wait until element contains     //div[@class='bigtext']/font     ${status}
    ${result}       get text    //div[@class='bigtext']/font
    log to console      Result = ${result}
    should contain     ${result}       ${status}
    click element   //img[@class='clearbtn']
    sleep   3

Launch Browser and Navigate to Url
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
Browser Close
    close browser



