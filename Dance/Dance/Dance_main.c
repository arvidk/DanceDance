/*
 * 	Dance_main.c
 * A part of the DanceDAnce project
 *
 */
 
 
#define B_RS 	 0x01 
#define B_RW	 0x02
#define B_SELECT 0x04
#define B_CS1 	 0x08
#define B_CS2 	 0x10
#define B_RST 	 0x20
#define B_E 	 0x40



#define LCD_ON			0x3F
#define LCD_OFF			0x3E
#define LCD_set_addr	0x40
#define LCD_set_page	0xB8
#define LCD_disp_start	0xC0

#define GPIO_E 0x40021000 /* MD407 port E */
#define portModer ((volatile unsigned long *) (GPIO_E))
#define portOtyper ((volatile unsigned short *) (GPIO_E+0x4)) 
#define portIdr ((volatile unsigned short *)(GPIO_E+0x10)) 

#define portIdrLow ((volatile unsigned char *) (GPIO_E+0x10))
#define portIdrHigh ((volatile unsigned char *) (GPIO_E+0x10+1)) 
#define portOdrLow ((volatile unsigned char*) (GPIO_E+0x14))
#define portOdrHigh ((volatile unsigned char*) (GPIO_E+0x15))

	unsigned long STK_CTRL = 0xE000E010;
	unsigned long STK_LOAD = 0xE000E014;
	unsigned volatile long STK_VAL = 0xE000E018;
 
	typedef unsigned char  unit_8;
	typedef unsigned short unit_16;
	typedef unsigned long  unit_32;

 
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}


void delay_250ns(){
	
	
	*((unsigned long *)STK_CTRL) = 0x00;
	*((unsigned long *)STK_LOAD )=1;
	*((unsigned long *)STK_VAL )=0;
	*((unsigned long *)STK_CTRL) =5;
	while(*((unsigned long *)STK_CTRL) < 0x8){
	}
	*((unsigned long *)STK_CTRL) = 0;
}
void delay_500ns(){
	
	delay_250ns();
	delay_250ns();

}
void delay_mikro(unsigned int ms){
	for (unsigned int j = ms/4; j > 0 ; j--){
		delay_250ns();

	}

}
void delay_milli(unsigned int ms){
	
	
	#ifdef SIMULATOR
	ms=ms/1000;
	ms++;
	#endif
	for(unsigned int i= ms*500; i > 0; i--){
	delay_mikro(2);
	}
}



void graphic_ctrl_bit_set( unit_8 x ) { /* Funktion för att 1-ställa bitar */
unit_8 c;
c = *portOdrLow;
c &= ~B_SELECT;
c |= (~B_SELECT & x);
*portOdrLow = c;
}
void graphic_ctrl_bit_clear( unit_8 x ){
unit_8 c;
c =*portOdrLow;
c &=~B_SELECT;
c &=~x;
*portOdrLow=c;
} 

void select_controller(unit_8 s){
	switch(s){
	case B_CS1 :
		graphic_ctrl_bit_clear(B_CS2);
		graphic_ctrl_bit_set(B_CS1);
		break;
	case B_CS2 :
		graphic_ctrl_bit_clear(B_CS1);
		graphic_ctrl_bit_set(B_CS2);
		break;
	case B_CS1|B_CS2 :
		graphic_ctrl_bit_set(B_CS1|B_CS2);
		break;
	case 0:
		graphic_ctrl_bit_clear(B_CS1|B_CS2);
		break;
	}
}
void graphic_wait_ready(void){
	unit_8 c;
	graphic_ctrl_bit_clear(B_E);
	*portModer= (0x00005555); //sets port 15-8 to inputs and 7-0 to outputs
	*portOdrLow = ((*portOdrLow & ~0x01)| 0x02); //turns off RS and RW on
	delay_500ns();
	
	while(1){
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		c =*portIdrHigh & 0x80;
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
		if(c == 0){
			break;
		}
	}
	
	*portModer= (0x55555555); //sets port 15-8 to outputs
	
}

unit_8 graphic_read_controller( unit_8 controller ){
graphic_ctrl_bit_clear( B_E );
*portModer= (0x00005555);
*portOdrLow = (*portOdrLow | 0x03); //turns on RS and RW
select_controller(controller);
delay_500ns();
graphic_ctrl_bit_set(B_E);
delay_500ns();
unit_8 rv = *portIdrHigh;
graphic_ctrl_bit_clear(B_E);
*portModer= (0x55555555);

	if(controller & B_CS1){
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if (controller & B_CS2){
		select_controller(B_CS2);
		graphic_wait_ready();
	}
return rv;
} 
unit_8 graphic_read_data(unit_8 controller){
	unit_8 rv;
	for(unit_8 i=0;i<2;i++){ //so that it executes it two times
							 //nessecary for some reason
	
graphic_ctrl_bit_clear( B_E );
*portModer= (0x00005555);
*portOdrLow = (*portOdrLow | 0x03); //turns on RS and RW
select_controller(controller);
delay_500ns();
graphic_ctrl_bit_set(B_E);
delay_500ns();

rv = *portIdrHigh;
graphic_ctrl_bit_clear(B_E);
*portModer= (0x55555555);

	if(controller & B_CS1){
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if (controller & B_CS2){
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	
	}
return rv;
	
	}

void graphic_write(unit_8 value, unit_8 controller){ 
	
	*portOdrHigh = value;
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	graphic_ctrl_bit_clear(B_E);
	
	select_controller(controller);
	graphic_wait_ready();

	*portOdrHigh=0x00;
	graphic_ctrl_bit_set(B_E);
	select_controller(0x00);
		
	}
void graphic_write_command(unit_8 cmd, unit_8 controller){
	
	graphic_ctrl_bit_clear(B_E);
	//select_controller(controller);
	*portOdrLow = (*portOdrLow & ~0x03); //turns off RS and RW
	graphic_write(cmd , controller);
	}
void graphic_write_data(unit_8 data, unit_8 controller){
	
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	*portOdrLow = ((*portOdrLow & ~0x02)| 0x01); //turns off RW and RS on
	graphic_write(data , controller);
	}

void graphic_clear_screen(){
	
	graphic_write_command(LCD_set_page,B_CS1|B_CS2);
	graphic_write_command(LCD_set_addr,B_CS1|B_CS2);
	for(unit_8 i=0;i<7;i++){
		graphic_write_command(LCD_set_page | i,B_CS1|B_CS2);
		for(unit_8 j=0;j<63;j++){
			graphic_write_command(LCD_set_addr | j,B_CS1|B_CS2);
			graphic_write_data(0,B_CS1|B_CS2);
		}
	}
}
void lcd_set_data(unit_8 page,unit_8 adress,unit_8 data){
	unit_8 cs = B_CS1;
	if(adress>64){
		cs= B_CS2;
	}
	graphic_write_command(LCD_set_addr|(adress % 64),cs);
	graphic_write_command(LCD_set_page|page,cs);
	graphic_write_data(data,cs);
	}
unit_8 lcd_read_data(unit_8 page,unit_8 adress){
	unit_8 cs = B_CS1;
	if(adress>64){
		cs= B_CS2;
	}
	graphic_write_command(LCD_set_addr|(adress % 64),cs);
	graphic_write_command(LCD_set_page|page,cs);
	return graphic_read_data(cs);
	}


void pixel(unit_8 x,unit_8 y, unit_8 set){
	if((x<1)||(y<1)||(x>128)||(y>64)) return;
	unit_8 mask, controller,c;
	int index;
	index = (y-1)/8;
	mask = 1 << ((y-1)%8);
	if(set == 0){ mask = ~mask;
	}
	
	if(x >64){
		controller =B_CS2;
		x =x-65;
	} else {
		controller =B_CS1;
		x =x-1;
	}
	graphic_write_command(LCD_set_addr |x,controller );
	graphic_write_command(LCD_set_page |index,controller );

	c =graphic_read_data(controller);
	graphic_write_command(LCD_set_addr |x,controller);
	if(set){mask = mask | c;
	}
	else   {mask = mask & c;
	}
	
	graphic_write_data(mask,controller);
}

void init_app(void){
	*portModer  = 0x55555555;
}
void graphic_init(){

	graphic_ctrl_bit_set(B_E);
	delay_mikro(10);
	
	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
	delay_milli(30);
	graphic_ctrl_bit_set(B_RST);
	//delay_milli(100);
	delay_milli(10);
	graphic_write_command(LCD_OFF,			B_CS1|B_CS2);//LCD off
	graphic_write_command(LCD_ON,			B_CS1|B_CS2);//LCD on
	graphic_write_command(LCD_disp_start,	B_CS1|B_CS2);//start=0
	graphic_write_command(LCD_set_addr,		B_CS1|B_CS2);//startadress =0
	graphic_write_command(LCD_set_page,		B_CS1|B_CS2);//page = 0
	select_controller(0x00);
	
	}


int main(void){
	init_app();
	graphic_init();
	
	return 0;
}

