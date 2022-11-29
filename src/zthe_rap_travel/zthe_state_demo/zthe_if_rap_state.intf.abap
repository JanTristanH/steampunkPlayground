INTERFACE zthe_if_rap_state
  PUBLIC .
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Copy of lhc_Travel
    CONSTANTS:
      BEGIN OF travel_status,
        open     TYPE c LENGTH 1  VALUE 'O', " Open
        accepted TYPE c LENGTH 1  VALUE 'A', " Accepted
        canceled TYPE c LENGTH 1  VALUE 'X', " Cancelled
      END OF travel_status.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  TYPES: ty_keys_acceptTravel   TYPE TABLE FOR ACTION IMPORT   zi_rap_travel_zthe\\travel~acceptTravel,
         ty_result_acceptTravel TYPE TABLE FOR ACTION RESULT zi_rap_travel_zthe\\travel~acceptTravel,
         ty_mapped              TYPE RESPONSE FOR MAPPED EARLY zi_rap_travel_zthe,
         ty_failed              TYPE RESPONSE FOR FAILED EARLY zi_rap_travel_zthe,
         ty_reported            TYPE RESPONSE FOR REPORTED EARLY zi_rap_travel_zthe.

  "! <p class="shorttext synchronized" lang="en">TODO maybe change result to changing as well</p>
  "! TODO maybe refactor to pass read data already
  METHODS acceptTravel
    IMPORTING keys          TYPE  ty_keys_acceptTravel
    CHANGING  mapped        TYPE ty_mapped
              failed        TYPE ty_failed
              reported      TYPE ty_reported
    RETURNING VALUE(result) TYPE ty_result_acceptTravel.

  TYPES: ty_keys_rejecttravel   TYPE TABLE FOR ACTION IMPORT   zi_rap_travel_zthe\\travel~rejecttravel,
         ty_result_rejecttravel TYPE TABLE FOR ACTION RESULT zi_rap_travel_zthe\\travel~rejecttravel.

  METHODS rejectTravel
    IMPORTING keys          TYPE  ty_keys_rejecttravel
    CHANGING  mapped        TYPE ty_mapped
              failed        TYPE ty_failed
              reported      TYPE ty_reported
    RETURNING VALUE(result) TYPE ty_result_rejecttravel.

ENDINTERFACE.
