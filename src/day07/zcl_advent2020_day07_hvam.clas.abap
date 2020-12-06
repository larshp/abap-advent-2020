class ZCL_ADVENT2020_DAY07_HVAM definition
  public
  final
  create public .

public section.

  interfaces ZIF_ADVENT2020_HVAM .

  methods PART1
    importing
      !INPUT type STRING
    returning
      value(OUTPUT) type STRING .
  methods PART2
    importing
      !INPUT type STRING
    returning
      value(OUTPUT) type STRING .
  PROTECTED SECTION.
private section.
ENDCLASS.



CLASS ZCL_ADVENT2020_DAY07_HVAM IMPLEMENTATION.


  METHOD part1.

* todo

  ENDMETHOD.


  METHOD part2.

* todo

  ENDMETHOD.


  METHOD zif_advent2020_hvam~solve.

    output = part1( input ).

  ENDMETHOD.
ENDCLASS.
