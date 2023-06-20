*** Settings ***
Library  Selenium2Library

*** Variables ***
${url}          https://rahulshettyacademy.com/AutomationPractice/
${browser}      chrome
${pattern}
*** Test Cases ***
TC1
        open browser  ${url}    ${browser}
        maximize browser window
        select radio button     radioButton     radio2
        select from list by value   //select[@id='dropdown-class-example']      option2
        ${name}  get selected list value    //select[@id='dropdown-class-example']
        should be equal  ${name}    option2

        sleep  4
        close browser
        
        