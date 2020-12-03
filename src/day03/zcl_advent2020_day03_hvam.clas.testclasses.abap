CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mv_input TYPE string.
    DATA mo_cut TYPE REF TO zcl_advent2020_day03_hvam.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part1_2 FOR TESTING.
    METHODS part2 FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.

    mv_input = |..##.......\n#...#...#..\n.#....#..#.\n..#.#...#.#\n.#...##..#.\n..#.##.....\n.#.#.#....#\n.#........#\n#.##...#...\n#...##....#\n.#..#...#.#|.
    mo_cut = NEW #( ).

  ENDMETHOD.

  METHOD part1.

    DATA(lv_result) = mo_cut->part1( mv_input ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |7| ).

  ENDMETHOD.

  METHOD part1_2.

    DATA(lv_result) = mo_cut->part1( |....\n...#\n..#.\n.#..| ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |3| ).

  ENDMETHOD.

  METHOD part2.

    DATA(lv_result) = mo_cut->part2( mv_input ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = |336| ).

  ENDMETHOD.

ENDCLASS.
