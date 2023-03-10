.ifndef INCLUDED_CYFITTERGNU_INC
.set INCLUDED_CYFITTERGNU_INC, 1
.include "cydevicegnu.inc"
.include "cydevicegnu_trm.inc"

/* A */
.set A__0__MASK, 0x08
.set A__0__PC, CYREG_PRT5_PC3
.set A__0__PORT, 5
.set A__0__SHIFT, 3
.set A__AG, CYREG_PRT5_AG
.set A__AMUX, CYREG_PRT5_AMUX
.set A__BIE, CYREG_PRT5_BIE
.set A__BIT_MASK, CYREG_PRT5_BIT_MASK
.set A__BYP, CYREG_PRT5_BYP
.set A__CTL, CYREG_PRT5_CTL
.set A__DM0, CYREG_PRT5_DM0
.set A__DM1, CYREG_PRT5_DM1
.set A__DM2, CYREG_PRT5_DM2
.set A__DR, CYREG_PRT5_DR
.set A__INP_DIS, CYREG_PRT5_INP_DIS
.set A__LCD_COM_SEG, CYREG_PRT5_LCD_COM_SEG
.set A__LCD_EN, CYREG_PRT5_LCD_EN
.set A__MASK, 0x08
.set A__PORT, 5
.set A__PRT, CYREG_PRT5_PRT
.set A__PRTDSI__CAPS_SEL, CYREG_PRT5_CAPS_SEL
.set A__PRTDSI__DBL_SYNC_IN, CYREG_PRT5_DBL_SYNC_IN
.set A__PRTDSI__OE_SEL0, CYREG_PRT5_OE_SEL0
.set A__PRTDSI__OE_SEL1, CYREG_PRT5_OE_SEL1
.set A__PRTDSI__OUT_SEL0, CYREG_PRT5_OUT_SEL0
.set A__PRTDSI__OUT_SEL1, CYREG_PRT5_OUT_SEL1
.set A__PRTDSI__SYNC_OUT, CYREG_PRT5_SYNC_OUT
.set A__PS, CYREG_PRT5_PS
.set A__SHIFT, 3
.set A__SLW, CYREG_PRT5_SLW

/* B */
.set B__0__MASK, 0x04
.set B__0__PC, CYREG_PRT5_PC2
.set B__0__PORT, 5
.set B__0__SHIFT, 2
.set B__AG, CYREG_PRT5_AG
.set B__AMUX, CYREG_PRT5_AMUX
.set B__BIE, CYREG_PRT5_BIE
.set B__BIT_MASK, CYREG_PRT5_BIT_MASK
.set B__BYP, CYREG_PRT5_BYP
.set B__CTL, CYREG_PRT5_CTL
.set B__DM0, CYREG_PRT5_DM0
.set B__DM1, CYREG_PRT5_DM1
.set B__DM2, CYREG_PRT5_DM2
.set B__DR, CYREG_PRT5_DR
.set B__INP_DIS, CYREG_PRT5_INP_DIS
.set B__LCD_COM_SEG, CYREG_PRT5_LCD_COM_SEG
.set B__LCD_EN, CYREG_PRT5_LCD_EN
.set B__MASK, 0x04
.set B__PORT, 5
.set B__PRT, CYREG_PRT5_PRT
.set B__PRTDSI__CAPS_SEL, CYREG_PRT5_CAPS_SEL
.set B__PRTDSI__DBL_SYNC_IN, CYREG_PRT5_DBL_SYNC_IN
.set B__PRTDSI__OE_SEL0, CYREG_PRT5_OE_SEL0
.set B__PRTDSI__OE_SEL1, CYREG_PRT5_OE_SEL1
.set B__PRTDSI__OUT_SEL0, CYREG_PRT5_OUT_SEL0
.set B__PRTDSI__OUT_SEL1, CYREG_PRT5_OUT_SEL1
.set B__PRTDSI__SYNC_OUT, CYREG_PRT5_SYNC_OUT
.set B__PS, CYREG_PRT5_PS
.set B__SHIFT, 2
.set B__SLW, CYREG_PRT5_SLW

/* C */
.set C__0__MASK, 0x02
.set C__0__PC, CYREG_PRT5_PC1
.set C__0__PORT, 5
.set C__0__SHIFT, 1
.set C__AG, CYREG_PRT5_AG
.set C__AMUX, CYREG_PRT5_AMUX
.set C__BIE, CYREG_PRT5_BIE
.set C__BIT_MASK, CYREG_PRT5_BIT_MASK
.set C__BYP, CYREG_PRT5_BYP
.set C__CTL, CYREG_PRT5_CTL
.set C__DM0, CYREG_PRT5_DM0
.set C__DM1, CYREG_PRT5_DM1
.set C__DM2, CYREG_PRT5_DM2
.set C__DR, CYREG_PRT5_DR
.set C__INP_DIS, CYREG_PRT5_INP_DIS
.set C__LCD_COM_SEG, CYREG_PRT5_LCD_COM_SEG
.set C__LCD_EN, CYREG_PRT5_LCD_EN
.set C__MASK, 0x02
.set C__PORT, 5
.set C__PRT, CYREG_PRT5_PRT
.set C__PRTDSI__CAPS_SEL, CYREG_PRT5_CAPS_SEL
.set C__PRTDSI__DBL_SYNC_IN, CYREG_PRT5_DBL_SYNC_IN
.set C__PRTDSI__OE_SEL0, CYREG_PRT5_OE_SEL0
.set C__PRTDSI__OE_SEL1, CYREG_PRT5_OE_SEL1
.set C__PRTDSI__OUT_SEL0, CYREG_PRT5_OUT_SEL0
.set C__PRTDSI__OUT_SEL1, CYREG_PRT5_OUT_SEL1
.set C__PRTDSI__SYNC_OUT, CYREG_PRT5_SYNC_OUT
.set C__PS, CYREG_PRT5_PS
.set C__SHIFT, 1
.set C__SLW, CYREG_PRT5_SLW

/* D */
.set D__0__MASK, 0x04
.set D__0__PC, CYREG_PRT12_PC2
.set D__0__PORT, 12
.set D__0__SHIFT, 2
.set D__AG, CYREG_PRT12_AG
.set D__BIE, CYREG_PRT12_BIE
.set D__BIT_MASK, CYREG_PRT12_BIT_MASK
.set D__BYP, CYREG_PRT12_BYP
.set D__DM0, CYREG_PRT12_DM0
.set D__DM1, CYREG_PRT12_DM1
.set D__DM2, CYREG_PRT12_DM2
.set D__DR, CYREG_PRT12_DR
.set D__INP_DIS, CYREG_PRT12_INP_DIS
.set D__MASK, 0x04
.set D__PORT, 12
.set D__PRT, CYREG_PRT12_PRT
.set D__PRTDSI__DBL_SYNC_IN, CYREG_PRT12_DBL_SYNC_IN
.set D__PRTDSI__OE_SEL0, CYREG_PRT12_OE_SEL0
.set D__PRTDSI__OE_SEL1, CYREG_PRT12_OE_SEL1
.set D__PRTDSI__OUT_SEL0, CYREG_PRT12_OUT_SEL0
.set D__PRTDSI__OUT_SEL1, CYREG_PRT12_OUT_SEL1
.set D__PRTDSI__SYNC_OUT, CYREG_PRT12_SYNC_OUT
.set D__PS, CYREG_PRT12_PS
.set D__SHIFT, 2
.set D__SIO_CFG, CYREG_PRT12_SIO_CFG
.set D__SIO_DIFF, CYREG_PRT12_SIO_DIFF
.set D__SIO_HYST_EN, CYREG_PRT12_SIO_HYST_EN
.set D__SIO_REG_HIFREQ, CYREG_PRT12_SIO_REG_HIFREQ
.set D__SLW, CYREG_PRT12_SLW

/* E */
.set E__0__MASK, 0x02
.set E__0__PC, CYREG_PRT12_PC1
.set E__0__PORT, 12
.set E__0__SHIFT, 1
.set E__AG, CYREG_PRT12_AG
.set E__BIE, CYREG_PRT12_BIE
.set E__BIT_MASK, CYREG_PRT12_BIT_MASK
.set E__BYP, CYREG_PRT12_BYP
.set E__DM0, CYREG_PRT12_DM0
.set E__DM1, CYREG_PRT12_DM1
.set E__DM2, CYREG_PRT12_DM2
.set E__DR, CYREG_PRT12_DR
.set E__INP_DIS, CYREG_PRT12_INP_DIS
.set E__MASK, 0x02
.set E__PORT, 12
.set E__PRT, CYREG_PRT12_PRT
.set E__PRTDSI__DBL_SYNC_IN, CYREG_PRT12_DBL_SYNC_IN
.set E__PRTDSI__OE_SEL0, CYREG_PRT12_OE_SEL0
.set E__PRTDSI__OE_SEL1, CYREG_PRT12_OE_SEL1
.set E__PRTDSI__OUT_SEL0, CYREG_PRT12_OUT_SEL0
.set E__PRTDSI__OUT_SEL1, CYREG_PRT12_OUT_SEL1
.set E__PRTDSI__SYNC_OUT, CYREG_PRT12_SYNC_OUT
.set E__PS, CYREG_PRT12_PS
.set E__SHIFT, 1
.set E__SIO_CFG, CYREG_PRT12_SIO_CFG
.set E__SIO_DIFF, CYREG_PRT12_SIO_DIFF
.set E__SIO_HYST_EN, CYREG_PRT12_SIO_HYST_EN
.set E__SIO_REG_HIFREQ, CYREG_PRT12_SIO_REG_HIFREQ
.set E__SLW, CYREG_PRT12_SLW

/* F */
.set F__0__MASK, 0x08
.set F__0__PC, CYREG_PRT12_PC3
.set F__0__PORT, 12
.set F__0__SHIFT, 3
.set F__AG, CYREG_PRT12_AG
.set F__BIE, CYREG_PRT12_BIE
.set F__BIT_MASK, CYREG_PRT12_BIT_MASK
.set F__BYP, CYREG_PRT12_BYP
.set F__DM0, CYREG_PRT12_DM0
.set F__DM1, CYREG_PRT12_DM1
.set F__DM2, CYREG_PRT12_DM2
.set F__DR, CYREG_PRT12_DR
.set F__INP_DIS, CYREG_PRT12_INP_DIS
.set F__MASK, 0x08
.set F__PORT, 12
.set F__PRT, CYREG_PRT12_PRT
.set F__PRTDSI__DBL_SYNC_IN, CYREG_PRT12_DBL_SYNC_IN
.set F__PRTDSI__OE_SEL0, CYREG_PRT12_OE_SEL0
.set F__PRTDSI__OE_SEL1, CYREG_PRT12_OE_SEL1
.set F__PRTDSI__OUT_SEL0, CYREG_PRT12_OUT_SEL0
.set F__PRTDSI__OUT_SEL1, CYREG_PRT12_OUT_SEL1
.set F__PRTDSI__SYNC_OUT, CYREG_PRT12_SYNC_OUT
.set F__PS, CYREG_PRT12_PS
.set F__SHIFT, 3
.set F__SIO_CFG, CYREG_PRT12_SIO_CFG
.set F__SIO_DIFF, CYREG_PRT12_SIO_DIFF
.set F__SIO_HYST_EN, CYREG_PRT12_SIO_HYST_EN
.set F__SIO_REG_HIFREQ, CYREG_PRT12_SIO_REG_HIFREQ
.set F__SLW, CYREG_PRT12_SLW

/* G */
.set G__0__MASK, 0x01
.set G__0__PC, CYREG_PRT12_PC0
.set G__0__PORT, 12
.set G__0__SHIFT, 0
.set G__AG, CYREG_PRT12_AG
.set G__BIE, CYREG_PRT12_BIE
.set G__BIT_MASK, CYREG_PRT12_BIT_MASK
.set G__BYP, CYREG_PRT12_BYP
.set G__DM0, CYREG_PRT12_DM0
.set G__DM1, CYREG_PRT12_DM1
.set G__DM2, CYREG_PRT12_DM2
.set G__DR, CYREG_PRT12_DR
.set G__INP_DIS, CYREG_PRT12_INP_DIS
.set G__MASK, 0x01
.set G__PORT, 12
.set G__PRT, CYREG_PRT12_PRT
.set G__PRTDSI__DBL_SYNC_IN, CYREG_PRT12_DBL_SYNC_IN
.set G__PRTDSI__OE_SEL0, CYREG_PRT12_OE_SEL0
.set G__PRTDSI__OE_SEL1, CYREG_PRT12_OE_SEL1
.set G__PRTDSI__OUT_SEL0, CYREG_PRT12_OUT_SEL0
.set G__PRTDSI__OUT_SEL1, CYREG_PRT12_OUT_SEL1
.set G__PRTDSI__SYNC_OUT, CYREG_PRT12_SYNC_OUT
.set G__PS, CYREG_PRT12_PS
.set G__SHIFT, 0
.set G__SIO_CFG, CYREG_PRT12_SIO_CFG
.set G__SIO_DIFF, CYREG_PRT12_SIO_DIFF
.set G__SIO_HYST_EN, CYREG_PRT12_SIO_HYST_EN
.set G__SIO_REG_HIFREQ, CYREG_PRT12_SIO_REG_HIFREQ
.set G__SLW, CYREG_PRT12_SLW

/* P */
.set P__0__MASK, 0x01
.set P__0__PC, CYREG_PRT5_PC0
.set P__0__PORT, 5
.set P__0__SHIFT, 0
.set P__AG, CYREG_PRT5_AG
.set P__AMUX, CYREG_PRT5_AMUX
.set P__BIE, CYREG_PRT5_BIE
.set P__BIT_MASK, CYREG_PRT5_BIT_MASK
.set P__BYP, CYREG_PRT5_BYP
.set P__CTL, CYREG_PRT5_CTL
.set P__DM0, CYREG_PRT5_DM0
.set P__DM1, CYREG_PRT5_DM1
.set P__DM2, CYREG_PRT5_DM2
.set P__DR, CYREG_PRT5_DR
.set P__INP_DIS, CYREG_PRT5_INP_DIS
.set P__LCD_COM_SEG, CYREG_PRT5_LCD_COM_SEG
.set P__LCD_EN, CYREG_PRT5_LCD_EN
.set P__MASK, 0x01
.set P__PORT, 5
.set P__PRT, CYREG_PRT5_PRT
.set P__PRTDSI__CAPS_SEL, CYREG_PRT5_CAPS_SEL
.set P__PRTDSI__DBL_SYNC_IN, CYREG_PRT5_DBL_SYNC_IN
.set P__PRTDSI__OE_SEL0, CYREG_PRT5_OE_SEL0
.set P__PRTDSI__OE_SEL1, CYREG_PRT5_OE_SEL1
.set P__PRTDSI__OUT_SEL0, CYREG_PRT5_OUT_SEL0
.set P__PRTDSI__OUT_SEL1, CYREG_PRT5_OUT_SEL1
.set P__PRTDSI__SYNC_OUT, CYREG_PRT5_SYNC_OUT
.set P__PS, CYREG_PRT5_PS
.set P__SHIFT, 0
.set P__SLW, CYREG_PRT5_SLW

/* Miscellaneous */
/* -- WARNING: define names containing LEOPARD or PANTHER are deprecated and will be removed in a future release */
.set CYDEV_DEBUGGING_DPS_SWD_SWV, 6
.set CYDEV_CONFIG_UNUSED_IO_AllowButWarn, 0
.set CYDEV_CONFIGURATION_MODE_COMPRESSED, 0
.set CYDEV_CONFIG_FASTBOOT_ENABLED, 1
.set CYDEV_CHIP_REV_PSOC5LP_PRODUCTION, 0
.set CYDEV_CHIP_REVISION_5B_PRODUCTION, 0
.set CYDEV_CHIP_MEMBER_5B, 3
.set CYDEV_CHIP_FAMILY_PSOC5, 3
.set CYDEV_CHIP_DIE_PSOC5LP, 3
.set CYDEV_CHIP_DIE_EXPECT, CYDEV_CHIP_DIE_PSOC5LP
.set BCLK__BUS_CLK__HZ, 24000000
.set BCLK__BUS_CLK__KHZ, 24000
.set BCLK__BUS_CLK__MHZ, 24
.set CYDEV_CHIP_DIE_ACTUAL, CYDEV_CHIP_DIE_EXPECT
.set CYDEV_CHIP_DIE_LEOPARD, 1
.set CYDEV_CHIP_DIE_PANTHER, 2
.set CYDEV_CHIP_DIE_UNKNOWN, 0
.set CYDEV_CHIP_FAMILY_PSOC3, 1
.set CYDEV_CHIP_FAMILY_PSOC4, 2
.set CYDEV_CHIP_FAMILY_UNKNOWN, 0
.set CYDEV_CHIP_FAMILY_USED, CYDEV_CHIP_FAMILY_PSOC5
.set CYDEV_CHIP_JTAG_ID, 0x2E123069
.set CYDEV_CHIP_MEMBER_3A, 1
.set CYDEV_CHIP_MEMBER_5A, 2
.set CYDEV_CHIP_MEMBER_UNKNOWN, 0
.set CYDEV_CHIP_MEMBER_USED, CYDEV_CHIP_MEMBER_5B
.set CYDEV_CHIP_REVISION_3A_ES1, 0
.set CYDEV_CHIP_REVISION_3A_ES2, 1
.set CYDEV_CHIP_REVISION_3A_ES3, 3
.set CYDEV_CHIP_REVISION_3A_PRODUCTION, 3
.set CYDEV_CHIP_REVISION_5A_ES0, 0
.set CYDEV_CHIP_REVISION_5A_ES1, 1
.set CYDEV_CHIP_REVISION_5A_PRODUCTION, 1
.set CYDEV_CHIP_REVISION_5B_ES0, 0
.set CYDEV_CHIP_REVISION_USED, CYDEV_CHIP_REVISION_5B_PRODUCTION
.set CYDEV_CHIP_REV_EXPECT, CYDEV_CHIP_REV_PSOC5LP_PRODUCTION
.set CYDEV_CHIP_REV_LEOPARD_ES1, 0
.set CYDEV_CHIP_REV_LEOPARD_ES2, 1
.set CYDEV_CHIP_REV_LEOPARD_ES3, 3
.set CYDEV_CHIP_REV_LEOPARD_PRODUCTION, 3
.set CYDEV_CHIP_REV_PANTHER_ES0, 0
.set CYDEV_CHIP_REV_PANTHER_ES1, 1
.set CYDEV_CHIP_REV_PANTHER_PRODUCTION, 1
.set CYDEV_CHIP_REV_PSOC5LP_ES0, 0
.set CYDEV_CONFIGURATION_COMPRESSED, 1
.set CYDEV_CONFIGURATION_DMA, 0
.set CYDEV_CONFIGURATION_ECC, 1
.set CYDEV_CONFIGURATION_IMOENABLED, CYDEV_CONFIG_FASTBOOT_ENABLED
.set CYDEV_CONFIGURATION_MODE, CYDEV_CONFIGURATION_MODE_COMPRESSED
.set CYDEV_CONFIGURATION_MODE_DMA, 2
.set CYDEV_CONFIGURATION_MODE_UNCOMPRESSED, 1
.set CYDEV_CONFIG_UNUSED_IO, CYDEV_CONFIG_UNUSED_IO_AllowButWarn
.set CYDEV_CONFIG_UNUSED_IO_AllowWithInfo, 1
.set CYDEV_CONFIG_UNUSED_IO_Disallowed, 2
.set CYDEV_DEBUGGING_DPS, CYDEV_DEBUGGING_DPS_SWD_SWV
.set CYDEV_DEBUGGING_DPS_Disable, 3
.set CYDEV_DEBUGGING_DPS_JTAG_4, 1
.set CYDEV_DEBUGGING_DPS_JTAG_5, 0
.set CYDEV_DEBUGGING_DPS_SWD, 2
.set CYDEV_DEBUGGING_ENABLE, 1
.set CYDEV_DEBUGGING_REQXRES, 1
.set CYDEV_DEBUGGING_XRES, 0
.set CYDEV_DEBUG_ENABLE_MASK, 0x20
.set CYDEV_DEBUG_ENABLE_REGISTER, CYREG_MLOGIC_DEBUG
.set CYDEV_DMA_CHANNELS_AVAILABLE, 24
.set CYDEV_ECC_ENABLE, 0
.set CYDEV_HEAP_SIZE, 0x1000
.set CYDEV_INSTRUCT_CACHE_ENABLED, 1
.set CYDEV_INTR_RISING, 0x00000000
.set CYDEV_PROJ_TYPE, 0
.set CYDEV_PROJ_TYPE_BOOTLOADER, 1
.set CYDEV_PROJ_TYPE_LOADABLE, 2
.set CYDEV_PROJ_TYPE_MULTIAPPBOOTLOADER, 3
.set CYDEV_PROJ_TYPE_STANDARD, 0
.set CYDEV_PROTECTION_ENABLE, 0
.set CYDEV_STACK_SIZE, 0x4000
.set CYDEV_USE_BUNDLED_CMSIS, 1
.set CYDEV_VARIABLE_VDDA, 0
.set CYDEV_VDDA_MV, 5000
.set CYDEV_VDDD_MV, 5000
.set CYDEV_VDDIO0_MV, 5000
.set CYDEV_VDDIO1_MV, 5000
.set CYDEV_VDDIO2_MV, 5000
.set CYDEV_VDDIO3_MV, 5000
.set CYDEV_VIO0, 5
.set CYDEV_VIO0_MV, 5000
.set CYDEV_VIO1, 5
.set CYDEV_VIO1_MV, 5000
.set CYDEV_VIO2, 5
.set CYDEV_VIO2_MV, 5000
.set CYDEV_VIO3, 5
.set CYDEV_VIO3_MV, 5000
.set DMA_CHANNELS_USED__MASK0, 0x00000000
.set CYDEV_BOOTLOADER_ENABLE, 0
.endif
