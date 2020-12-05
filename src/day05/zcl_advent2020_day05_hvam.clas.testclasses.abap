
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

    DATA(ls_data) = mo_cut->util( 'FBFBBFFRLR' ).

    cl_abap_unit_assert=>assert_equals(
      act = ls_data-row
      exp = 44 ).

    cl_abap_unit_assert=>assert_equals(
      act = ls_data-column
      exp = 5 ).

  ENDMETHOD.

  METHOD util2.

    DATA(ls_data) = mo_cut->util( 'BFFFBBFRRR' ).

    cl_abap_unit_assert=>assert_equals(
      act = ls_data-row
      exp = 70 ).

    cl_abap_unit_assert=>assert_equals(
      act = ls_data-column
      exp = 7 ).

  ENDMETHOD.

  METHOD util3.

    DATA(ls_data) = mo_cut->util( 'FFFBBBFRRR' ).

    cl_abap_unit_assert=>assert_equals(
      act = ls_data-row
      exp = 14 ).

    cl_abap_unit_assert=>assert_equals(
      act = ls_data-column
      exp = 7 ).

  ENDMETHOD.

  METHOD util4.

    DATA(ls_data) = mo_cut->util( 'BBFFBBFRLL' ).

    cl_abap_unit_assert=>assert_equals(
      act = ls_data-row
      exp = 102 ).

    cl_abap_unit_assert=>assert_equals(
      act = ls_data-column
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
