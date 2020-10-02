# Manual Test Scenario

**Scenario:** Present user with a valid destination <br>
**Related Requirements:**   R1 obtain user input <br>
                            R2 present user with valid destination based on input <br>
**Description:** Testing the request for user input, the acceptance of user input and that a valid destination is then presented to the user<br>
**Steps:**<br>
1. Go to travel.rb app in terminal, using the automated run script
2. User should be presented with a request for their budget
3. type in budget and press enter
4. If budget is under $1,000 or they enter an invalid format or answer they should be presented with the destination of "BALI"
5. If budget is greater than $1,000 the user should be prompted to enter if they prefer warm or cold climates
6. If cold, the user should be asked if they prefer adventure, history or food holidays. <br>
    If warm, the user should be asked if they prefer history, food or relaxation.
6. depending on user input a valid destination should be presented<br>

**Outcome**<br>
If successful, a valid destination should be presented to the user in larger green writing.
<br> Result:PASSED <br>
Pass: Due to the "else" statement a valid destination should be provided regardless which prevents errors.
<br>