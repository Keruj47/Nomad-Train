#Centering worldborder on a player (unless the train is in the Nether) and setting it's size
worldborder set 200
execute in minecraft:the_nether unless entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute at @p run worldborder center ~ ~

#Creating data storage
data merge storage nt:worldborder_center_marker {Pos:[0d,0d,0d]}

#Creating scoreboards
scoreboard objectives add nt.Nether_multiplier dummy
scoreboard objectives add nt.coordinates_X dummy
scoreboard objectives add nt.coordinates_Y dummy
scoreboard objectives add nt.coordinates_Z dummy
scoreboard objectives add nt.Nether_coordinates_X dummy
scoreboard objectives add nt.Nether_coordinates_Z dummy
scoreboard objectives add nt.run_only_once dummy
scoreboard objectives add nt.numbers dummy

#Setting nt.numbers values
scoreboard players set 0 nt.numbers 0
scoreboard players set 1 nt.numbers 1

#Changing the value times_run from nt.run_only_once scoreboard to be not null
scoreboard players add times_run nt.run_only_once 0

#Running run_only_once function (if times_run value from nt.run_only_once scoreboard is less than 1)
execute if score times_run nt.run_only_once < 1 nt.numbers run function nomad_train:run_only_once

#Running tick function (to set-up the worldborder from the first tick, thus avoiding possible gap between load and first tick after load)
function nomad_train:tick

#Load message
tellraw @a ["Load message from ",{"text":"Nomad Train","color":"#00FF00"}," datapack: "]
tellraw @a ["Hello ",{"selector":"@a","color":"yellow"}]
tellraw @a ["Train info: ",{"selector":"@e[type=create:carriage_contraption,limit=1]","color":"gold"}]