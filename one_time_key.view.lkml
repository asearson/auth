view: one_time_key {
  sql_table_name: panopticon.one_time_key ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: expires {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.expires_at ;;
  }

  dimension: looker_host_id {
    type: string
    sql: ${TABLE}.looker_host_id ;;
  }

  dimension: looker_id {
    type: number
    sql: ${TABLE}.looker_id ;;
  }

  dimension: token {
    type: string
    sql: ${TABLE}.token ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
