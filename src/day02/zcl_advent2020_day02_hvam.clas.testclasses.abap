
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day02_hvam.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part1_2 FOR TESTING.
    METHODS part1_3 FOR TESTING.
    METHODS part1_4 FOR TESTING.
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

  METHOD part1_2.

    DATA(lv_result) = mo_cut->part1( |1-3 a: a\n1-3 a: aaa| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |2| ).

  ENDMETHOD.

  METHOD part1_3.

    DATA(lv_result) = mo_cut->part1( |1-3 a: aaaa| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |0| ).

  ENDMETHOD.

  METHOD part1_4.

    DATA(lv_result) = mo_cut->part1( |10-17 g: gmwpvcbxtgjlcgznlrjp\n14-18 b: bbbbsbbbbbbbbpbbbw| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |1| ).

  ENDMETHOD.

  METHOD part2.

    DATA(lv_result) = mo_cut->part2( || ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = || ).

  ENDMETHOD.

ENDCLASS.
