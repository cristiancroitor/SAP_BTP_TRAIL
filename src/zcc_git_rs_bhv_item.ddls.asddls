@AbapCatalog.sqlViewName: 'ZGITRSITBHV'
@EndUserText.label: 'Sales Order Item with RAP Provider'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED

define view ZCC_GIT_RS_BHV_ITEM
  as select from sadl_rs_so_items as Item
  association to parent ZCC_GIT_RS_BHV_SO as _SalesOrder on  $projection.parent_id = _SalesOrder.id
//  association [0..1] to SADL_RS_BHV_PRODUCT as _Product on  $projection.prod_id_content_char = _Product.id_content
//                                                           and $projection.prod_id_scheme_id = _Product.id_scheme_id
//  association [0..*] to SADL_RS_BHV_PRODUCT as _Product on  $projection.prod_id_content_char = _Product.id_content
//  _TypeCodes: to-many asso needed for static action exposure/GW client, see UIA, GW test ZCC_V4_CRUD
//  association [1..*] to SADL_RS_SO_ITEM_BHV as _ItemSiblings on  $projection.parent_id = _ItemSiblings.parent_id
  association [0..*] to ZCC_GIT_RS_BHV_SO as _TypeCodes on  $projection.type_code <> _TypeCodes.type_code  
{
  key Item.id,
      Item.parent_id,
//      Item.parent_id as important_id,
      Item.item_number,
      Item.type_code,
      Item.category,
      Item.prod_id_content,
      Item.prod_id_scheme_id,
      @Semantics.amount.currencyCode : 'currency'
      Item.net_price,
      @Semantics.amount.currencyCode : 'currency'
      Item.gross_price,
      @Semantics.currencyCode: true
      Item.currency,
      Item.prod_id_content_char,
//      cast( 8 as sadl_rs_tc ) as internalTypeCode,
      _SalesOrder,
//      _Product,
      _TypeCodes
//      _ItemSiblings
}
