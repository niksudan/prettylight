# 💡 prettylight [![GitHub release](https://img.shields.io/github/release/niksudan/prettylight.svg)](https://github.com/niksudan/prettylight/releases) [![GitHub stars](https://img.shields.io/github/stars/niksudan/prettylight.svg?style=social&label=stars&style)](https://github.com/niksudan/prettylight) [![Marketplace download](https://img.shields.io/badge/marketplace-download-green.svg)](https://marketplace.yoyogames.com/assets/2493/prettylight)

A powerful lighting engine for use with GameMaker: Studio. It makes use of surfaces and shaders to give you a simple to use yet optimal solution to your problems in need of lighting up!

<div style="display: flex;">
  <img src="http://i.imgur.com/8lQR4pk.png" height="200px">
  <img src="http://i.imgur.com/820eNjo.png" height="200px">
</div>

## Usage

### Prerequisites

- [GameMaker: Studio 1](http://www.yoyogames.com/gamemaker)
- The required [scripts](https://github.com/niksudan/prettylight/tree/master/prettylight.gmx/scripts) and [shaders](https://github.com/niksudan/prettylight/tree/master/prettylight.gmx/shaders) added to your project
- Light objects
- A view

### Registration

You should make use of a game control object to register settings and such for the framework.

- Initialise the system in the **create** event with `pl_init()`
- Process the system in the **step/begin step** event with `pl_update()`
- Render the lights in the **draw** event with `pl_draw()`
- Clear the system in the **room end/game end** event with `pl_end()`

### Adding Lights

Initialise a light in the **create** event of a light object with `pl_light_init()`. Make sure that the light object you specify has been registered via `pl_add()`.

**Tip**: Make use of a parent light object to prevent you from having to register every single light object.

## API

### Global Methods

You can customise certain aspects of the framework with the following methods:

#### `pl_option_set_ambience(color, brightness)`

Set the ambience colour and brightness.

#### `pl_option_set_blur(amount, alpha)`

Set the blurring amount and transparency.

#### `pl_set_blurring(active?)`

Set whether blurring should be active.

#### `pl_set_vivid(active?)`

Set whether vivid lighting should be active.

### Light Methods

You can customise each individual light with the following methods:

#### `pl_light_init(radius, colour, alpha)`

Initialise a new light.

#### `pl_light_destroy()`

Destroy the current light.

#### `pl_light_get_alpha()`

Get the transparency of the light.

#### `pl_light_get_color()`

Get the colour of the light.

#### `pl_light_get_radius()`

Get the radius of the light.

#### `pl_light_set_alpha(value)`

Set the transparency of the light.

#### `pl_light_set_color(value)`

Set the colour of the light.

#### `pl_light_set_radius(value)`

Set the radius of the light.

## Credits

- **Nik Sudan** - Scripts and project maintenance
- **FatalSleep** - Scripts
- **xygthop3** - Shaders
