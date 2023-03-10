/*******************************************************************************
* File Name: E.h  
* Version 1.80
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

#if !defined(CY_PINS_E_H) /* Pins E_H */
#define CY_PINS_E_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "E_aliases.h"

/* Check to see if required defines such as CY_PSOC5A are available */
/* They are defined starting with cy_boot v3.0 */
#if !defined (CY_PSOC5A)
    #error Component cy_pins_v1_80 requires cy_boot v3.0 or later
#endif /* (CY_PSOC5A) */

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 E__PORT == 15 && ((E__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

void    E_Write(uint8 value) ;
void    E_SetDriveMode(uint8 mode) ;
uint8   E_ReadDataReg(void) ;
uint8   E_Read(void) ;
uint8   E_ClearInterrupt(void) ;


/***************************************
*           API Constants        
***************************************/

/* Drive Modes */
#define E_DM_ALG_HIZ         PIN_DM_ALG_HIZ
#define E_DM_DIG_HIZ         PIN_DM_DIG_HIZ
#define E_DM_RES_UP          PIN_DM_RES_UP
#define E_DM_RES_DWN         PIN_DM_RES_DWN
#define E_DM_OD_LO           PIN_DM_OD_LO
#define E_DM_OD_HI           PIN_DM_OD_HI
#define E_DM_STRONG          PIN_DM_STRONG
#define E_DM_RES_UPDWN       PIN_DM_RES_UPDWN

/* Digital Port Constants */
#define E_MASK               E__MASK
#define E_SHIFT              E__SHIFT
#define E_WIDTH              1u


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define E_PS                     (* (reg8 *) E__PS)
/* Data Register */
#define E_DR                     (* (reg8 *) E__DR)
/* Port Number */
#define E_PRT_NUM                (* (reg8 *) E__PRT) 
/* Connect to Analog Globals */                                                  
#define E_AG                     (* (reg8 *) E__AG)                       
/* Analog MUX bux enable */
#define E_AMUX                   (* (reg8 *) E__AMUX) 
/* Bidirectional Enable */                                                        
#define E_BIE                    (* (reg8 *) E__BIE)
/* Bit-mask for Aliased Register Access */
#define E_BIT_MASK               (* (reg8 *) E__BIT_MASK)
/* Bypass Enable */
#define E_BYP                    (* (reg8 *) E__BYP)
/* Port wide control signals */                                                   
#define E_CTL                    (* (reg8 *) E__CTL)
/* Drive Modes */
#define E_DM0                    (* (reg8 *) E__DM0) 
#define E_DM1                    (* (reg8 *) E__DM1)
#define E_DM2                    (* (reg8 *) E__DM2) 
/* Input Buffer Disable Override */
#define E_INP_DIS                (* (reg8 *) E__INP_DIS)
/* LCD Common or Segment Drive */
#define E_LCD_COM_SEG            (* (reg8 *) E__LCD_COM_SEG)
/* Enable Segment LCD */
#define E_LCD_EN                 (* (reg8 *) E__LCD_EN)
/* Slew Rate Control */
#define E_SLW                    (* (reg8 *) E__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define E_PRTDSI__CAPS_SEL       (* (reg8 *) E__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define E_PRTDSI__DBL_SYNC_IN    (* (reg8 *) E__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define E_PRTDSI__OE_SEL0        (* (reg8 *) E__PRTDSI__OE_SEL0) 
#define E_PRTDSI__OE_SEL1        (* (reg8 *) E__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define E_PRTDSI__OUT_SEL0       (* (reg8 *) E__PRTDSI__OUT_SEL0) 
#define E_PRTDSI__OUT_SEL1       (* (reg8 *) E__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define E_PRTDSI__SYNC_OUT       (* (reg8 *) E__PRTDSI__SYNC_OUT) 


#if defined(E__INTSTAT)  /* Interrupt Registers */

    #define E_INTSTAT                (* (reg8 *) E__INTSTAT)
    #define E_SNAP                   (* (reg8 *) E__SNAP)

#endif /* Interrupt Registers */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_E_H */


/* [] END OF FILE */
