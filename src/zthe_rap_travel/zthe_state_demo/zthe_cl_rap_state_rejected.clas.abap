CLASS zthe_cl_rap_state_rejected DEFINITION
  PUBLIC
  INHERITING FROM zthe_cl_rap_state_open
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: zthe_if_rap_state~rejecttravel REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zthe_cl_rap_state_rejected IMPLEMENTATION.
  METHOD zthe_if_rap_state~rejecttravel.
    LOOP AT keys INTO DATA(key). "TODO use FOR .. IN value operand
      APPEND VALUE #(  %tky = key-%key ) TO failed-travel.

      APPEND VALUE #(  %tky        = key-%key
                   "TODO use fitting message
                   %state_area = 'VALIDATE_CUSTOMER'
                   %msg        = NEW zcm_rap_ZTHE(
                                     severity   = if_abap_behv_message=>severity-error
                                     textid     = zcm_rap_ZTHE=>unauthorized )
                   %element-CustomerID = if_abap_behv=>mk-on )
    TO reported-travel.
    ENDLOOP.
    "TODO check whether the response table needs to be filled
  ENDMETHOD.

ENDCLASS.
