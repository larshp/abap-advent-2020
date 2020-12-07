
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zcl_advent2020_day07_hvam.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part2 FOR TESTING.

ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.

    mo_cut = NEW #( ).

  ENDMETHOD.

  METHOD part1.

    DATA lv_input TYPE string.

    lv_input =
      |light red bags contain 1 bright white bag, 2 muted yellow bags.\n| &
      |dark orange bags contain 3 bright white bags, 4 muted yellow bags.\n| &
      |bright white bags contain 1 shiny gold bag.\n| &
      |muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.\n| &
      |shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.\n| &
      |dark olive bags contain 3 faded blue bags, 4 dotted black bags.\n| &
      |vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.\n| &
      |faded blue bags contain no other bags.\n| &
      |dotted black bags contain no other bags.|.

    DATA(lv_result) = mo_cut->part1( lv_input ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |4| ).

  ENDMETHOD.

  METHOD part2.

    DATA lv_input TYPE string.

    lv_input =
      |shiny gold bags contain 2 dark red bags.\n| &
      |dark red bags contain 2 dark orange bags.\n| &
      |dark orange bags contain 2 dark yellow bags.\n| &
      |dark yellow bags contain 2 dark green bags.\n| &
      |dark green bags contain 2 dark blue bags.\n| &
      |dark blue bags contain 2 dark violet bags.\n| &
      |dark violet bags contain no other bags.|.

    DATA(lv_result) = mo_cut->part2( lv_input ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |126| ).

  ENDMETHOD.

ENDCLASS.
