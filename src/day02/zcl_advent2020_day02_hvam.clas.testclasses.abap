
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day02_hvam.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part2 FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD part1.

    DATA(lv_result) = mo_cut->part1( |1-3 a: abcde\n1-3 b: cdefg\n2-9 c: ccccccccc| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |2| ).

  ENDMETHOD.

  METHOD part2.

    DATA(lv_result) = mo_cut->part2( || ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = || ).

  ENDMETHOD.

ENDCLASS.
