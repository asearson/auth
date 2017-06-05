view: schema_info {
  sql_table_name: panopticon_public.schema_info ;;

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
