CLASS zthe_cl_rap_state_open DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES: zthe_if_rap_state.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zthe_cl_rap_state_open IMPLEMENTATION.
  METHOD zthe_if_rap_state~accepttravel.
      " Set the new overall status
    MODIFY ENTITIES OF zi_rap_travel_ZTHE IN LOCAL MODE
      ENTITY Travel
         UPDATE
           FIELDS ( TravelStatus )
           WITH VALUE #( FOR key IN keys
                           ( %tky         = key-%tky
                             TravelStatus = zthe_if_rap_state~travel_status-accepted ) )
      FAILED failed
      REPORTED reported.

    " Fill the response table
    READ ENTITIES OF zi_rap_travel_ZTHE IN LOCAL MODE
      ENTITY Travel
        ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    result = VALUE #( FOR travel IN travels
                        ( %tky   = travel-%tky
                          %param = travel ) ).

  ENDMETHOD.

  METHOD zthe_if_rap_state~rejecttravel.
    " Set the new overall status
    MODIFY ENTITIES OF zi_rap_travel_ZTHE IN LOCAL MODE
      ENTITY Travel
         UPDATE
           FIELDS ( TravelStatus )
           WITH VALUE #( FOR key IN keys
                           ( %tky         = key-%tky
                             TravelStatus = zthe_if_rap_state~travel_status-canceled ) )
      FAILED failed
      REPORTED reported.

    " Fill the response table
    READ ENTITIES OF zi_rap_travel_ZTHE IN LOCAL MODE
      ENTITY Travel
        ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    result = VALUE #( FOR travel IN travels
                        ( %tky   = travel-%tky
                          %param = travel ) ).
  ENDMETHOD.

ENDCLASS.
