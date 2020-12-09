CLASS zcl_advent2020_day09_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .

    DATA preamble TYPE i .
    DATA numbers TYPE STANDARD TABLE OF int8 WITH DEFAULT KEY.

    METHODS parse
      IMPORTING
        !input TYPE string .
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



CLASS ZCL_ADVENT2020_DAY09_HVAM IMPLEMENTATION.


  METHOD parse.

    CLEAR numbers.

    SPLIT input AT |\n| INTO TABLE DATA(strings).

    LOOP AT strings INTO DATA(str).
      APPEND str TO numbers.
    ENDLOOP.

  ENDMETHOD.


  METHOD part1.


    parse( input ).

  ENDMETHOD.


  METHOD part2.
  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    preamble = 25.

    output = part1( input ).

  ENDMETHOD.
ENDCLASS.
