CLASS zcl_advent2020_day02_hvam DEFINITION
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



CLASS ZCL_ADVENT2020_DAY02_HVAM IMPLEMENTATION.


  METHOD part1.

* todo

  ENDMETHOD.


  METHOD part2.

* todo

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = 'ABAPtodoABAP'.

  ENDMETHOD.
ENDCLASS.
