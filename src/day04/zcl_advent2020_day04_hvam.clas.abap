CLASS zcl_advent2020_day04_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .

    METHODS get_lines
      IMPORTING
        !input       TYPE string
      RETURNING
        VALUE(lines) TYPE string_table .
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



CLASS ZCL_ADVENT2020_DAY04_HVAM IMPLEMENTATION.


  METHOD get_lines.

    SPLIT input AT |\n\n| INTO TABLE DATA(tmp).

    LOOP AT tmp INTO DATA(lv_tmp).
      REPLACE ALL OCCURRENCES OF |\n| IN lv_tmp WITH | |.
      APPEND lv_tmp TO lines.
    ENDLOOP.

  ENDMETHOD.


  METHOD part1.

    DATA(lines) = get_lines( input ).

  ENDMETHOD.


  METHOD part2.
  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part1( input ).

  ENDMETHOD.
ENDCLASS.
