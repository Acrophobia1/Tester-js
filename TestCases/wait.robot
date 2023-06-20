*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}          https://www.calculatestuff.com/miscellaneous/tip-calculator
${browser}      chrome
${bill}         100
${tip}          15
${Person}       2
*** Test Cases ***
TC1
        open browser  ${url}    ${browser}
        maximize browser window
#        get selenium timeout
        input text  //input[@id='bill_amount']      ${bill}
        input text  //input[@id='tip_percent']      ${tip}
        click button    //input[@id='split_bill']
        input text  //input[@id='split_between']    ${Person}
        click button  //input[@id='calculate-button']
        wait until element is visible   (//div[@class='col-xs-4 col-sm-6 col-md-8'])[1]
        ${text1}     get text    (//div[@class='col-xs-4 col-sm-6 col-md-8'])[1]
        log to console      \nTip Amount = ${text1}
        ${text2}     get text    (//div[@class='col-xs-4 col-sm-6 col-md-8'])[2]
        log to console      Tip Amount = ${text2}
        log to console      \nPer Person
        ${text3}     get text    (//div[@class='col-xs-4 col-sm-6 col-md-8'])[3]
        log to console      Tip Amount = ${text3}
        ${text4}     get text    (//div[@class='col-xs-4 col-sm-6 col-md-8'])[4]
        log to console      Tip Amount = ${text4}


#        sleep  4
        close browser