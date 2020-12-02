CLASS zcl_advent2020_day03_hvam DEFINITION
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



CLASS ZCL_ADVENT2020_DAY03_HVAM IMPLEMENTATION.


  METHOD part1.
  ENDMETHOD.


  METHOD part2.
  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = 'todo'.

  ENDMETHOD.
ENDCLASS.
