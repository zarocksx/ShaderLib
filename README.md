# ShaderLib
ShaderLib is a library of shader for the godot engine.

It allow you to easly look at shader you have, and allow you to reuse them easly.

![alt text](https://snipboard.io/nBQWm9.jpg)


# Shaders
Actually are 10 shaders in the list :

 1. Interrior Mapping.
 2. Fresnel effect.
 3. Dissolve.
 4. Hologram.
 5. Chromatic aberrations.
 6. Outline grid.
 7. Atmosphere.
 8. Galaxy.
 9. Glitch.
 10. Refractive.

## Create shader

To add you own shader easly you have to follow these simple steps :

 - Create a folder in the `shaders` folder with the name of your new shader.
 - Duplicate the demo scene from `template_blank_scene` and moving this new scene in your folder.
 - Be sure to make the mesh from your scene unique.
 - Create and add your shader.
 - Duplicate a shaderBtn from the `Menu` scene, put the name of you shader as text and edit the pressed event to modify the value of the arg binded to be the name of your shader.
 - In the `Viewport` node of the `Menu` scene add a new entry to the Dictionary with the name of your shader as *key* and the scene you have created as *object*
