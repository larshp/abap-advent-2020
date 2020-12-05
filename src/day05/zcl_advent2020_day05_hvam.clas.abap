CLASS zcl_advent2020_day05_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .

    METHODS util
      IMPORTING
        !pass   TYPE string
      EXPORTING
        !row    TYPE i
        !column TYPE i .
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



CLASS ZCL_ADVENT2020_DAY05_HVAM IMPLEMENTATION.


  METHOD part1.

    DATA lv_row TYPE i.
    DATA lv_column TYPE i.
    DATA lv_max TYPE i.
    DATA lv_id TYPE i.

    SPLIT input AT |\n| INTO TABLE DATA(table).

    LOOP AT table INTO DATA(pass).

      util(
        EXPORTING
          pass   = pass
        IMPORTING
          row    = lv_row
          column = lv_column ).

      lv_id = ( lv_row * 8 ) + lv_column.
      IF lv_id > lv_max.
        lv_max = lv_id.
      ENDIF.

    ENDLOOP.

    output = lv_max.
    CONDENSE output.

  ENDMETHOD.


  METHOD part2.

* todo

  ENDMETHOD.


  METHOD util.

    DATA lv_low TYPE i.
    DATA lv_high TYPE i.
    DATA lv_char TYPE c LENGTH 1.
    DATA lv_range TYPE i.
    DATA lv_offset TYPE i.

    lv_low = 0.
    lv_high = 127.
    DO 7 TIMES.
      lv_offset = sy-index - 1.
      lv_char = pass+lv_offset(1).
      lv_range = lv_high - lv_low.
      lv_range = lv_range / 2.
      IF lv_char = 'F'.
        lv_high = lv_high - lv_range.
      ELSEIF lv_char = 'B'.
        lv_low = lv_low + lv_range.
      ELSE.
        ASSERT 0 = 1.
      ENDIF.
    ENDDO.
    row = lv_high.

    lv_low = 0.
    lv_high = 7.
    DO 3 TIMES.
      lv_offset = sy-index + 6.
      lv_char = pass+lv_offset(1).
      lv_range = lv_high - lv_low.
      lv_range = lv_range / 2.
      IF lv_char = 'L'.
        lv_high = lv_high - lv_range.
      ELSEIF lv_char = 'R'.
        lv_low = lv_low + lv_range.
      ELSE.
        ASSERT 0 = 1.
      ENDIF.
    ENDDO.
    column = lv_high.

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part1( input ).

  ENDMETHOD.
ENDCLASS.
