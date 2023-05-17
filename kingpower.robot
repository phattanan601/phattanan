*** Settings ***
Library    Selenium2Library

*** Variable ***
${URL}        http://the-internet.herokuapp.com/login
${input_user}   tomsmith
${input_pass}   SuperSecretPassword!
${user_incorrect}       tomholland
${pass_incorrect}       Password!

*** Test Case ***
OPEN WEBBROWSER
     open browser    ${URL}  chrome   
     
Login success
    Input Text    id=username     ${input_user}
    Input Password    id=password     ${input_pass}
    Click Button    class=radius
    Wait Until Page Contains     Welcome to the Secure Area. When you are done click logout below.
    Click Element   xpath: //*[contains(text(), "Logout")]	

Login failed - Password incorrect
    Input Text    id=username     ${input_user}
    Input Password    id=password     ${pass_incorrect}
    Click Button    class=radius
    Wait Until Page Contains     Your password is invalid!

Login failed - Username not found
    Input Text    id=username     ${user_incorrect}
    Input Password    id=password     ${input_pass}
    Click Button    class=radius
    Wait Until Page Contains     Your username is invalid!
   