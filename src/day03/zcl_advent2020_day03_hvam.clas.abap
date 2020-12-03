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

    DATA width TYPE i.
    DATA hits TYPE i.
    DATA pos TYPE i.
    DATA char TYPE c LENGTH 1.
    DATA x TYPE i VALUE 0.
    DATA lv_str TYPE string.

    SPLIT input AT |\n| INTO TABLE DATA(lt_trees).

    READ TABLE lt_trees INDEX 1 INTO lv_str.
    width = strlen( lv_str ).

    LOOP AT lt_trees INTO lv_str.
      pos = x MOD width.
      char = lv_str+pos(1).
      IF char = '#'.
        hits = hits + 1.
      ENDIF.
      x = x + 3.
    ENDLOOP.

    output = hits.
    CONDENSE output.

  ENDMETHOD.


  METHOD part2.
  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part1( input ).

  ENDMETHOD.
ENDCLASS.
