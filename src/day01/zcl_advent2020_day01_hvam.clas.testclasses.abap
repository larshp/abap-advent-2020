CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    METHODS: solve FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD solve.

    RETURN.

    DATA li_day1 TYPE REF TO zif_advent2020_hvam.

    CREATE OBJECT li_day1 TYPE zcl_advent2020_day01_hvam.

    DATA(lv_result) = li_day1->solve( |1721\n979\n366\n299\n675\n1456| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |514579| ).

  ENDMETHOD.

ENDCLASS.