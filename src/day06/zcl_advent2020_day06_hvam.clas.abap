CLASS zcl_advent2020_day06_hvam DEFINITION
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



CLASS ZCL_ADVENT2020_DAY06_HVAM IMPLEMENTATION.


  METHOD part1.

    DATA lv_index TYPE i.
    DATA lv_sum TYPE i.
    DATA lv_char TYPE c LENGTH 1.
    DATA lt_unique TYPE STANDARD TABLE OF string.

    SPLIT input AT |\n\n| INTO TABLE DATA(lt_answers).

    LOOP AT lt_answers INTO DATA(lv_answer).
      REPLACE ALL OCCURRENCES OF |\n| IN lv_answer WITH ||.
      CLEAR lt_unique.
      DO strlen( lv_answer ) TIMES.
        lv_index = sy-index - 1.
        lv_char = lv_answer+lv_index(1).
        APPEND lv_char TO lt_unique.
      ENDDO.
      SORT lt_unique.
      DELETE ADJACENT DUPLICATES FROM lt_unique.
      lv_sum = lv_sum + lines( lt_unique ).
    ENDLOOP.

    output = lv_sum.
    CONDENSE output.

  ENDMETHOD.


  METHOD part2.

    DATA lv_index TYPE i.
    DATA lv_sum TYPE i.
    DATA lv_persons TYPE i.
    DATA lv_found TYPE i.
    DATA lv_char TYPE c LENGTH 1.
    DATA lt_unique TYPE STANDARD TABLE OF string.

    SPLIT input AT |\n\n| INTO TABLE DATA(lt_answers).

    LOOP AT lt_answers INTO DATA(lv_answer).
      FIND ALL OCCURRENCES OF |\n| IN lv_answer MATCH COUNT lv_persons.
      lv_persons = lv_persons + 1.
      REPLACE ALL OCCURRENCES OF |\n| IN lv_answer WITH ||.

      CLEAR lt_unique.
      DO strlen( lv_answer ) TIMES.
        lv_index = sy-index - 1.
        lv_char = lv_answer+lv_index(1).
        APPEND lv_char TO lt_unique.
      ENDDO.
      SORT lt_unique.
      DELETE ADJACENT DUPLICATES FROM lt_unique.

      LOOP AT lt_unique INTO lv_char.
        lv_found = count( val = lv_answer sub = lv_char ).
        IF lv_found = lv_persons.
          lv_sum = lv_sum + 1.
        ENDIF.
      ENDLOOP.

    ENDLOOP.

    output = lv_sum.
    CONDENSE output.

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part2( input ).

  ENDMETHOD.
ENDCLASS.
