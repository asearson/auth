view: purpose_category {
  sql_table_name: panopticon_public.purpose_category ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}
