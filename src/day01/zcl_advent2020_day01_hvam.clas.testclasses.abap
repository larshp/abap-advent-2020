
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day01_hvam.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part2 FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD part1.

    DATA(lv_result) = mo_cut->part1( |1721\n979\n366\n299\n675\n1456| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |514579| ).

  ENDMETHOD.

  METHOD part2.

    DATA(lv_result) = mo_cut->part2( |1721\n979\n366\n299\n675\n1456| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |241861950| ).

  ENDMETHOD.

ENDCLASS.
