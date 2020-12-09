CLASS zcl_advent2020_day09_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .

    DATA preamble TYPE i .
    DATA numbers TYPE STANDARD TABLE OF int8 WITH DEFAULT KEY.

    METHODS check
      IMPORTING
        iv_index     TYPE i
      RETURNING
        VALUE(valid) TYPE abap_bool.
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


  METHOD check.

    DATA valid_numbers TYPE STANDARD TABLE OF int8 WITH DEFAULT KEY.
    DATA lv_number1 TYPE int8.
    DATA lv_number2 TYPE int8.
    DATA lv_index TYPE i.
    DATA lv_offset TYPE i.
    DATA lv_tmp TYPE i.

    lv_offset = iv_index - preamble.
    DO preamble TIMES.
      lv_index = sy-index + lv_offset - 1.
      READ TABLE numbers INDEX lv_index INTO lv_number1.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
      DO preamble TIMES.
        lv_index = sy-index + lv_offset - 1.
        READ TABLE numbers INDEX lv_index INTO lv_number2.
        IF sy-subrc <> 0.
          CONTINUE.
        ENDIF.
        IF lv_number1 <> lv_number2.
          lv_tmp = lv_number1 + lv_number2.
          APPEND lv_tmp TO valid_numbers.
        ENDIF.
      ENDDO.
    ENDDO.

    READ TABLE numbers INDEX iv_index INTO lv_number1.
    ASSERT sy-subrc = 0.
    READ TABLE valid_numbers WITH KEY table_line = lv_number1 TRANSPORTING NO FIELDS.
    valid = boolc( sy-subrc = 0 ).

  ENDMETHOD.


  METHOD parse.

    CLEAR numbers.

    SPLIT input AT |\n| INTO TABLE DATA(strings).

    LOOP AT strings INTO DATA(str).
      APPEND str TO numbers.
    ENDLOOP.

  ENDMETHOD.


  METHOD part1.

    DATA lv_index TYPE i.

    parse( input ).

    LOOP AT numbers INTO DATA(number).
      lv_index = sy-tabix.
      IF lv_index <= preamble.
        CONTINUE.
      ENDIF.

      DATA(lv_valid) = check( lv_index ).
      IF lv_valid = abap_false.
        READ TABLE numbers INDEX lv_index INTO output.
        CONDENSE output.
        RETURN.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD part2.

    DATA lv_invalid TYPE int8.
    DATA lv_sum TYPE int8.
    DATA lv_min TYPE int8.
    DATA lv_max TYPE int8.
    DATA lv_start TYPE i.
    DATA lv_index TYPE i.
    DATA lv_range TYPE i.
    DATA lv_end TYPE i.

    lv_invalid = part1( input ).

    DO lines( numbers ) TIMES.
      lv_start = sy-index.
      DO lines( numbers ) TIMES.
        lv_end = sy-index.
        IF lv_start >= lv_end.
          CONTINUE.
        ENDIF.

        lv_sum = 0.
        lv_min = 198620152477517.
        lv_max = 0.
        lv_range = lv_end - lv_start + 1. " including both borders
        DO lv_range TIMES.
          lv_index = sy-index + lv_start - 1.
          READ TABLE numbers INDEX lv_index INTO DATA(lv_number).
          ASSERT sy-subrc = 0.
          lv_sum = lv_sum + lv_number.
          IF lv_number < lv_min.
            lv_min = lv_number.
          ENDIF.
          IF lv_number > lv_max.
            lv_max = lv_number.
          ENDIF.
        ENDDO.

        IF lv_sum = lv_invalid.
          lv_sum = lv_min + lv_max.
          output = lv_sum.
          CONDENSE output.
          RETURN.
        ENDIF.

      ENDDO.
    ENDDO.

    ASSERT 0 = 1.

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    preamble = 25.

    output = part2( input ).

  ENDMETHOD.
ENDCLASS.
