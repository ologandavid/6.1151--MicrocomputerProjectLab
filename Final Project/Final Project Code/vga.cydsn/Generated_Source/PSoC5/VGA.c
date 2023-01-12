/*******************************************************************************
* File Name: VGA.c  
* Version 1.90
*
* Description:
*  This file contains API to enable firmware control of a Pins component.
*
* Note:
*
********************************************************************************
* Copyright 2008-2012, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#include "cytypes.h"
#include "VGA.h"

/* APIs are not generated for P15[7:6] on PSoC 5 */
#if !(CY_PSOC5A &&\
	 VGA__PORT == 15 && ((VGA__MASK & 0xC0) != 0))


/*******************************************************************************
* Function Name: VGA_Write
********************************************************************************
*
* Summary:
*  Assign a new value to the digital port's data output register.  
*
* Parameters:  
*  prtValue:  The value to be assigned to the Digital Port. 
*
* Return: 
*  None
*  
*******************************************************************************/
void VGA_Write(uint8 value) 
{
    uint8 staticBits = (VGA_DR & (uint8)(~VGA_MASK));
    VGA_DR = staticBits | ((uint8)(value << VGA_SHIFT) & VGA_MASK);
}


/*******************************************************************************
* Function Name: VGA_SetDriveMode
********************************************************************************
*
* Summary:
*  Change the drive mode on the pins of the port.
* 
* Parameters:  
*  mode:  Change the pins to this drive mode.
*
* Return: 
*  None
*
*******************************************************************************/
void VGA_SetDriveMode(uint8 mode) 
{
	CyPins_SetPinDriveMode(VGA_0, mode);
	CyPins_SetPinDriveMode(VGA_1, mode);
	CyPins_SetPinDriveMode(VGA_2, mode);
	CyPins_SetPinDriveMode(VGA_3, mode);
	CyPins_SetPinDriveMode(VGA_4, mode);
	CyPins_SetPinDriveMode(VGA_5, mode);
}


/*******************************************************************************
* Function Name: VGA_Read
********************************************************************************
*
* Summary:
*  Read the current value on the pins of the Digital Port in right justified 
*  form.
*
* Parameters:  
*  None
*
* Return: 
*  Returns the current value of the Digital Port as a right justified number
*  
* Note:
*  Macro VGA_ReadPS calls this function. 
*  
*******************************************************************************/
uint8 VGA_Read(void) 
{
    return (VGA_PS & VGA_MASK) >> VGA_SHIFT;
}


/*******************************************************************************
* Function Name: VGA_ReadDataReg
********************************************************************************
*
* Summary:
*  Read the current value assigned to a Digital Port's data output register
*
* Parameters:  
*  None 
*
* Return: 
*  Returns the current value assigned to the Digital Port's data output register
*  
*******************************************************************************/
uint8 VGA_ReadDataReg(void) 
{
    return (VGA_DR & VGA_MASK) >> VGA_SHIFT;
}


/* If Interrupts Are Enabled for this Pins component */ 
#if defined(VGA_INTSTAT) 

    /*******************************************************************************
    * Function Name: VGA_ClearInterrupt
    ********************************************************************************
    * Summary:
    *  Clears any active interrupts attached to port and returns the value of the 
    *  interrupt status register.
    *
    * Parameters:  
    *  None 
    *
    * Return: 
    *  Returns the value of the interrupt status register
    *  
    *******************************************************************************/
    uint8 VGA_ClearInterrupt(void) 
    {
        return (VGA_INTSTAT & VGA_MASK) >> VGA_SHIFT;
    }

#endif /* If Interrupts Are Enabled for this Pins component */ 

#endif /* CY_PSOC5A... */

    
/* [] END OF FILE */
