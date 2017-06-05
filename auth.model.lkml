connection: "auth"

include: "*view"

explore: audit {
  join: user {
    sql_on: ${audit.user_id} = ${user.id} ;;
    relationship: many_to_one
  }
}

explore: user {
}
