CLASS zthe_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zthe_hello_world IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        out->write( |Hello world ({ cl_abap_context_info=>get_user_business_partner_id( ) })| ).
      CATCH cx_abap_context_info_error.
    ENDTRY.
    out->write( |sy-uname({ sy-uname })| ).
  ENDMETHOD.

ENDCLASS.
