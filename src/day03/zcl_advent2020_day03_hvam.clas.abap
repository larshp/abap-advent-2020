CLASS zcl_advent2020_day03_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .

    METHODS util
      IMPORTING
        !right      TYPE i
        !input      TYPE string
        !down       TYPE i
      RETURNING
        VALUE(hits) TYPE i .
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

    DATA total TYPE i.

    total = util(
      input  = input
      right  = 1
      down   = 1 ).

    total = total * util(
      input  = input
      right  = 3
      down   = 1 ).

    total = total * util(
      input  = input
      right  = 5
      down   = 1 ).

    total = total * util(
      input  = input
      right  = 7
      down   = 1 ).

    total = total * util(
      input  = input
      right  = 1
      down   = 2 ).

    output = total.
    CONDENSE output.

  ENDMETHOD.


  METHOD util.

    DATA width TYPE i.
    DATA pos TYPE i.
    DATA char TYPE c LENGTH 1.
    DATA x TYPE i VALUE 0.
    DATA index TYPE i.
    DATA lv_str TYPE string.

    SPLIT input AT |\n| INTO TABLE DATA(lt_trees).

    READ TABLE lt_trees INDEX 1 INTO lv_str.
    width = strlen( lv_str ).

    LOOP AT lt_trees INTO lv_str.
      index = index + 1.
      pos = x MOD width.
      char = lv_str+pos(1).
      IF char = '#'.
        hits = hits + 1.
      ENDIF.
      x = x + right.
    ENDLOOP.

    IF hits = 0.
      BREAK-POINT.
    ENDIF.

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part2( input ).

  ENDMETHOD.
ENDCLASS.
