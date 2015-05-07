# hubot-mpd

Run MPD commands with Hubot

## Installation

First, run `npm install hubot-mpd`.     
Then open the `external-scripts.json` file and add `hubot-mpd`.      

## Usage

`hubot mpd <command>`: run the MPD command.      
Here are some frequently used MPD commands:       
- `play`     
- `pause`   
- `stop`    
- `next`     
- `previous`     
See the MPD protocol specification for an exhaustive list.

I also added a command:      
`hubot mpd current`: return the current song and artist.
