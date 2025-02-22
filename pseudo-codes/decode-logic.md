## Decode logic for NIC numbers

```pseudocode
begin
  function decode9Digit(nicVal)
    gender = "Male"
    votability = "No"
    serialNo = substring(nicVal, 5, 9)
    nicLetter = lowercase(substring(nicVal, 9))
    birthYear = toInteger("19" + substring(nicVal, 0, 2))
    birthCode = toInteger(substring(nicVal, 2, 5))

    if birthCode > 500 then
      birthCode = birthCode - 500
      gender = "Female"
    end if

    daysInMonths = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    month = 1
    day = birthCode

    for each m in daysInMonths do
      if day <= m then
        exit loop
      end if
      day = day - m
      month = month + 1
    end for

    if month == 2 and day == 29 and not isLeapYear(birthYear) then
      month = 3
      day = 1
    end if

    birthDate = birthYear + "/" + padLeft(month, 2, "0") + "/" + padLeft(day, 2, "0")
    
    currentYear = getCurrentYear()
    age = currentYear - birthYear

    if getCurrentMonth() < month or (getCurrentMonth() == month and getCurrentDay() < day) then
      age = age - 1
    end if

    if nicLetter == "v" then
      votability = "Yes"
    end if

    return (nicVal, "Old", serialNo, birthDate, age, gender, votability)
  end function

  function decode12Digit(nicVal)
    gender = "Male"
    votability = "No"
    serialNo = substring(nicVal, 7)
    birthYear = toInteger(substring(nicVal, 0, 4))
    birthCode = toInteger(substring(nicVal, 4, 7))

    if birthCode > 500 then
      birthCode = birthCode - 500
      gender = "Female"
    end if

    daysInMonths = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    month = 1
    day = birthCode

    for each m in daysInMonths do
      if day <= m then
        exit loop
      end if
      day = day - m
      month = month + 1
    end for

    if month == 2 and day == 29 and not isLeapYear(birthYear) then
      month = 3
      day = 1
    end if

    birthDate = birthYear + "/" + padLeft(month, 2, "0") + "/" + padLeft(day, 2, "0")

    currentYear = getCurrentYear()
    age = currentYear - birthYear

    if getCurrentMonth() < month or (getCurrentMonth() == month and getCurrentDay() < day) then
      age = age - 1
    end if

    if age >= 18 then
      votability = "Yes"
    end if

    return (nicVal, "New", serialNo, birthDate, age, gender, votability)
  end function

  function isLeapYear(year)
    return (year mod 4 == 0 and (year mod 100 != 0 or year mod 400 == 0))
  end function
end
```
