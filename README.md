UI-VILLAIN
=====================
![preview image!](http://i.imgur.com/eNryKfO.png)
_A GUI thing for Gamemaker : studio, by PISSENWYY._

-------------------------------------------

## What's this?
An ordinary, UI "framework" for Gamemaker : Studio.

## How do i use this, then?
- ```vui_init()``` - Initializes the whole thing up. (It even includes some nifty colours!)
- ```vui_add_gui(x, y, width, height, style)``` - Adds wee lad GUI, Think about those "window" on your PC.
- ```vui_draw_gui(GUI)``` - Draws the GUI.
- ```vui_draw()``` - Draws the EVERY SINGLE GUI possible :feelsgood:
- ```vui_update()``` - Updates GUI system, something like buttons and depth sorting.

- ```vui_add_panel(gui, x, y, width, height, colour, parent)``` - Adds _PANEL_ element to your GUI.
- ```vui_add_label(gui, x, y, width, height, STRING, colour, parent)``` - Adds _LABEL_ element to Mr. GUI.
- ```vui_add_button(gui, x, y, width, height, STRING, BTN_COLOUR, STR_COLOUR, parent)``` - Adds _BUTTON_ element to Sir McGui II.
- ```vui_add_texPanel(gui, x, y, width, height, texture, parent)``` - Adds _texPANEL_ element to the legendary, elusive, GUI.

## What are those "PANEL" and stuff?

`PANEL` - A **box**, cute lil' coloured box.  
`LABEL` - A **text** that you can shove it up everywhere!  
`texPANEL` - A **textured box**, you can use any textures you want, ranging from sprites' texture, to SURFACES.  
`BUTTON` - A **clicky button**. the button have 4 instance variables :
- CLICK (When you click on them)
- DOWN (You hold it down.)
- HOVER (You hover your cursor OVER them)
- RELEASE (You UN-CLICK your mouse on them.)

---------------------------
