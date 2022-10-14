#Setting the worldborder and worldspawn to the train (if train is in the Overworld)
execute in minecraft:overworld if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute at @e[type=create:carriage_contraption,limit=1] align xz run worldborder center ~ ~
execute in minecraft:overworld if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute at @e[type=create:carriage_contraption,limit=1] align xyz run setworldspawn ~ ~ ~

#Collecting train's coordinates
execute as @a store result score @e[type=create:carriage_contraption,limit=1] nt.coordinates_X run data get entity @e[type=create:carriage_contraption,limit=1] Pos[0]
execute as @a store result score @e[type=create:carriage_contraption,limit=1] nt.coordinates_Y run data get entity @e[type=create:carriage_contraption,limit=1] Pos[1]
execute as @a store result score @e[type=create:carriage_contraption,limit=1] nt.coordinates_Z run data get entity @e[type=create:carriage_contraption,limit=1] Pos[2]

#Multiplying train's coordinates by 8 (if train is in the Nether)
execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run scoreboard players set @e[type=create:carriage_contraption,limit=1] nt.Nether_multiplier 8
execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run scoreboard players operation @e[type=create:carriage_contraption,limit=1] nt.Nether_coordinates_X = @e[type=create:carriage_contraption,limit=1] nt.coordinates_X
execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run scoreboard players operation @e[type=create:carriage_contraption,limit=1] nt.Nether_coordinates_Z = @e[type=create:carriage_contraption,limit=1] nt.coordinates_Z
execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run scoreboard players operation @e[type=create:carriage_contraption,limit=1] nt.Nether_coordinates_X *= @e[type=create:carriage_contraption,limit=1] nt.Nether_multiplier
execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run scoreboard players operation @e[type=create:carriage_contraption,limit=1] nt.Nether_coordinates_Z *= @e[type=create:carriage_contraption,limit=1] nt.Nether_multiplier

#Setting the Pos value in nt:worldborder_center_marker storage to the Nether coordinates
execute store result storage nt:worldborder_center_marker Pos[0] double 1 run scoreboard players get @e[type=create:carriage_contraption,limit=1] nt.Nether_coordinates_X
execute store result storage nt:worldborder_center_marker Pos[1] double 1 run scoreboard players get @e[type=create:carriage_contraption,limit=1] nt.coordinates_Y
execute store result storage nt:worldborder_center_marker Pos[2] double 1 run scoreboard players get @e[type=create:carriage_contraption,limit=1] nt.Nether_coordinates_Z

#Setting marker's Pos value to Pos from nt:worldborder_center_marker storage and forceloading that chunk
execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute in minecraft:overworld at @e[type=marker,tag=nt.worldborder_center_marker] align xz run forceload remove ~ ~ ~ ~
execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute in minecraft:overworld as @e[type=marker,tag=nt.worldborder_center_marker] run data modify entity @s Pos set from storage nt:worldborder_center_marker Pos
execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute in minecraft:overworld at @e[type=marker,tag=nt.worldborder_center_marker] align xz run forceload add ~ ~ ~ ~

#Setting the worldborder and worldspawn to the marker (if train is in the Nether)
execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute in minecraft:overworld at @e[type=marker,tag=nt.worldborder_center_marker] align xz run worldborder center ~ ~
execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute in minecraft:overworld at @e[type=marker,tag=nt.worldborder_center_marker] align xyz run setworldspawn ~ ~ ~

#Removing forceload from all chunks
#execute in minecraft:the_nether if entity @e[type=create:carriage_contraption,limit=1,distance=0..] run execute at @e[type=marker,tag=nt.worldborder_center_marker] align xz run forceload remove ~ ~ ~ ~