*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}           https://petstore.octoperf.com/actions/Catalog.action
${browser}       chrome
${user}     j2ee
*** Test Cases ***
TC(pet)
#from //*[@X1="X2"]
#from //X1[@X2="X3"]
    open browser  ${url}    ${browser}
    maximize browser window
    click element   css:area[alt='Dogs']
    click link      css:a[href*='K9-RT-01']
    click link      css:a[href*='addItemToCart']
    click link      css:a[href*='newOrderForm']
    input text      css:input[name='username']    ${User}
    click element   css:input[name="signon"]
    click element   css:a[href*='signoff']
    sleep   4
    close browser