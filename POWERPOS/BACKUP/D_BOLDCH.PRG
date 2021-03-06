/*
浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
�  System          :  PowerPOS for Specialty Shop                         �
�  Program I.D.    :  D_BOLDCH.PRG                                        �
�  Description     :  Display Running Total/Balance Due/ Change Amount    �
�                     in BOLD characters                                  �
�  Author          :  jay ocampo                                          �
�  Date Started    :  November 1994                                       �
�  Last Revision   :                                                      �
�  Remarks         :                                                      �
藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
*/

#include "GRFX_ALL.CH"
#include "powerpos.ch"

/*---------------------------------------------------------------------------*/


FUNCTION Disp_BoldChar( namount, cTitle )

/*  Usage : Display Running Total/Change
    Descr : 
    Parm  :
            namount  -> total amount of purchased items or
                        total amount change
            cTitle   -> optional parameter 
                 
    Return: NIL
*/
    
  // Handle omitted parameters
  cTitle := IIF( cTitle == NIL, "Total Amount", cTitle)

  // Clear amount region only unless specified
  IF (PCOUNT() == 2)
   
     // Draw Button-Style BOX
     gDrawBox(45, 3, 98, 21, BUTTON_UP_LINE,,,SOLID_FILL, CFG_DFILL, MSCALE, 4)
 
     // Draw Box Title Line
     gDrawLine(46, 9, 97, 9, BUTTON_UP_LINE, NORM_WIDTH, CFG_DFILL, MSCALE)

     // Display Box Title 
     //  
     //gDrawText(3, 71, cTitle, TRIPLEX_FONT, 3, CFG_DFILL, MSCALE, CENTER_TEXT)
     gDrawText(3, 71, cTitle, TRIPLEX_FONT, 3, CFG_DNORM, MSCALE, CENTER_TEXT)      
               
  ELSE       
     // Clear Amount region
     gClearTo( 46, 10, 97, 20, CFG_DFILL)
     
  ENDIF

  #ifdef USD_CURRENCY
  	gDrawText(10,47,"$",TRIPLEX_FONT, 5, CFG_DNORM, MSCALE, LEFT_TEXT)
  #endif 

  // Display amount
  gDrawText(10, 96, TRANSFORM(namount, "9,999,999.99"), ;
            TRIPLEX_FONT, 5, CFG_DNORM, MSCALE, RIGHT_TEXT)
   //
  
RETURN NIL


 