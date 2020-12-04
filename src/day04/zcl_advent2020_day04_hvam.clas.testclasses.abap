
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA mv_input TYPE string.
    DATA mo_cut TYPE REF TO zcl_advent2020_day04_hvam.
    METHODS setup.
    METHODS part1 FOR TESTING.
    METHODS part2 FOR TESTING.

ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.

    mv_input = |ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\n| &
      |byr:1937 iyr:2017 cid:147 hgt:183cm\n| &
      |\n| &
      |iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884\n| &
      |hcl:#cfa07d byr:1929\n| &
      |\n| &
      |hcl:#ae17e1 iyr:2013\n| &
      |eyr:2024\n| &
      |ecl:brn pid:760753108 byr:1931\n| &
      |hgt:179cm\n| &
      |\n| &
      |hcl:#cfa07d eyr:2025 pid:166559648\n| &
      |iyr:2011 ecl:brn hgt:59in|.

    mo_cut = NEW #( ).

  ENDMETHOD.

  METHOD part1.

    DATA(lv_result) = mo_cut->part1( mv_input ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = || ).

  ENDMETHOD.

  METHOD part2.

    DATA(lv_result) = mo_cut->part2( || ).

    cl_abap_unit_assert=>assert_equals(
      act = lv_result
      exp = || ).

  ENDMETHOD.

ENDCLASS.
