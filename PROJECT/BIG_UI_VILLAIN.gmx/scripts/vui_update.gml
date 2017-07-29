///vui_update()
var ELEMENTS = guiELEMENT;
var CURRENT,ITEMS,C_ITEM,TYPE;

//Mouse coords
var MX = window_mouse_get_x();
var MY = window_mouse_get_y();

for (var i=0;i<ds_grid_height(ELEMENTS);i++)
{
    CURRENT = ELEMENTS[# 0, i];
    ITEMS = CURRENT.ITEMS;
    
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
            
            if (DET)
            {
                var MOUSSE_DOWN = mouse_check_button(mb_left);
                
                C_ITEM.DOWN = MOUSSE_DOWN;
                C_ITEM.HOVER = true;
                C_ITEM.CLICK = mouse_check_button_pressed(mb_left);
                C_ITEM.RELEASE = mouse_check_button_released(mb_left);
                
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
                C_ITEM.DOWN = false;
                C_ITEM.HOVER = false;
                C_ITEM.CLICK = false;
                C_ITEM.RELEASE = mouse_check_button_released(mb_left);
                C_ITEM.BTNIND = 0;
            }
        }
    }
    
    //Grab thing
    var UX = CURRENT.x;
    var UY = CURRENT.y;
    
    if (point_in_rectangle(MX, MY, UX, UY, UX + CURRENT.W, UY + 30) && mouse_check_button_pressed(mb_left))
    {
        GRAB = CURRENT;
        GX = UX - MX;
        GY = UY - MY;
    }
}

if (mouse_check_button_released(mb_left))
{
    GRAB = -1;
    GX = 0;
    GY = 0;
}

GRAB.x = MX + GX;
GRAB.y = MY + GY;
