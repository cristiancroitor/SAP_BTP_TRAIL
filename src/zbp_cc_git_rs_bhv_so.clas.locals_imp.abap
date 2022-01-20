CLASS lhc_ZCC_GIT_RS_BHV_SO DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zcc_git_rs_bhv_so RESULT result.

ENDCLASS.

CLASS lhc_ZCC_GIT_RS_BHV_SO IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
