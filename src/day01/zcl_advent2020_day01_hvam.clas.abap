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



CLASS ZCL_ADVENT2020_DAY01_HVAM IMPLEMENTATION.


  METHOD part1.

    SPLIT input AT |\n| INTO TABLE DATA(lt_strings).

    LOOP AT lt_strings INTO DATA(lv_string1).
      LOOP AT lt_strings INTO DATA(lv_string2).
        IF lv_string1 + lv_string2 = 2020.
          output = condense( CONV i( lv_string1 * lv_string2 ) ).
          RETURN.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.


  METHOD part2.

    SPLIT input AT |\n| INTO TABLE DATA(lt_strings).

    LOOP AT lt_strings INTO DATA(lv_string1).
      LOOP AT lt_strings INTO DATA(lv_string2).
        LOOP AT lt_strings INTO DATA(lv_string3).
          IF lv_string1 + lv_string2 + lv_string3 = 2020.
            output = condense( CONV i( lv_string1 * lv_string2 * lv_string3 ) ).
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
