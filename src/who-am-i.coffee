# Description
#   Show current user info
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   tsmsogn

module.exports = (robot) ->
  robot.respond /who am i\?/i, (msg) ->
    msg.reply msg.message.user.name
