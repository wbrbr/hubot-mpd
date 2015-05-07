# Description: 
#  Run MPD commands with Hubot
# 
# Dependencies: 
#  "mpd": ""
# 
# Commands:
#  hubot mpd <command> - Run the command
#  hubot mpd current - Display the current song and artist
# 
# Notes: 
#  A list of the MPD commands is available on the MPD protocol specification
#
# Author: 
#  nounoursheureux

mpd = require 'mpd'
cmd = mpd.cmd

client = mpd.connect {port: process.env.HUBOT_MPD_PORT || 6600, host: process.env.HUBOT_MPD_HOST || 'localhost'}


module.exports = (robot) ->
    robot.respond /mpd (.+)/i, (res) ->
        switch res.match[1]
            when 'current'
                client.sendCommand cmd('currentsong',[]),(err,msg) ->
                    if msg
                        title = msg.split('\n')[2]
                        artist = msg.split('\n')[3]
                        res.send "#{title} -- #{artist}"
            else
                client.sendCommand cmd(res.match[1],res.match.slice(2,-1)), (err,msg) ->
                    if err then res.send "Command not found: #{res.match[1]}"
                    else if msg then res.send msg
