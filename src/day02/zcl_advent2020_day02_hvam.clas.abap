CLASS zcl_advent2020_day02_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .

    TYPES: BEGIN OF ty_password,
             min      TYPE string,
             max      TYPE string,
             letter   TYPE c LENGTH 1,
             password TYPE string,
           END OF ty_password.

    TYPES: ty_passwords TYPE STANDARD TABLE OF ty_password WITH EMPTY KEY.

    METHODS parse
      IMPORTING
                !input           TYPE string
      RETURNING VALUE(passwords) TYPE ty_passwords.
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



CLASS ZCL_ADVENT2020_DAY02_HVAM IMPLEMENTATION.


  METHOD parse.

    DATA lt_strings TYPE STANDARD TABLE OF string WITH DEFAULT KEY.
    DATA ls_password LIKE LINE OF passwords.

    SPLIT input AT |\n| INTO TABLE lt_strings.

    LOOP AT lt_strings INTO DATA(lv_string).
      CLEAR ls_password.
      FIND REGEX '(\d+)-(\d+) (\w): (\w+)' IN lv_string
        SUBMATCHES ls_password-min ls_password-max ls_password-letter ls_password-password.
      ASSERT sy-subrc = 0.
      APPEND ls_password TO passwords.
    ENDLOOP.

  ENDMETHOD.


  METHOD part1.

    DATA(lt_passwords) = parse( input ).
    DATA(lv_valid) = 0.

    LOOP AT lt_passwords INTO DATA(ls_password).
      FIND ALL OCCURRENCES OF ls_password-letter IN ls_password-password MATCH COUNT DATA(lv_count).
      IF lv_count BETWEEN ls_password-min AND ls_password-max.
        lv_valid = lv_valid + 1.
      ENDIF.
    ENDLOOP.

    output = lv_valid.
    CONDENSE output.

  ENDMETHOD.


  METHOD part2.

* todo

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part1( input ).

  ENDMETHOD.
ENDCLASS.
