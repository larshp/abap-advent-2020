CLASS zcl_advent2020_day01_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ADVENT2020_DAY01_HVAM IMPLEMENTATION.


  METHOD zif_advent2020_hvam~solve.

    DATA lt_strings TYPE STANDARD TABLE OF string WITH DEFAULT KEY.
    DATA lv_temp1 TYPE i.
    DATA lv_temp2 TYPE i.
    DATA lv_temp TYPE i.

    SPLIT input AT |\n| INTO TABLE lt_strings.

    LOOP AT lt_strings INTO DATA(lv_string1).
      LOOP AT lt_strings INTO DATA(lv_string2).
        lv_temp1 = lv_string1.
        lv_temp2 = lv_string2.
        IF lv_temp1 + lv_temp2 = 2020.
          lv_temp = lv_temp1 * lv_temp2.
          output = lv_temp.
          CONDENSE output.
          RETURN.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
