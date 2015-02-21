# prettylight
Pretty lights for Game Maker

- [Credits](#credits)
- [Prerequisites](#prerequisites)
- [Setting Up](#setting-up)
- [Drawing Lights](#drawing-lights)
  - [Ambient Lighting](#ambient-lighting)
- [Light Sprites](#light-sprites)
- [Extra Effects](#extra-effects)
  - [Vivid Lighting](#vivid-lighting)
  - [Ambient Blurring](#ambient-blurring)

## Credits

prettylight is a lighting engine constructed by Nik Sudan that uses modified code originally by **xygthop3** and **Fatalsleep**. These guys are amazing coders and I can't thank them enough for the resources they create.

Please give credit to all of us if you decide to use it in your projects!

## Prerequisites

prettylight requires a few things in your project in order for it to function.

- A view with an index of 0
- A light sprite called ```sprLight```
- A light controller object
- A light parent object

prettylight comes with a prebuilt light controller and parent object, but you can implement their functionality into other objects.

## Setting Up

The lights are controlled with the light controller object. This should have a pretty low depth so it runs before other objects. The controller object needs to run 4 functions:

- ``` lights_init() ``` - this sets up the lighting system, call this in a **creation or trigger event**
- ``` lights_step() ``` - this processes the lighting system, call this in a **step event**
- ``` lights_draw() ``` - this controls the drawing for the lighting system, call this in the **draw gui event**
- ``` lights_finish() ``` - this ends the lighting system, call this in the **room/game end event**

You'll also need to setup a light parent object. One comes with the package.

## Drawing Lights

To draw lights, you must set the parent of the object you'd like to light up to the light parent object. Next, in the **create event**, declare the function ``` event_inherited() ``` to finish declaring a basic light. You may customise the way the light looks with a few functions.

- ``` light_set_alpha( value ) ``` - sets the light's alpha
- ``` light_set_color( colour ) ``` - sets the light's colour
- ``` light_set_scale( xscale, yscale ) ``` - sets the light's scale
- ``` light_set_spite( sprite, index ) ``` - sets the light's sprite

A master function called ``` light_set() ``` exists that can modify all potential properties.

### Ambient Lighting

In the light controller you can specify ambient lighting. This will get displayed in areas that aren't lit up. To modify this, use the function ``` lights_set_ambience(  colour, alpha ) ```. I've specified one I normally use in the controller that's included - it produces a nice brooding blue overlay.

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

This makes use of xygthop3's gaussian blur shaders, and it makes everything look all bloomy and fuzzy and nice. This can be very intensive and might not work for older computers, so be sure to make it some sort of option if you decide to use it. You can configure this with three functions:

- ``` lights_set_blur( active? ) ``` - whether to enable ambient blurring
- ``` lights_set_blur_alpha( alpha ) ``` - the alpha overlay (1 = fully blurred, 0 = no blur)
- ``` lights_set_blur_amount( amount ) ``` - the blur amount (the bigger the number, the more intensive it is)
