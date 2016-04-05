# Description
#   Display your id and name
#
# Commands:
#   hubot who am i? - Display your id and name
#
# Author:
#   tsmsogn

module.exports = (robot) ->
  robot.respond /who am i\?/i, (msg) ->
    msg.reply 'your id, name = ' + [msg.message.user.id, msg.message.user.name].join(', ')
