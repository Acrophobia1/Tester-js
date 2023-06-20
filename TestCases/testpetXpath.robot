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
    click element   //area[@alt="Dogs"]
    click link      //a[contains(text(),'K9-RT-01')]
    click element   //a[contains(text(),'Add to Cart')]
    click element   //a[contains(text(),'Proceed to Checkout')]
    input text      name:username  ${user}
    click element   //input[@name="signon"]
    sleep   4
    close browser



