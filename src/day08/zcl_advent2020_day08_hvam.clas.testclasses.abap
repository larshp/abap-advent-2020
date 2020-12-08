
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day08_hvam.
    DATA mv_input TYPE string.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part2 FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.

    mv_input =
      |nop +0\n| &
      |acc +1\n| &
      |jmp +4\n| &
      |acc +3\n| &
      |jmp -3\n| &
      |acc -99\n| &
      |acc +1\n| &
      |jmp -4\n| &
      |acc +6|.

    mo_cut = NEW #( ).

  ENDMETHOD.

  METHOD part1.

    DATA(lv_result) = mo_cut->part1( mv_input ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |5| ).

  ENDMETHOD.

  METHOD part2.

    DATA(lv_result) = mo_cut->part2( mv_input ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |8| ).

  ENDMETHOD.

ENDCLASS.
