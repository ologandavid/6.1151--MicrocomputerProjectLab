/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * This file is necessary for your project to build.
 * Please do not delete it.
 *
 * ========================================
*/

#include <device.h>

void main()
{
	
    for(;;)
    {
       	Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in 
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in 
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(750);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(750);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(750);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(750);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(750);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(750);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in milliseconds
        Pin_1_Write(~Pin_1_Read());       // write the value to Pin_1
        CyDelay(250);                     // delay in milliseconds
        CyDelay(1000);
    }
}

/* [] END OF FILE */