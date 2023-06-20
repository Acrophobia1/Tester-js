*** Settings ***
Library  Selenium2Library
*** Variables ***
${url}          https://demo.nopcommerce.com/register
${browser}      chrome
${email}        Oatto32@gmail.com
*** Test Cases ***
TC1
        open browser  ${url}    ${browser}
        Maximize Browser Window
        select radio button     Gender     M
        input text  //input[@id='FirstName']        Supakit
        input text  //input[@id='LastName']         Jatuten
        select from list by value   //select[@name='DateOfBirthDay']      31
#        ${Day}  get selected list value    //select[@name='DateOfBirthDay']
#        should be equal  ${Day}    31
        select from list by value   //select[@name='DateOfBirthMonth']      1
#        ${Month}  get selected list value    //select[@name='DateOfBirthMonth']
#        should be equal  ${Month}    1
        select from list by value   //select[@name='DateOfBirthYear']      1997
#        ${Year}  get selected list value    //select[@name='DateOfBirthYear']
#        should be equal  ${Year}    1997
        input text  //input[@id='Email']        ${email}
        input text  //input[@id='Password']     123456
        input text  //input[@id='ConfirmPassword']      123456
        Sleep   3
        click button  //button[@id='register-button']
        wait until element is visible       //div[@class='result']
        ${text}     get text  //div[@class='result']
        log to console  ${text}
        should contain  ${text}     Your registration completed
#       should ......... specbar 2up
        sleep  4
        close browser








