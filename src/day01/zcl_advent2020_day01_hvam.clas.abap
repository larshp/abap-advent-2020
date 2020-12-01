CLASS zcl_advent2020_day01_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .

    METHODS part1
      IMPORTING
        !input        TYPE string
      RETURNING
        VALUE(output) TYPE string .
    METHODS part2
      IMPORTING
        !input        TYPE string
      RETURNING
        VALUE(output) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_advent2020_day01_hvam IMPLEMENTATION.


  METHOD part1.

    " DATA lv_temp1 TYPE i.
    " DATA lv_temp2 TYPE i.
    DATA lv_temp TYPE i.

    SPLIT input AT |\n| INTO TABLE DATA(lt_strings).

    LOOP AT lt_strings INTO DATA(lv_string1).
      LOOP AT lt_strings INTO DATA(lv_string2).
        " lv_temp1 = lv_string1.
        " lv_temp2 = lv_string2.
        IF lv_string1 + lv_string2 = 2020.
          lv_temp = lv_string1 * lv_string2.
          output = lv_temp.
          CONDENSE output.
          RETURN.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.


  METHOD part2.

    DATA lv_temp1 TYPE i.
    DATA lv_temp2 TYPE i.
    DATA lv_temp3 TYPE i.
    DATA lv_temp TYPE i.

    SPLIT input AT |\n| INTO TABLE DATA(lt_strings).

    LOOP AT lt_strings INTO DATA(lv_string1).
      LOOP AT lt_strings INTO DATA(lv_string2).
        LOOP AT lt_strings INTO DATA(lv_string3).
          lv_temp1 = lv_string1.
          lv_temp2 = lv_string2.
          lv_temp3 = lv_string3.
          IF lv_temp1 + lv_temp2 + lv_temp3 = 2020.
            lv_temp = lv_temp1 * lv_temp2 * lv_temp3.
            output = lv_temp.
            CONDENSE output.
            RETURN.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part2( input ).

  ENDMETHOD.
ENDCLASS.