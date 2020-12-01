
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.

    METHODS: part1 FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD part1.

    DATA lo_cut TYPE REF TO zcl_advent2020_day02_hvam.
    DATA lv_output TYPE string.

    CREATE OBJECT lo_cut.

    lv_output = lo_cut->part1( || ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_output
      exp = || ).

  ENDMETHOD.

ENDCLASS.
