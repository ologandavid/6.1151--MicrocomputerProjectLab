/*******************************************************************************
* File Name: HSYNC_OUT.h  
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

#if !defined(CY_PINS_HSYNC_OUT_H) /* Pins HSYNC_OUT_H */
#define CY_PINS_HSYNC_OUT_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "HSYNC_OUT_aliases.h"

/* Check to see if required defines such as CY_PSOC5A are available */
/* They are defined starting with cy_boot v3.0 */
#if !defined (CY_PSOC5A)
    #error Component cy_pins_v1_90 requires cy_boot v3.0 or later
#endif /* (CY_PSOC5A) */

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 HSYNC_OUT__PORT == 15 && ((HSYNC_OUT__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

void    HSYNC_OUT_Write(uint8 value) ;
void    HSYNC_OUT_SetDriveMode(uint8 mode) ;
uint8   HSYNC_OUT_ReadDataReg(void) ;
uint8   HSYNC_OUT_Read(void) ;
uint8   HSYNC_OUT_ClearInterrupt(void) ;


/***************************************
*           API Constants        
***************************************/

/* Drive Modes */
#define HSYNC_OUT_DM_ALG_HIZ         PIN_DM_ALG_HIZ
#define HSYNC_OUT_DM_DIG_HIZ         PIN_DM_DIG_HIZ
#define HSYNC_OUT_DM_RES_UP          PIN_DM_RES_UP
#define HSYNC_OUT_DM_RES_DWN         PIN_DM_RES_DWN
#define HSYNC_OUT_DM_OD_LO           PIN_DM_OD_LO
#define HSYNC_OUT_DM_OD_HI           PIN_DM_OD_HI
#define HSYNC_OUT_DM_STRONG          PIN_DM_STRONG
#define HSYNC_OUT_DM_RES_UPDWN       PIN_DM_RES_UPDWN

/* Digital Port Constants */
#define HSYNC_OUT_MASK               HSYNC_OUT__MASK
#define HSYNC_OUT_SHIFT              HSYNC_OUT__SHIFT
#define HSYNC_OUT_WIDTH              1u


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define HSYNC_OUT_PS                     (* (reg8 *) HSYNC_OUT__PS)
/* Data Register */
#define HSYNC_OUT_DR                     (* (reg8 *) HSYNC_OUT__DR)
/* Port Number */
#define HSYNC_OUT_PRT_NUM                (* (reg8 *) HSYNC_OUT__PRT) 
/* Connect to Analog Globals */                                                  
#define HSYNC_OUT_AG                     (* (reg8 *) HSYNC_OUT__AG)                       
/* Analog MUX bux enable */
#define HSYNC_OUT_AMUX                   (* (reg8 *) HSYNC_OUT__AMUX) 
/* Bidirectional Enable */                                                        
#define HSYNC_OUT_BIE                    (* (reg8 *) HSYNC_OUT__BIE)
/* Bit-mask for Aliased Register Access */
#define HSYNC_OUT_BIT_MASK               (* (reg8 *) HSYNC_OUT__BIT_MASK)
/* Bypass Enable */
#define HSYNC_OUT_BYP                    (* (reg8 *) HSYNC_OUT__BYP)
/* Port wide control signals */                                                   
#define HSYNC_OUT_CTL                    (* (reg8 *) HSYNC_OUT__CTL)
/* Drive Modes */
#define HSYNC_OUT_DM0                    (* (reg8 *) HSYNC_OUT__DM0) 
#define HSYNC_OUT_DM1                    (* (reg8 *) HSYNC_OUT__DM1)
#define HSYNC_OUT_DM2                    (* (reg8 *) HSYNC_OUT__DM2) 
/* Input Buffer Disable Override */
#define HSYNC_OUT_INP_DIS                (* (reg8 *) HSYNC_OUT__INP_DIS)
/* LCD Common or Segment Drive */
#define HSYNC_OUT_LCD_COM_SEG            (* (reg8 *) HSYNC_OUT__LCD_COM_SEG)
/* Enable Segment LCD */
#define HSYNC_OUT_LCD_EN                 (* (reg8 *) HSYNC_OUT__LCD_EN)
/* Slew Rate Control */
#define HSYNC_OUT_SLW                    (* (reg8 *) HSYNC_OUT__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define HSYNC_OUT_PRTDSI__CAPS_SEL       (* (reg8 *) HSYNC_OUT__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define HSYNC_OUT_PRTDSI__DBL_SYNC_IN    (* (reg8 *) HSYNC_OUT__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define HSYNC_OUT_PRTDSI__OE_SEL0        (* (reg8 *) HSYNC_OUT__PRTDSI__OE_SEL0) 
#define HSYNC_OUT_PRTDSI__OE_SEL1        (* (reg8 *) HSYNC_OUT__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define HSYNC_OUT_PRTDSI__OUT_SEL0       (* (reg8 *) HSYNC_OUT__PRTDSI__OUT_SEL0) 
#define HSYNC_OUT_PRTDSI__OUT_SEL1       (* (reg8 *) HSYNC_OUT__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define HSYNC_OUT_PRTDSI__SYNC_OUT       (* (reg8 *) HSYNC_OUT__PRTDSI__SYNC_OUT) 


#if defined(HSYNC_OUT__INTSTAT)  /* Interrupt Registers */

    #define HSYNC_OUT_INTSTAT                (* (reg8 *) HSYNC_OUT__INTSTAT)
    #define HSYNC_OUT_SNAP                   (* (reg8 *) HSYNC_OUT__SNAP)

#endif /* Interrupt Registers */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_HSYNC_OUT_H */


/* [] END OF FILE */
