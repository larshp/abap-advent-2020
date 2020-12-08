
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day09_hvam.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part2 FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.

    mo_cut = NEW #( ).

  ENDMETHOD.

  METHOD part1.

    DATA(lv_result) = mo_cut->part1( || ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = || ).

  ENDMETHOD.

  METHOD part2.

    DATA(lv_result) = mo_cut->part2( || ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = || ).

  ENDMETHOD.

ENDCLASS.
