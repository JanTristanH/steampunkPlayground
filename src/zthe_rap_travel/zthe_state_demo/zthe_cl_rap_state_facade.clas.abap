CLASS zthe_cl_rap_state_facade DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_travel_status TYPE c
                         RAISING
                           cx_abap_invalid_value.
    INTERFACES zthe_if_rap_state.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mo_state TYPE REF TO zthe_if_rap_state.
ENDCLASS.



CLASS zthe_cl_rap_state_facade IMPLEMENTATION.
  METHOD constructor.
    CASE iv_travel_status.
      WHEN zthe_if_rap_state~travel_status-open.
        mo_state = NEW zthe_cl_rap_state_open(  ).
      WHEN zthe_if_rap_state~travel_status-accepted.
        mo_state = NEW zthe_cl_rap_state_accepted(  ).
      WHEN zthe_if_rap_state~travel_status-canceled.
        mo_state = NEW zthe_cl_rap_state_rejected(  ).
      WHEN OTHERS.
        RAISE EXCEPTION new cx_abap_invalid_value( value = |{ iv_travel_status }| ).
    ENDCASE.
  ENDMETHOD.

  METHOD zthe_if_rap_state~accepttravel.
    result = mo_state->accepttravel(
      EXPORTING
        keys     = keys
      CHANGING
        mapped   = mapped
        failed   = failed
        reported = reported
    ).
  ENDMETHOD.

  METHOD zthe_if_rap_state~rejecttravel.
    result = mo_state->rejecttravel(
    EXPORTING
      keys     = keys
    CHANGING
      mapped   = mapped
      failed   = failed
      reported = reported
  ).
  ENDMETHOD.

ENDCLASS.
