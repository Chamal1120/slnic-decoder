```psedocode
Class: NicInfo
  Properties:
    - nicNo (String)
    - format (String)
    - serialNo (String)
    - birthDate (String)
    - age (String)
    - gender (String)
    - votability (String)

  Function: isLeapYear(year)
    - Return true if year is divisible by 4 and (not divisible by 100 or divisible by 400)
    - Otherwise, return false

  Factory Function: from9Digit(nicVal)
    - Initialize gender as "Male"
    - Initialize votability as "No"
    - Extract serial number from nicVal
    - Extract year and birth code from nicVal

    - If birth code is greater than 500:
      - Subtract 500 from birth code
      - Set gender to "Female"

    - Determine birth month and day using days in months array
    - If date is 29th February and year is not a leap year:
      - Adjust to 1st March

    - Calculate age by subtracting birth year from current year
    - Adjust age if birth month and day have not passed in the current year

    - If NIC ends with "V", set votability to "Yes"

    - Return a new NicInfo object with extracted details

  Factory Function: from12Digit(nicVal)
    - Initialize gender as "Male"
    - Initialize votability as "No"
    - Extract serial number from nicVal
    - Extract year and birth code from nicVal

    - If birth code is greater than 500:
      - Subtract 500 from birth code
      - Set gender to "Female"

    - Determine birth month and day using days in months array
    - If date is 29th February and year is not a leap year:
      - Adjust to 1st March

    - Calculate age by subtracting birth year from current year
    - Adjust age if birth month and day have not passed in the current year

    - If age is 18 or above, set votability to "Yes"

    - Return a new NicInfo object with extracted details
```
