```psuedoCode
Class: NicController
  Variables:
    - nicInfo (Observable Nullable NicInfo)
    - isLoading (Observable Boolean)

  Function: decodeNic(nicVal)
    - Set isLoading to true
    - Set nicInfo to null

    - If NIC length is 10:
      - Remove the last character

    - If the remaining string is not a valid number:
      - Set isLoading to false
      - Return (Exit Function)

    - If NIC length is 10:
      - Call from9Digit(nicVal) and store result in nicInfo
    - Else if NIC length is 12:
      - Call from12Digit(nicVal) and store result in nicInfo
    - Else:
      - Set isLoading to false
      - Return (Exit Function)

    - Set isLoading to false
```
