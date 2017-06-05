view: user {
  sql_table_name: panopticon_public.user ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: is_admin {
    type: yesno
    sql: ${TABLE}.is_admin ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, audit.count]
  }
}
