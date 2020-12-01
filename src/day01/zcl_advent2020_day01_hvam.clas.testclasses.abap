
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    METHODS: part1 FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD part1.

    DATA lo_day1 TYPE REF TO zcl_advent2020_day01_hvam..

    CREATE OBJECT lo_day1.

    DATA(lv_result) = lo_day1->part1( |1721\n979\n366\n299\n675\n1456| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |514579| ).

  ENDMETHOD.

ENDCLASS.
