///vui_draw_gui(GUI)
//var GUI = guiELEMENT;

var GUID = argument0;//GUI[# 0,argument0];
var STYLE = GUID.STYLE;

var X = GUID.x;
var Y = GUID.y;
var W = GUID.W;
var H = GUID.H;

/* DRAW BASE PANEL */

if (STYLE == 0) //NADA
{
    //DUH
}
else if (STYLE == 1) //COLOUR
{
    var C = GUID.COL;
    draw_rectangle_colour(X, Y, X+GUID.W, Y+GUID.H, C, C, C, C, false);
}
else if (STYLE == 2) //TILED
{
    draw_sprite_stretched(sGUI_TILE, 0, X, Y, GUID.W, GUID.H);
}
else if (STYLE == 3) //DOS
{
    var C = GUID.COL;
    
    draw_rectangle_colour(X, Y, X+W, Y+H, C, C, C, C, false);
    
    draw_line_width_colour(X+6, Y+6, X+W-6, Y+6, 4, c_ltgray, c_ltgray);
    draw_line_width_colour(X+W-8, Y+6, X+W-8, Y+H-6, 4, c_ltgray, c_ltgray);
    draw_line_width_colour(X+6, Y+H-6, X+W-6, Y+H-6, 4, c_ltgray, c_ltgray);
    draw_line_width_colour(X+8, Y+H-6, X+8, Y+6, 4, c_ltgray, c_ltgray);
}

/* DRAW TITLE */
var TITLE = GUID.TITLE;
draw_text_transformed(X+4, Y+4, TITLE, 0.5, 0.75, 0);

/* DRAW LIST */
var ITEMS = GUID.ITEMS;
var CURRENT;

for (var i=0;i<ds_list_size(ITEMS);i++)
{
    CURRENT = ITEMS[| i];
    
    //TODO : DRAW SHIT
}
