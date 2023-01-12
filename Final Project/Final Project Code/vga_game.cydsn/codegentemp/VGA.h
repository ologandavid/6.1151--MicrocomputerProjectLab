/*******************************************************************************
* File Name: VGA.h  
* Version 1.90
*
* Description:
*  This file containts Control Register function prototypes and register defines
*
* Note:
*
********************************************************************************
* Copyright 2008-2012, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_VGA_H) /* Pins VGA_H */
#define CY_PINS_VGA_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "VGA_aliases.h"

/* Check to see if required defines such as CY_PSOC5A are available */
/* They are defined starting with cy_boot v3.0 */
#if !defined (CY_PSOC5A)
    #error Component cy_pins_v1_90 requires cy_boot v3.0 or later
#endif /* (CY_PSOC5A) */

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 VGA__PORT == 15 && ((VGA__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

void    VGA_Write(uint8 value) ;
void    VGA_SetDriveMode(uint8 mode) ;
uint8   VGA_ReadDataReg(void) ;
uint8   VGA_Read(void) ;
uint8   VGA_ClearInterrupt(void) ;


/***************************************
*           API Constants        
***************************************/

/* Drive Modes */
#define VGA_DM_ALG_HIZ         PIN_DM_ALG_HIZ
#define VGA_DM_DIG_HIZ         PIN_DM_DIG_HIZ
#define VGA_DM_RES_UP          PIN_DM_RES_UP
#define VGA_DM_RES_DWN         PIN_DM_RES_DWN
#define VGA_DM_OD_LO           PIN_DM_OD_LO
#define VGA_DM_OD_HI           PIN_DM_OD_HI
#define VGA_DM_STRONG          PIN_DM_STRONG
#define VGA_DM_RES_UPDWN       PIN_DM_RES_UPDWN

/* Digital Port Constants */
#define VGA_MASK               VGA__MASK
#define VGA_SHIFT              VGA__SHIFT
#define VGA_WIDTH              6u


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define VGA_PS                     (* (reg8 *) VGA__PS)
/* Data Register */
#define VGA_DR                     (* (reg8 *) VGA__DR)
/* Port Number */
#define VGA_PRT_NUM                (* (reg8 *) VGA__PRT) 
/* Connect to Analog Globals */                                                  
#define VGA_AG                     (* (reg8 *) VGA__AG)                       
/* Analog MUX bux enable */
#define VGA_AMUX                   (* (reg8 *) VGA__AMUX) 
/* Bidirectional Enable */                                                        
#define VGA_BIE                    (* (reg8 *) VGA__BIE)
/* Bit-mask for Aliased Register Access */
#define VGA_BIT_MASK               (* (reg8 *) VGA__BIT_MASK)
/* Bypass Enable */
#define VGA_BYP                    (* (reg8 *) VGA__BYP)
/* Port wide control signals */                                                   
#define VGA_CTL                    (* (reg8 *) VGA__CTL)
/* Drive Modes */
#define VGA_DM0                    (* (reg8 *) VGA__DM0) 
#define VGA_DM1                    (* (reg8 *) VGA__DM1)
#define VGA_DM2                    (* (reg8 *) VGA__DM2) 
/* Input Buffer Disable Override */
#define VGA_INP_DIS                (* (reg8 *) VGA__INP_DIS)
/* LCD Common or Segment Drive */
#define VGA_LCD_COM_SEG            (* (reg8 *) VGA__LCD_COM_SEG)
/* Enable Segment LCD */
#define VGA_LCD_EN                 (* (reg8 *) VGA__LCD_EN)
/* Slew Rate Control */
#define VGA_SLW                    (* (reg8 *) VGA__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define VGA_PRTDSI__CAPS_SEL       (* (reg8 *) VGA__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define VGA_PRTDSI__DBL_SYNC_IN    (* (reg8 *) VGA__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define VGA_PRTDSI__OE_SEL0        (* (reg8 *) VGA__PRTDSI__OE_SEL0) 
#define VGA_PRTDSI__OE_SEL1        (* (reg8 *) VGA__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define VGA_PRTDSI__OUT_SEL0       (* (reg8 *) VGA__PRTDSI__OUT_SEL0) 
#define VGA_PRTDSI__OUT_SEL1       (* (reg8 *) VGA__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define VGA_PRTDSI__SYNC_OUT       (* (reg8 *) VGA__PRTDSI__SYNC_OUT) 


#if defined(VGA__INTSTAT)  /* Interrupt Registers */

    #define VGA_INTSTAT                (* (reg8 *) VGA__INTSTAT)
    #define VGA_SNAP                   (* (reg8 *) VGA__SNAP)

#endif /* Interrupt Registers */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_VGA_H */


/* [] END OF FILE */
