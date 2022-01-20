@AbapCatalog.sqlViewName: 'ZCCGITRSSO'
@EndUserText.label: 'Sales Order Header with Behavior'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED

define root view ZCC_GIT_RS_BHV_SO
  as select from sadl_rs_so_root as Document
  composition [0..*] of ZCC_GIT_RS_BHV_ITEM as _Items
//  association [0..*] to SADL_RS_BHV_SO as _others on $projection.buyer_id = _others.buyer_id
{
  key Document.id,
      Document.seller_id,
      Document.buyer_id,
      cast ( Document.act_indicator as boole_d preserving type ) as act_indicator,
      Document.type_code,
      _Items
//      _others
}
