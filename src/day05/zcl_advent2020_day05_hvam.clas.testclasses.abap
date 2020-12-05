
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day05_hvam.
    METHODS setup.
    METHODS util1 FOR TESTING.
    METHODS util2 FOR TESTING.
    METHODS util3 FOR TESTING.
    METHODS util4 FOR TESTING.
    METHODS part1 FOR TESTING.
    METHODS part2 FOR TESTING.

ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.

    mo_cut = NEW #( ).

  ENDMETHOD.

  METHOD util1.

    DATA lv_row TYPE i.
    DATA lv_column TYPE i.

    mo_cut->util(
      EXPORTING
        pass   = 'FBFBBFFRLR'
      IMPORTING
        row    = lv_row
        column = lv_column ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_row
      exp = 44 ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_column
      exp = 5 ).

  ENDMETHOD.

  METHOD util2.

    DATA lv_row TYPE i.
    DATA lv_column TYPE i.

    mo_cut->util(
      EXPORTING
        pass   = 'BFFFBBFRRR'
      IMPORTING
        row    = lv_row
        column = lv_column ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_row
      exp = 70 ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_column
      exp = 7 ).

  ENDMETHOD.

  METHOD util3.

    DATA lv_row TYPE i.
    DATA lv_column TYPE i.

    mo_cut->util(
      EXPORTING
        pass   = 'FFFBBBFRRR'
      IMPORTING
        row    = lv_row
        column = lv_column ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_row
      exp = 14 ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_column
      exp = 7 ).

  ENDMETHOD.

  METHOD util4.

    DATA lv_row TYPE i.
    DATA lv_column TYPE i.

    mo_cut->util(
      EXPORTING
        pass   = 'BBFFBBFRLL'
      IMPORTING
        row    = lv_row
        column = lv_column ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_row
      exp = 102 ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_column
      exp = 4 ).

  ENDMETHOD.

  METHOD part1.

    DATA(lv_result) = mo_cut->part1( |FBFBBFFRLR| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |357| ).

  ENDMETHOD.

  METHOD part2.

    DATA(lv_result) = mo_cut->part2( || ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = || ).

  ENDMETHOD.

ENDCLASS.
