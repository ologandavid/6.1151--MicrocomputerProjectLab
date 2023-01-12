/*******************************************************************************
* File Name: HSYNC_OUT.c  
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
#include "HSYNC_OUT.h"

/* APIs are not generated for P15[7:6] on PSoC 5 */
#if !(CY_PSOC5A &&\
	 HSYNC_OUT__PORT == 15 && ((HSYNC_OUT__MASK & 0xC0) != 0))


/*******************************************************************************
* Function Name: HSYNC_OUT_Write
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
void HSYNC_OUT_Write(uint8 value) 
{
    uint8 staticBits = (HSYNC_OUT_DR & (uint8)(~HSYNC_OUT_MASK));
    HSYNC_OUT_DR = staticBits | ((uint8)(value << HSYNC_OUT_SHIFT) & HSYNC_OUT_MASK);
}


/*******************************************************************************
* Function Name: HSYNC_OUT_SetDriveMode
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
void HSYNC_OUT_SetDriveMode(uint8 mode) 
{
	CyPins_SetPinDriveMode(HSYNC_OUT_0, mode);
}


/*******************************************************************************
* Function Name: HSYNC_OUT_Read
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
*  Macro HSYNC_OUT_ReadPS calls this function. 
*  
*******************************************************************************/
uint8 HSYNC_OUT_Read(void) 
{
    return (HSYNC_OUT_PS & HSYNC_OUT_MASK) >> HSYNC_OUT_SHIFT;
}


/*******************************************************************************
* Function Name: HSYNC_OUT_ReadDataReg
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
uint8 HSYNC_OUT_ReadDataReg(void) 
{
    return (HSYNC_OUT_DR & HSYNC_OUT_MASK) >> HSYNC_OUT_SHIFT;
}


/* If Interrupts Are Enabled for this Pins component */ 
#if defined(HSYNC_OUT_INTSTAT) 

    /*******************************************************************************
    * Function Name: HSYNC_OUT_ClearInterrupt
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
    uint8 HSYNC_OUT_ClearInterrupt(void) 
    {
        return (HSYNC_OUT_INTSTAT & HSYNC_OUT_MASK) >> HSYNC_OUT_SHIFT;
    }

#endif /* If Interrupts Are Enabled for this Pins component */ 

#endif /* CY_PSOC5A... */

    
/* [] END OF FILE */
