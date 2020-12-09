
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day09_hvam.
    DATA mv_input TYPE string.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part2 FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.

    mo_cut = NEW #( ).

    mo_cut->preamble = 5.

    mv_input =
      |35\n| &
      |20\n| &
      |15\n| &
      |25\n| &
      |47\n| &
      |40\n| &
      |62\n| &
      |55\n| &
      |65\n| &
      |95\n| &
      |102\n| &
      |117\n| &
      |150\n| &
      |182\n| &
      |127\n| &
      |219\n| &
      |299\n| &
      |277\n| &
      |309\n| &
      |576|.

  ENDMETHOD.

  METHOD part1.

    DATA(lv_result) = mo_cut->part1( mv_input ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |127| ).

  ENDMETHOD.

  METHOD part2.

    DATA(lv_result) = mo_cut->part2( mv_input ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |62| ).

  ENDMETHOD.

ENDCLASS.
