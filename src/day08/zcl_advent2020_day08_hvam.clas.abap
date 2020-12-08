CLASS zcl_advent2020_day08_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_hvam .

    TYPES: BEGIN OF ty_instruction,
             instruction TYPE string,
             argument    TYPE i,
             visited     TYPE abap_bool,
           END OF ty_instruction.

    DATA: mt_instructions TYPE STANDARD TABLE OF ty_instruction WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_runtime,
             terminates  TYPE abap_bool,
             accumulator TYPE i,
           END OF ty_runtime.

    METHODS run
      RETURNING
        VALUE(data) TYPE ty_runtime.

    METHODS parse
      IMPORTING
        !input TYPE string.
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



CLASS ZCL_ADVENT2020_DAY08_HVAM IMPLEMENTATION.


  METHOD parse.

    DATA ls_instruction LIKE LINE OF mt_instructions.

    CLEAR mt_instructions.

    SPLIT input AT |\n| INTO TABLE DATA(lt_rows).

    LOOP AT lt_rows INTO DATA(lv_row).
      SPLIT lv_row AT | | INTO DATA(lv_instruction) DATA(lv_argument).
      ls_instruction-instruction = lv_instruction.
      ls_instruction-argument = lv_argument.
      APPEND ls_instruction TO mt_instructions.
    ENDLOOP.

  ENDMETHOD.


  METHOD part1.

    parse( input ).

    DATA(runtime) = run( ).

    ASSERT runtime-terminates = abap_false.
    output = runtime-accumulator.
    CONDENSE output.

  ENDMETHOD.


  METHOD part2.

    parse( input ).

  ENDMETHOD.


  METHOD run.

    DATA index TYPE i VALUE 1.

    DO.
      READ TABLE mt_instructions INDEX index ASSIGNING FIELD-SYMBOL(<ls_instruction>).
      IF <ls_instruction>-visited = abap_true.
        RETURN.
      ENDIF.
      <ls_instruction>-visited = abap_true.
      CASE <ls_instruction>-instruction.
        WHEN 'acc'.
          data-accumulator = data-accumulator + <ls_instruction>-argument.
          index = index + 1.
        WHEN 'jmp'.
          index = index + <ls_instruction>-argument.
        WHEN 'nop'.
          index = index + 1.
        WHEN OTHERS.
          ASSERT 0 = 1.
      ENDCASE.
    ENDDO.

    data-terminates = abap_true.

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part2( input ).

  ENDMETHOD.
ENDCLASS.
