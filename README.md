# prettylight
Pretty lights for Game Maker

- [Screenshots](#screenshots)
- [Credits](#credits)
- [Prerequisites](#prerequisites)
- [Setting Up](#setting-up)
- [Drawing Lights](#drawing-lights)
  - [Ambient Lighting](#ambient-lighting)
- [Light Sprites](#light-sprites)
- [Extra Effects](#extra-effects)
  - [Vivid Lighting](#vivid-lighting)
  - [Ambient Blurring](#ambient-blurring)

## Screenshots

![Tercon Major](http://i.imgur.com/jMfCAMY.png)

![Protocol](http://i.imgur.com/NN0c4ex.png)

![Ahriman's Treasure](http://i.imgur.com/YEpCTx5.png)

![Skolgbor](http://i.imgur.com/QEYSaAh.png)

## Credits

prettylight is a simplistic and powerful lighting engine for use with GameMaker: Studio. It features code by FatalSleep and xygthop3, who are amazing coders and I can't thank them enough for the resources they create.

Please give credit to **Nik Sudan, FatalSleep and xygthop3** if you decide to use it in your projects!

## Prerequisites

prettylight requires a few things in your project in order for it to function.

- A view
- A light sprite called ```sprLight```
- A light controller object
- At least one light object

prettylight comes with a prebuilt light controller and parent object, but you can implement their functionality into other objects.

## Setting Up

The lights are controlled with the light controller object. This should have a pretty low depth so it runs before other objects. The controller object needs to run 4 functions:

- ``` lights_init( shaders? , view_id ) ``` - this sets up the lighting system, call this in a **creation or trigger event**
- ``` lights_step() ``` - this processes the lighting system, call this in a **step event**
- ``` lights_draw() ``` - this controls the drawing for the lighting system, call this in the **draw gui event**
- ``` lights_finish() ``` - this ends the lighting system, call this in the **room/game end event**

For the function ``` lights_init() ```,  "shaders?" defines whether or not to apply shaders to the lighting system and "view_id" is the id 0-15 of whichever view you wish to enable lighting on.

## Drawing Lights

In order to draw lights you need to register light objects. You can do this with the function ``` lights_add( obj1, obj2, obj3, ... ) ```. Typical usage would be registering a light parent object using this.

Call the light_set() script or each of the other five scripts individually to set up your light object. Just make sure that all the properties are set, otherwise an error will be thrown.

- ``` light_set_alpha( value ) ``` - sets the light's alpha
- ``` light_set_color( colour ) ``` - sets the light's colour
- ``` light_set_scale( xscale, yscale ) ``` - sets the light's scale
- ``` light_set_spite( sprite, index ) ``` - sets the light's sprite
- ``` light_set_offset( xoffset, yoffset ) ``` - sets the light's x,y offset

A master function called ``` light_set() ``` exists that can modify all potential properties.

### Ambient Lighting

In the light controller you can specify ambient lighting. This will get displayed in areas that aren't lit up. To modify this, use the function ``` lights_set_ambience( colour, alpha ) ```. I've specified one I normally use in the controller that's included - it produces a nice brooding blue overlay.

## Light Sprites

In prettylight, lights rely on sprites. A basic radial one is included, but you can introduce more interesting patterns with ease. Lights need to be in a certain way for it to function properly:

- Lights should only use white
- A white area indicates a fully lit section
- A transparent area indicates a non-lit section

The one sprite that's included with the package, ```sprLight```, is required for the package to work, so don't modify it!

## Extra Effects

Two extra effects are enabled by default, but you can turn these off.

### Vivid Lighting

This amplifies lights in general and really brings out the colour used. This isn't very intensive but with lots of lights it might slow down the game a little bit. 

- ``` lights_set_vivid( active? ) ``` - whether to enable vivid lighting

### Ambient Blurring

This makes use of xygthop3's gaussian blur shaders, and it makes everything look all bloomy and fuzzy and nice. This can be very intensive and might not work for older computers, so be sure to make it some sort of option if you decide to use it. If you turn off shaders in ``` lights_init() ``` blurring will not work. You can configure this with three functions:

- ``` lights_set_blur( active? ) ``` - whether to enable ambient blurring
- ``` lights_set_blur_alpha( alpha ) ``` - the alpha overlay (1 = fully blurred, 0 = no blur)
- ``` lights_set_blur_amount( amount ) ``` - the blur amount (the bigger the number, the more intensive it is)
