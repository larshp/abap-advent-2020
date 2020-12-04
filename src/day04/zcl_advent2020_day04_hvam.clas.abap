CLASS zcl_advent2020_day04_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .

    METHODS get_lines
      IMPORTING
        !input       TYPE string
      RETURNING
        VALUE(lines) TYPE string_table .
    METHODS part1
      IMPORTING
        !input        TYPE string
      RETURNING
        VALUE(output) TYPE string .
    METHODS part2
      IMPORTING
        !input        TYPE string
      RETURNING
        VALUE(output) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ADVENT2020_DAY04_HVAM IMPLEMENTATION.


  METHOD get_lines.

    SPLIT input AT |\n\n| INTO TABLE DATA(tmp).

    LOOP AT tmp INTO DATA(lv_tmp).
      REPLACE ALL OCCURRENCES OF |\n| IN lv_tmp WITH | |.
      lv_tmp = lv_tmp && | |. " workaround for end of line regex matching
      APPEND lv_tmp TO lines.
    ENDLOOP.

  ENDMETHOD.


  METHOD part1.

    DATA valid TYPE i.
    DATA lv_line TYPE string.

    DATA(lines) = get_lines( input ).

    LOOP AT lines INTO lv_line.

      FIND FIRST OCCURRENCE OF 'byr:' IN lv_line.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
      FIND FIRST OCCURRENCE OF 'iyr:' IN lv_line.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
      FIND FIRST OCCURRENCE OF 'eyr:' IN lv_line.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
      FIND FIRST OCCURRENCE OF 'hgt:' IN lv_line.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
      FIND FIRST OCCURRENCE OF 'hcl:' IN lv_line.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
      FIND FIRST OCCURRENCE OF 'ecl:' IN lv_line.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
      FIND FIRST OCCURRENCE OF 'pid:' IN lv_line.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.

      valid = valid + 1.
    ENDLOOP.

    output = valid.
    CONDENSE output.

  ENDMETHOD.


  METHOD part2.

    DATA valid TYPE i.
    DATA lv_line TYPE string.
    DATA lv_data TYPE string.
    DATA lv_unit TYPE string.

    DATA(lines) = get_lines( input ).

    LOOP AT lines INTO lv_line.

      FIND FIRST OCCURRENCE OF REGEX 'byr:(\d\d\d\d)\s' IN lv_line SUBMATCHES lv_data.
      IF sy-subrc <> 0 OR lv_data < 1920 OR lv_data > 2002.
        CONTINUE.
      ENDIF.

      FIND FIRST OCCURRENCE OF REGEX 'iyr:(\d\d\d\d)\s' IN lv_line SUBMATCHES lv_data.
      IF sy-subrc <> 0 OR lv_data < 2010 OR lv_data > 2020.
        CONTINUE.
      ENDIF.

      FIND FIRST OCCURRENCE OF REGEX 'eyr:(\d\d\d\d)\s' IN lv_line SUBMATCHES lv_data.
      IF sy-subrc <> 0 OR lv_data < 2020 OR lv_data > 2030.
        CONTINUE.
      ENDIF.

      FIND FIRST OCCURRENCE OF REGEX 'hgt:(\d+)(in|cm)\s' IN lv_line SUBMATCHES lv_data lv_unit.
      IF sy-subrc <> 0.
        CONTINUE.
      ELSEIF lv_unit = 'cm' AND ( lv_data < 150 OR lv_data > 193 ).
        CONTINUE.
      ELSEIF lv_unit = 'in' AND ( lv_data < 59 OR lv_data > 76 ).
        CONTINUE.
      ENDIF.

      FIND FIRST OCCURRENCE OF REGEX 'hcl:#[0-9a-f]{6}\s' IN lv_line.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.

      FIND FIRST OCCURRENCE OF REGEX 'ecl:(amb|blu|brn|gry|grn|hzl|oth)\s' IN lv_line.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.

      FIND FIRST OCCURRENCE OF REGEX 'pid:\d{9}\s' IN lv_line.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.

      valid = valid + 1.
    ENDLOOP.

    output = valid.
    CONDENSE output.

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part2( input ).

  ENDMETHOD.
ENDCLASS.
