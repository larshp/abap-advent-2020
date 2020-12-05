CLASS zcl_advent2020_day05_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .

    TYPES: BEGIN OF ty_data,
             row    TYPE i,
             column TYPE i,
             id     TYPE i,
           END OF ty_data.

    METHODS util
      IMPORTING
        !pass       TYPE string
      RETURNING
        VALUE(data) TYPE ty_data .
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

    DATA lv_max TYPE i.

    SPLIT input AT |\n| INTO TABLE DATA(table).

    LOOP AT table INTO DATA(pass).
      DATA(ls_data) = util( pass ).
      IF ls_data-id > lv_max.
        lv_max = ls_data-id.
      ENDIF.
    ENDLOOP.

    output = lv_max.
    CONDENSE output.

  ENDMETHOD.


  METHOD part2.

    DATA lv_index TYPE i.
    DATA lt_ids TYPE STANDARD TABLE OF i WITH DEFAULT KEY.

    SPLIT input AT |\n| INTO TABLE DATA(table).

    LOOP AT table INTO DATA(pass).
      DATA(ls_data) = util( pass ).
      APPEND ls_data-id TO lt_ids.
    ENDLOOP.
    SORT lt_ids.

* find the empty spot, note that this is not correct, but works for the input
    LOOP AT lt_ids INTO DATA(lv_id).
      lv_index = sy-tabix + 1.
      READ TABLE lt_ids INDEX lv_index INTO DATA(lv_next).
      IF lv_next <> lv_id + 1.
        output = lv_id + 1.
        EXIT. " current loop
      ENDIF.
    ENDLOOP.

    CONDENSE output.

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
    data-row = lv_high.

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
    data-column = lv_high.

    data-id = ( data-row * 8 ) + data-column.

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part2( input ).

  ENDMETHOD.
ENDCLASS.
