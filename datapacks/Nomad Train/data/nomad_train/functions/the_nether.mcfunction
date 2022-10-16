#Removing forceload from previous chunk, setting marker's Pos value to Pos from nt:worldborder_center_marker storage and forceloading that chunk
#Forceload is needed for the marker to be not lost, positioning the entity on the unloaded chunk means that in the next tick it will be unreachable
execute in minecraft:overworld at @e[type=marker,tag=nt.worldborder_center_marker] align xz run forceload remove ~ ~ ~ ~
execute in minecraft:overworld as @e[type=marker,tag=nt.worldborder_center_marker] run data modify entity @s Pos set from storage nt:worldborder_center_marker Pos
execute in minecraft:overworld at @e[type=marker,tag=nt.worldborder_center_marker] align xz run forceload add ~ ~ ~ ~

#Setting the worldborder and worldspawn to the marker
execute in minecraft:overworld at @e[type=marker,tag=nt.worldborder_center_marker] align xz run worldborder center ~ ~
execute in minecraft:overworld at @e[type=marker,tag=nt.worldborder_center_marker] align xyz run setworldspawn ~ ~ ~
