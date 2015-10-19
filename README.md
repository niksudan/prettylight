<p align="center"><img width="150" src="http://i.imgur.com/R6cqqDc.png"></p>
<h1 align="center">prettylight</h1>
<p align="center">Pretty lights for GameMaker</p>

Version 2.0

prettylight is a powerful lighting engine for use with GameMaker: Studio. It makes use of surfaces and shaders to give you a simple to use yet optimal solution to your problems in need of lighting up!

## Screenshots

![](http://i.imgur.com/8lQR4pk.png)
![](http://i.imgur.com/820eNjo.png)

## Credits

Lots of lighting help by **FatalSleep**, gaussian blur shaders written by **xygthop3**.

## Usage

### Setting Up

prettylight doesn't need much to work. It needs the appropriate scripts and shaders to run properly, that's all.

First things first, you'll want to initialise the system within your control object. Simply call `pl_init()` in your **create event** to set up the engine, and preferably add all light object parents within the `pl_add()` method. For example, all your light sources would be children of an object called `objLight` - you'd then add that parent object to the light objects list in order for it to work. This is so the engine knows which objects it should mess with when lighting things up!

You'll need to process the engine in a **step event** of your choosing (**begin step** is preferred) using `pl_update()`, draw the lights in the **draw event** with `pl_draw()`, and end the system in the **room end**/**game end** event using `pl_end()`.

You'll also need a view to draw the lights. prettylight is currently set to process in the view with id 0 (the default one).

### Making Lights

In order for something to light up, make sure it or it's parent is added to the light object list using `pl_add(obj1, obj2, ...)` as stated above. Then simply call `pl_light_init(radius, colour, alpha)` in your create event. You may modify your light using the available methods, but please note you can't specify a radius larger than the one you initially put in.

### Customisation

You may toggle certain options using the provided scripts:

- `pl_set_vivid(active?)` - toggles vivid lighting (uses additional surface)
- `pl_set_blurring(active?)` - toggles blurring (uses shaders)
- `pl_option_set_ambience(color, brightness)` - make changes to the ambience
- `pl_option_set_blur(amount, alpha)` - make changes to the blur

## What's Next?

prettylight is currently maintained primarily by [Nik Sudan](http://github.com/niksudan), but I'm more than happy to approve merge requests that help the project develop even further! Future features that would be cool include:

- Shadow casters (pretty much coded, needs optimising though!)
- Ambient blur (was in version 1, would be nice to have a comeback!)
- Light styles (cartoony, pixelly, etc.)
