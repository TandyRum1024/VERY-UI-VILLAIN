///vui_update()
var ELEMENTS = guiELEMENT;
var CURRENT,ITEMS,C_ITEM,TYPE;

//Mouse coords
var MX = window_mouse_get_x();
var MY = window_mouse_get_y();

//Grid size
var SIZE = ds_grid_height(ELEMENTS);

for (var i=0;i<SIZE;i++)
{
    CURRENT = ELEMENTS[# 0, i];
    //Check the GUI's visible-ness
    if (CURRENT.visible)
    {
        ITEMS = CURRENT.ITEMS;
        
        //Loop thru all elements
        for (var j=0;j<ds_list_size(ITEMS);j++)
        {
            C_ITEM = ITEMS[| j];
            TYPE = C_ITEM.TYPE;
            
            //Update position
            C_ITEM.x = C_ITEM.OX + CURRENT.x;
            C_ITEM.y = C_ITEM.OY + CURRENT.y;
            
            if (TYPE == uiTYPE.BUTTON)
            {
                var DET = point_in_rectangle(MX, MY, C_ITEM.x, C_ITEM.y, C_ITEM.x + C_ITEM.W, C_ITEM.y + C_ITEM.H);
                
                //If the mouse is colliding with button?
                if (DET)
                {
                    var MOUSSE_DOWN = mouse_check_button(mb_left);
                    
                    //YEAAA BOOTIEZ
                    C_ITEM.DOWN = MOUSSE_DOWN;
                    C_ITEM.HOVER = true;
                    C_ITEM.CLICK = mouse_check_button_pressed(mb_left);
                    C_ITEM.RELEASE = mouse_check_button_released(mb_left);
                    
                    //Set button's sprite index
                    if (MOUSSE_DOWN)
                    {
                        C_ITEM.BTNIND = 2;
                    }
                    else
                    {
                        C_ITEM.BTNIND = 1;
                    }
                }
                else
                {
                    //The button is not even ready 4 dis
                    C_ITEM.DOWN = false;
                    C_ITEM.HOVER = false;
                    C_ITEM.CLICK = false;
                    //Juuuust in case of releasing mouse & leaving the button's bounds
                    C_ITEM.RELEASE = mouse_check_button_released(mb_left);
                    C_ITEM.BTNIND = 0;
                }
            }
        }
        
        //Grab thing
        var UX = CURRENT.x;
        var UY = CURRENT.y;
        
        if (point_in_rectangle(MX, MY, UX, UY, UX + CURRENT.W, UY + 30) && mouse_check_button_pressed(mb_left) && GRAB == -1)
        {
            //Setup some grabby thing,
            GRAB = CURRENT;
            GX = UX - MX;
            GY = UY - MY;
            
            //Pushie :3
            for (var g=0;g<SIZE;g++)
            {
                ELEMENTS[# 1, g]++;
            }
            
            //And nudge this shit into oblivion.
            ELEMENTS[# 1, i] = 0;
            guiUPDATEPLZ = true;
        }
    }
}

//Release those GUI(s) when not grabbing.
if (mouse_check_button_released(mb_left))
{
    GRAB = -1;
    GX = 0;
    GY = 0;
}

//Now update the depth thing
if (guiUPDATEPLZ)
{
    //Here's some trick :
    // use ds_grid instead of array for easy sort.
    // It's easy as eating rice cake while laying down and dying from suffocation.
    ds_grid_sort(guiELEMENT, 1, 0);
    
    //Reset the variable, to sort it only once
    guiUPDATEPLZ = false;
}

//Update the currently grabbed one.
GRAB.x = MX + GX;
GRAB.y = MY + GY;
