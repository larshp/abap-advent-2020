
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mv_input TYPE string.
    DATA mo_cut TYPE REF TO zcl_advent2020_day07_hvam.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part2 FOR TESTING.

ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.

    mv_input =
      |light red bags contain 1 bright white bag, 2 muted yellow bags.\n| &
      |dark orange bags contain 3 bright white bags, 4 muted yellow bags.\n| &
      |bright white bags contain 1 shiny gold bag.\n| &
      |muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.\n| &
      |shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.\n| &
      |dark olive bags contain 3 faded blue bags, 4 dotted black bags.\n| &
      |vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.\n| &
      |faded blue bags contain no other bags.\n| &
      |dotted black bags contain no other bags.|.

    mo_cut = NEW #( ).

  ENDMETHOD.

  METHOD part1.

    DATA(lv_result) = mo_cut->part1( mv_input ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |4| ).

  ENDMETHOD.

  METHOD part2.

    DATA(lv_result) = mo_cut->part2( || ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = || ).

  ENDMETHOD.

ENDCLASS.
