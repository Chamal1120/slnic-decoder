## Controller Logic

```pseudocode
begin
  function decodeNic(nicVal)
    isLoading = true
    nicInfo = null
    checkString = nicVal

    if length(nicVal) == 10 then
      checkString = substring(nicVal, 0, length(nicVal) - 1)
    end if

    if not isNumber(checkString) then
      isLoading = false
      return
    end if

    if length(nicVal) == 10 then
      nicInfo = decode9Digit(nicVal)
    else if length(nicVal) == 12 then
      nicInfo = decode12Digit(nicVal)
    else
      isLoading = false
      return
    end if

    isLoading = false
  end function
end
```
