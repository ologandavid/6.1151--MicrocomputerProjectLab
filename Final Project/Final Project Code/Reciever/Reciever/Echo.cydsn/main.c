/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * ========================================
*/
#include <project.h>

int main()
{
    
    CyGlobalIntEnable; /* Enable global interrupts. */

    /* Place your initialization/startup code here (e.g. MyInst_Start()) */
    unsigned char j = 255;
    UART_1_Init();
    UART_1_Start();
    //UART_2_Init();
    //UART_2_Start();
    LCD_Char_1_Start();
	LCD_Char_1_ClearDisplay();
    LCD_Char_1_PrintString("OUT : ");
    /*
    int k = 0;
    char response[3];
    while(k<3){
        if (UART_1_GetRxBufferSize() > 0) {
            uint8 c = UART_1_GetChar();
            response[k]= c;
            k++;
        }
        }
    LCD_Char_1_Position(0, 6);
	LCD_Char_1_PrintString("     ");			// clean up the previous display
	LCD_Char_1_Position(0, 6); 
    LCD_Char_1_PrintString(response);
    */    
    
    for(;;)
    {   
        int i;
        LCD_Char_1_Position(0, 6);
		LCD_Char_1_PrintString("     ");			// clean up the previous display
		LCD_Char_1_Position(0, 6); 
        char response[3];
        for(i=0; i<3; i++){
        if (UART_1_GetRxBufferSize() > 0) {
            uint8 c = UART_1_GetChar();
            response[i]= c;
        }
        }
        //LCD_Char_1_PrintString(response);
        //UART_2_PutString(response);
        CyDelay(j);
        //CyDelay(j);
    }

}

/* [] END OF FILE */
