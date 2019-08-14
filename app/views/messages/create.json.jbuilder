json.content @message.content
json.avatar @message.user.avatar
json.user_name @message.user.name
json.date @message.created_at.strftime("%Y/%m/%d %H:%M")
json.id @message.id

