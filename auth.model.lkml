connection: "auth"

include: "*view"

explore: audit {
  hidden: yes
  join: user {
    sql_on: ${audit.user_id} = ${user.id} ;;
    relationship: many_to_one
  }

  join: purpose_category {
    sql_on: ${audit.purpose_category_id} = ${purpose_category.id} ;;
    relationship: many_to_one
  }
}

explore: user {
  hidden: yes
  join: session {
    sql_on: ${session.user_id} = ${user.id} ;;
    relationship: one_to_many
  }
}
