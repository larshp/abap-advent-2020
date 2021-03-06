CLASS zcl_advent2020_day07_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .

    TYPES:
      BEGIN OF ty_contents,
        count TYPE i,
        color TYPE string,
      END OF ty_contents .
    TYPES:
      BEGIN OF ty_bag,
        color    TYPE string,
        contents TYPE STANDARD TABLE OF ty_contents WITH DEFAULT KEY,
      END OF ty_bag .

    DATA:
      mt_bags TYPE STANDARD TABLE OF ty_bag WITH DEFAULT KEY .

    METHODS count_bags
      IMPORTING
        !iv_color       TYPE string
      RETURNING
        VALUE(rv_count) TYPE i .
    METHODS is_valid
      IMPORTING
        !iv_color    TYPE string
      RETURNING
        VALUE(valid) TYPE abap_bool .
    METHODS parse
      IMPORTING
        !input TYPE string .
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



CLASS ZCL_ADVENT2020_DAY07_HVAM IMPLEMENTATION.


  METHOD count_bags.

    LOOP AT mt_bags INTO DATA(ls_bag).
      IF ls_bag-color = iv_color.

        rv_count = 1.
        LOOP AT ls_bag-contents INTO DATA(ls_contents).
          rv_count = rv_count + ls_contents-count * count_bags( ls_contents-color ).
        ENDLOOP.

        EXIT. "current loop
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD is_valid.

    LOOP AT mt_bags INTO DATA(ls_bag).
      IF ls_bag-color <> iv_color.
        CONTINUE.
      ENDIF.

      LOOP AT ls_bag-contents INTO DATA(ls_contents).
        IF ls_contents-color = 'shiny gold' OR is_valid( ls_contents-color ) = abap_true.
          valid = abap_true.
          RETURN.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

    valid = abap_false.

  ENDMETHOD.


  METHOD parse.

    DATA ls_bag LIKE LINE OF mt_bags.
    DATA lv_offset TYPE i.
    DATA lv_length TYPE i.

    CLEAR mt_bags.

    SPLIT input AT |\n| INTO TABLE DATA(lt_lines).

    LOOP AT lt_lines INTO DATA(lv_line).
      CLEAR ls_bag.

      FIND REGEX '^(\w+ \w+) ' IN lv_line SUBMATCHES DATA(lv_color).
      ls_bag-color = lv_color.

      DO.
        FIND REGEX ' (\d+) (\w+ \w+)' IN lv_line
          MATCH OFFSET lv_offset
          MATCH LENGTH lv_length
          SUBMATCHES DATA(lv_count) lv_color.
        IF sy-subrc = 0.
          APPEND VALUE #( count = lv_count color = lv_color ) TO ls_bag-contents.
          lv_offset = lv_offset + lv_length.
          lv_line = lv_line+lv_offset.
        ELSE.
          EXIT. " current loop
        ENDIF.
      ENDDO.

      APPEND ls_bag TO mt_bags.
    ENDLOOP.

  ENDMETHOD.


  METHOD part1.

* note that this is really slow to run

    DATA lv_valid TYPE i.

    parse( input ).

    LOOP AT mt_bags INTO DATA(ls_bag).
      IF ls_bag-color = 'shiny gold'.
        CONTINUE.
      ENDIF.
      IF is_valid( ls_bag-color ) = abap_true.
        lv_valid = lv_valid + 1.
      ENDIF.
    ENDLOOP.

    output = lv_valid.
    CONDENSE output.

  ENDMETHOD.


  METHOD part2.

    DATA lv_count TYPE i.

    parse( input ).

    LOOP AT mt_bags INTO DATA(ls_bag).
      IF ls_bag-color = 'shiny gold'.
        lv_count = count_bags( ls_bag-color ) - 1.
      ENDIF.
    ENDLOOP.

    output = lv_count.
    CONDENSE output.

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part2( input ).

  ENDMETHOD.
ENDCLASS.
