view: audit {
  sql_table_name: panopticon_public.audit ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: action_type {
    type: string
    sql: ${TABLE}.action_type ;;
  }

  dimension: auth_session {
    type: string
    sql: ${TABLE}.auth_session ;;
  }

  dimension: looker_host_id {
    type: string
    sql: ${TABLE}.looker_host_id ;;
  }

  dimension: looker_id {
    type: number
    sql: ${TABLE}.looker_id ;;
  }

  dimension: new_value {
    type: string
    sql: ${TABLE}.new_value ;;
  }

  dimension: old_value {
    type: string
    sql: ${TABLE}.old_value ;;
  }

  dimension: purpose {
    type: string
    sql: ${TABLE}.purpose ;;
  }

  dimension: server_version {
    type: string
    sql: ${TABLE}.server_version ;;
  }

  dimension: target_user_id {
    type: number
    sql: ${TABLE}.target_user_id ;;
  }

  dimension: purpose_category_id {
    type: number
    sql: ${TABLE}.purpose_category_id ;;
    drill_fields: [id, user.id, user.first_name, user.last_name, purpose, created_time]
  }

  dimension_group: created {
    type: time
    datatype: datetime
    timeframes: [time, day_of_week, date, week, month, year]
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

dimension: ticketId {
  type: string
  sql: SUBSTRING(${purpose}, LOCATE('1',${purpose}), 6) ;;
}

  measure: count {
    type: count
    drill_fields: [id, user.id, user.first_name, user.last_name, purpose, created_time]
  }

  measure: host_count {
   type: count_distinct
   sql: ${looker_host_id} ;;
   drill_fields: [looker_host_id, count]
 }

  # looker host id is a string
  measure: minutes_on_host {
    type: count_distinct
    sql: CONCAT(${looker_host_id},FLOOR(UNIX_TIMESTAMP(${TABLE}.time)/60),'|',${user_id}) ;;
  }

  measure: count_distinct_auths {
    type: count_distinct
    sql: CONCAT(${user_id},'|',${looker_host_id}) ;;
    drill_fields: [id, user.id, user.first_name, user.last_name, purpose, created_time]
  }
}
