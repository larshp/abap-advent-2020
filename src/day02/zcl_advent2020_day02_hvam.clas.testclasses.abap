
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day02_hvam.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part1_2 FOR TESTING.
    METHODS part1_3 FOR TESTING.
    METHODS part1_4 FOR TESTING.
    METHODS part1_5 FOR TESTING.
    METHODS part1_6 FOR TESTING.
    METHODS part1_7 FOR TESTING.
    METHODS part1_8 FOR TESTING.
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

    DATA(lv_result) = mo_cut->part1( |10-17 g: gmwpvcbxtgjlcgznlrjp\n14-18 b: bbbbsbbbbbbbbpbbbw\n3-5 f: fffvnpvf| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |2| ).

  ENDMETHOD.

  METHOD part1_5.

    DATA(lv_result) = mo_cut->part1( |1-1 a: a\n5-5 b: bbbbb| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |2| ).

  ENDMETHOD.

  METHOD part1_6.

    DATA(lv_result) = mo_cut->part1( |4-6 m: mmmmmmm| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |0| ).

  ENDMETHOD.

  METHOD part1_7.

    DATA(lv_result) = mo_cut->part1( |1-2 a: aa\n5-6 b: bbbbbb| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |2| ).

  ENDMETHOD.

  METHOD part1_8.

    DATA(lv_result) = mo_cut->part1( |1-2 a: a\n5-6 b: bbbbb| ).

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
